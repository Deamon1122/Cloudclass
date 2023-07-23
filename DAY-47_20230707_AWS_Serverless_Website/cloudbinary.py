def lambda_handler(event, context):
    print("In lambda handler")
    
    resp = {
        "statusCode": 200,
        "headers": {
            "Access-Control-Allow-Origin": "*",
        },
        "body": "<html><head><title>LMS</title></head><body><h1>LMS Site!</h1></body></html>"
    }
    
    return resp
