import boto3


class DynamoDBLocal:

    
    def __init__(self):

        # Create a DynamoDB client that connects to the local DynamoDB endpoint
        self.dynamodb_client = boto3.client(
            'dynamodb',
            region_name='us-west-2',  # Any valid region name is fine here
            endpoint_url='http://localhost:8000'  # Local endpoint
        )

    def create_table(self, table_name:str):

        # Create a table
        print(f'Creating table:{table_name}')
        table_name = table_name
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

        # Wait for the table to be created
        self.dynamodb_client.get_waiter('table_exists').wait(TableName=table_name)
        print(f'Table "{table_name}" created successfully!')



    def list_tables(self):

        # List all tables, handling pagination
        table_names = []
        last_evaluated_table_name = None

        while True:
            if last_evaluated_table_name:
                response = self.dynamodb_client.list_tables(ExclusiveStartTableName=last_evaluated_table_name)
            else:
                response = self.dynamodb_client.list_tables()

            table_names.extend(response.get('TableNames', []))
            last_evaluated_table_name = response.get('LastEvaluatedTableName')

            if not last_evaluated_table_name:
                break

        print('Tables:', table_names)




dynamodb = DynamoDBLocal()
dynamodb.create_table('Movies')
dynamodb.list_tables()