import json

def lambda_handler(event, context):
    return {
        'statusCode': 200,
        'body': json.dumps('Hello Terraform !!! LAMBDA here, How you Doing? for Git Actions')
    }
