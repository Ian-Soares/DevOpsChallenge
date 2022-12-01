import json
import boto3
from os import environ

ec2 = boto3.client('ec2', region_name='us-east-1')

security_groups = [environ['SG_CONTROL_PLANE'], environ['SG_NODE_GROUP']]

def lambda_handler(event, context):
    notify = False
    response = {
        'sg_control_plane':{
            'sg_id':f'{security_groups[0]}',
            'sg_ports':[],
            'sg_cidr_block':[]
        },
        'sg_node_group':{
            'sg_id':f'{security_groups[1]}',
            'sg_ports':[],
            'sg_cidr_block':[]
        }
    }

    security_group = ec2.describe_security_groups()

    for sg in range(len(security_groups)):

        for i in security_group['SecurityGroups']:

            if(i['GroupId']) == security_groups[sg]:
                for j in i['IpPermissions']:
                    try:
                        if(sg == 0):
                            response['sg_control_plane']['sg_ports'].append(str(j['FromPort']))
                            for k in j['IpRanges']:
                                response['sg_control_plane']['sg_cidr_block'].append(k['CidrIp'])
                        else:
                            response['sg_node_group']['sg_ports'].append(str(j['FromPort']))
                            for k in j['IpRanges']:
                                response['sg_node_group']['sg_cidr_block'].append(k['CidrIp'])
                    except:
                        continue

    for cidr in response['sg_control_plane']['sg_cidr_block']:
        if(cidr == '0.0.0.0/0'):
            notify = True
            
    for cidr in response['sg_node_group']['sg_cidr_block']:
        if(cidr == '0.0.0.0/0'):
            notify = True

    if(notify):
        notification = f'There are vulnerable security groups in your account, look at: {response}'
        client = boto3.client('sns')
        response = client.publish (
            TargetArn = "arn:aws:sns:us-east-1:647614927793:vulnerable_sg",
            Message = json.dumps({'default': notification}),
            MessageStructure = 'json'
        )

    return {
        'statusCode': 200,
        'body': json.dumps(response)
    }
