#!/bin/bash
source ~/.bash_profile
aws cloudformation delete-stack --stack-name ekspipeline
aws iam delete-role-policy --role-name CodeBuildKubectlRole --policy-name eks-describe
aws iam delete-role --role-name CodeBuildKubectlRole


eksctl delete cluster --name eks-demo
aws kms delete-alias --alias-name alias/eks-demo
aws kms disable-key --key-id ${MASTER_ARN}
aws kms schedule-key-deletion --key-id ${MASTER_ARN}
