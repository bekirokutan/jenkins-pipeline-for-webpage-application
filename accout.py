import boto3

def get_account_id():
    sts_client = boto3.client('sts')
    response = sts_client.get_caller_identity()
    account_id = response['Account']
    return account_id

account_id = get_account_id()
print("AWS hesap kimliği:", account_id)