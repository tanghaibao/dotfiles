#!/usr/bin/python

import boto3
import argparse
from subprocess import call

parser = argparse.ArgumentParser()
parser.add_argument("src_acct")
parser.add_argument("src_username")
parser.add_argument("dst_acct")
parser.add_argument("dst_role")
args = parser.parse_args()

def aws_configure(profile,key,value):
    call('aws configure set profile.{0}.{1} {2}'.format(profile,key,value).split())


try:

    profile=args.dst_role
    region='us-west-2'
    mfa_token = raw_input('Enter MFA Token [ENTER]: ')

    boto3.setup_default_session(profile_name='default')

    client = boto3.client('sts')
    response = client.assume_role( RoleArn="arn:aws:iam::" + args.dst_acct + ":role/" + args.dst_role,
                                  RoleSessionName=args.dst_role,
                                  SerialNumber="arn:aws:iam::" + args.src_acct + ":mfa/" + args.src_username,
                                  TokenCode=mfa_token )

    creds=response['Credentials']

    aws_configure(profile,'aws_access_key_id',creds['AccessKeyId'])
    aws_configure(profile,'aws_secret_access_key',creds['SecretAccessKey'])
    aws_configure(profile,'aws_session_token',creds['SessionToken'])
    aws_configure(profile,'region',region)

    print profile

except Exception as e:

    print e
