import json
import boto3
from os import environ

ec2 = boto3.client('ec2', region_name='us-east-1')

security_groups = [environ["SG_CONTROL_PLANE"], environ["SG_NODE_GROUP"]]

def lambda_handler(event=None, context=None):
    response = {
        "sg_control_plane":{
            "sg_id":"sg_control_plane",
            "sg_ports":[],
            "sg_cidr_block":[]
        },
        "sg_node_group":{
            "sg_name":"sg_node_group",
            "sg_ports":[],
            "sg_cidr_block":[]
        }
    }

    security_group = ec2.describe_security_groups()
    for sg in security_groups:
        for i in security_group['SecurityGroups']:
            print(i, '\n\n\n')
            if(i['GroupId']) == sg:
                print('deu certo aqui ó', i['GroupId'])
                for j in i['IpPermissions']:
                    try:
                        response[sg]["sg_port"] = str(j['FromPort'])
                        for k in j['IpRanges']:
                            response[sg]["sg_cidr_block"] = k['CidrIp']
                    except Exception:
                        continue
    return {
        'statusCode': 200,
        'body': json.dumps(response)
    }

{
    'Description': 'default VPC security group', 
    'GroupName': 'default', 
    'IpPermissions': [
        {
            'IpProtocol': '-1', 
            'IpRanges': [], 
            'Ipv6Ranges': [], 
            'PrefixListIds': [], 
            'UserIdGroupPairs': [
                {
                    'GroupId': 'sg-05b82493082f5489c', 
                    'UserId': '647614927793'
                }
            ]
        }
    ], 
    'OwnerId': '647614927793', 
    'GroupId': 'sg-05b82493082f5489c', 
    'IpPermissionsEgress': [{'IpProtocol': '-1', 'IpRanges': [{'CidrIp': '0.0.0.0/0'}], 'Ipv6Ranges': [], 'PrefixListIds': [], 'UserIdGroupPairs': []}], 'VpcId': 'vpc-0aff3d5b222863b15'
    } 


print(lambda_handler())

# sg_describe = ec2.describe_security_groups()
#     for i in sg_describe['SecurityGroups']:
#         print("Security Group Name: "+i['GroupName'])
#         print("the Egress rules are as follows: ")
#         for j in i['IpPermissionsEgress']:
#             print("IP Protocol: "+j['IpProtocol'])
#             for k in j['IpRanges']:
#                 print("IP Ranges: "+k['CidrIp'])
#         print("The Ingress rules are as follows: ")
#         for j in i['IpPermissions']:
#             print("IP Protocol: "+j['IpProtocol'])
#             try:
#                 print("PORT: "+str(j['FromPort']))
#                 for k in j['IpRanges']:
#                     print("IP Ranges: "+k['CidrIp'])
#             except Exception:
#                 print("No value for ports and ip ranges available for this security group")
#                 continue