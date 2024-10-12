# DynamoDB Infrastructure and Testing with Terraform and Pytest

This project demonstrates how to use Terraform to create a complete AWS VPC infrastructure, including a DynamoDB table, and how to test DynamoDB interactions using `pytest`. The test suite verifies that the table exists, can accept an item, can be listed, and allows item retrieval.

## Table of Contents

1. [Project Overview](#project-overview)
2. [Prerequisites](#prerequisites)
3. [Setting Up the Project](#setting-up-the-project)
4. [Terraform Infrastructure](#terraform-infrastructure)
    - [VPC Creation](#vpc-creation)
    - [DynamoDB Table Creation](#dynamodb-table-creation)
5. [Running the Tests](#running-the-tests)
    - [Testing Strategy](#testing-strategy)
6. [Project Structure](#project-structure)
7. [Cleaning Up](#cleaning-up)

## Project Overview

This project uses Terraform to provision a VPC, subnets, security groups, and a DynamoDB table in AWS. A Python test suite, implemented with `pytest`, tests DynamoDB functionalities, including checking table existence, adding an item, listing tables, and retrieving an item.

## Prerequisites

Before starting, make sure you have the following installed:

- [Terraform](https://www.terraform.io/downloads) (>= 0.13)
- [AWS CLI](https://aws.amazon.com/cli/) (configured with appropriate credentials)
- [Python](https://www.python.org/downloads/) (>= 3.7)
- [pip](https://pip.pypa.io/en/stable/installation/) for managing Python packages
- [pytest](https://docs.pytest.org/en/stable/getting-started.html) for testing
- [boto3](https://boto3.amazonaws.com/v1/documentation/api/latest/index.html) for Python AWS SDK

## Setting Up the Project

1. **Clone the repository:**

   ```bash
   git clone <repository_url>
   cd <repository_name>


## Running the Tests
### Testing Strategy

The Python test suite uses pytest to verify DynamoDB operations. The tests include:

- [Test if the DynamoDB table exists]
- [Test adding an item to the table]
- [Test listing all DynamoDB tables]
- [Test retrieving an item from the table]