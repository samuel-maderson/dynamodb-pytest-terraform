import boto3
from pytest import mark
import pytest


class DynamoDBLocal:

    
    def __init__(self, table_name:str):

        # Create a DynamoDB client that connects to the local DynamoDB endpoint
        self.table_name = table_name
        self.dynamodb_client = boto3.client(
            'dynamodb',
            region_name='us-east-1',  # Any valid region name is fine here
        )

        

    def create_table(self):

        table_name = self.table_name

        if self.list_tables() != self.table_name: 
            
            # Create a table
            print(f'Creating table: {table_name}')
            self.dynamodb_client.create_table(
                TableName=table_name,
                KeySchema=[
                    {
                        'AttributeName': 'year',
                        'KeyType': 'HASH'  # Partition key
                    },
                    {
                        'AttributeName': 'title',
                        'KeyType': 'RANGE'  # Sort key
                    }
                ],
                AttributeDefinitions=[
                    {
                        'AttributeName': 'year',
                        'AttributeType': 'N'  # Number
                    },
                    {
                        'AttributeName': 'title',
                        'AttributeType': 'S'  # String
                    }
                ],
                ProvisionedThroughput={
                    'ReadCapacityUnits': 10,
                    'WriteCapacityUnits': 10
                }
            )

        else:
            return 'Table exists'

        # Wait for the table to be created
        return self.dynamodb_client.get_waiter('table_exists').wait(TableName=table_name)


    def list_tables(self):

        response = self.dynamodb_client.list_tables()
        if len(response.get('TableNames')) == 0:
            return False
        table_name = response.get('TableNames')[0]
        
        return table_name



def test_create_table():
    input_data = 'Movies'
    expected = 'Movies'

    dynamodb = DynamoDBLocal(input_data)
    print(dynamodb.create_table())
    response = dynamodb.list_tables()
    assert response == expected