import json
import boto3
from os import environ

ec2 = boto3.client('ec2', region_name='us-east-1')

security_groups = [environ["SG_CONTROL_PLANE"], environ["SG_NODE_GROUP"]]

def lambda_handler(event, context):
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

    for sg in range(len(security_groups)):

        for i in security_group['SecurityGroups']:

            if(i['GroupId']) == security_groups[sg]:
                for j in i['IpPermissions']:
                    try:
                        if(sg == 0):
                            print(str(j['FromPort']))
                            response["sg_control_plane"]["sg_ports"].append(str(j['FromPort']))
                            for k in j['IpRanges']:
                                response["sg_control_plane"]["sg_cidr_block"].append(k['CidrIp'])
                        else:
                            print(str(j['FromPort']))
                            response["sg_node_group"]["sg_ports"].append(str(j['FromPort']))
                            for k in j['IpRanges']:
                                response["sg_node_group"]["sg_cidr_block"].append(k['CidrIp'])
                    except:
                        continue
    return {
        'statusCode': 200,
        'body': json.dumps(response)
    }
