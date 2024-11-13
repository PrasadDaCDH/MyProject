import boto3

session = boto3.Session()
ec2 = session.resource('ec2')

def launch_instance():
    instances = ec2.create_instances(
        ImageId='ami-0507f77897697c4ba',
        InstanceType='t2.micro',
        MinCount=1,
        MaxCount=1,
        KeyName='your_key_pair_name',
        SecurityGroupIds=['your_security_group_id'],
        SubnetId='your_subnet_id',
        UserData='#!/bin/bash\n'
                 '# Your userdata script here\n'
                 'echo "Hello from userdata"'
    )
    instance = instances[0]
    instance.wait_until_running()
    instance.reload()
    print("Instance ID:", instance.id)
    print("Public IP:", instance.public_ip_address)

launch_instance()
