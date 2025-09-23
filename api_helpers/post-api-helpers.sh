#!/bin/bash

echo "Executing Post-API Helpers"

echo "Executing S3 Public Access Block"

aws s3control put-public-access-block \
    --profile aft-target \
    --account-id $VENDED_ACCOUNT_ID \
    --public-access-block-configuration '{"BlockPublicAcls": true, "IgnorePublicAcls": true, "BlockPublicPolicy": true, "RestrictPublicBuckets": true}'

echo "Executing EBS Encryption by Default"

aws ec2 enable-ebs-encryption-by-default \
    --profile aft-target