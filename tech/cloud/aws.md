## Install and Update

https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html - use zipped installer
```bash
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" unzip awscliv2.zip sudo ./aws/install
# update
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install --bin-dir /usr/local/bin --install-dir /usr/local/aws-cli --update
```

## Instances

Types

- Spot: A Spot Instance is an instance that uses spare EC2 capacity that is available for less than the On-Demand price.

## Storage

gp2
: IOPS 3x disk size
gp3
: cheaper and faster than gp2, 3000 IOPS by default

## IAM and Policies

S3 read-only
```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "s3:GetObject",
        "s3:ListBucket"
      ],
      "Resource": [
        "arn:aws:s3:::se-38099-crowdstrike-packages",
        "arn:aws:s3:::se-38099-crowdstrike-packages/*"
      ]
    }
  ]
}
```
## CLI

### Roles and Instances

```bash
# identify instance IAM role
aws ec2 describe-instances \
  --instance-ids i-0c5dbe10436f57ff5 \
  --query "Reservations[].Instances[].IamInstanceProfile.Arn" \
  --region your-region
# "arn:aws:iam::583182321077:instance-profile/AmazonSSMRoleForInstancesQuickSetup"
aws iam list-attached-role-policies --role-name AmazonSSMRoleForInstancesQuickSetup
# {
#     "AttachedPolicies": [
#         {
#             "PolicyName": "AmazonSSMManagedInstanceCore",
#             "PolicyArn": "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
#         }
#     ]
# }
# attach-role-policy: adds a managed policy
aws iam attach-role-policy \
  --role-name AmazonSSMRoleForInstancesQuickSetup \
  --policy-arn arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess
# put-role-policy: Adds or Overwrites an Inline Policy)
aws iam put-role-policy \
  --role-name AmazonSSMRoleForInstancesQuickSetup \
  --policy-name S3ReadAccess \
  --policy-document file://s3-read-policy.json
# Verify permissions
aws s3 ls s3://se-38099-crowdstrike-packages/ --region your-region
```

### System Manager

```bash
# SM Run Command: execute shell command
aws ssm send-command \
  --document-name "AWS-RunShellScript" \
  --targets "Key=instanceIds,Values=i-xxxxxxxxxxxxxxxxx" \
  --parameters 'commands=["aws s3 cp s3://your-bucket-name/myfile.txt /home/ec2-user/myfile.txt"]' \
  --region your-region
# get command output
aws ssm list-command-invocations \
  --command-id "your-command-id" \
  --details \
  --region your-region
# detailed output
aws ssm get-command-invocation \
  --command-id "your-command-id" \
  --instance-id "i-xxxxxxxxxxxxxxxxx" \
  --region your-region
```

Best Practice
- Use attach-role-policy for managed policies to avoid overwriting anything.
- Use put-role-policy for custom, fine-grained control (but ensure you’re not overwriting critical inline policies).