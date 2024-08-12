## Create a user with no permissions

we need to create a new user with no permission and generate out access keys

```sh
aws iam create-user --user-name Davidsts
aws iam create-access-key --user-name Davidsts --output table
aws configure
aws sts get-caller-identity
```

## Create a role

create a role that will access a new resource

```sh
chmod u+x bin/deploy
./bin/deploy
```

## Use new uswer credentials and assume role

```sh
aws iam put-user-policy \
--user-name sts-machine-user  \
--policy-name StsAssumePolicy \
--policy-document file://policy.json
```

```sh
aws sts assume-role \
--role-arn arn:aws:iam::982383527471:role/my-sts-fun-stack-StsRole-UBQlCIzagA7n \
--role-session-name s3-sts-fun \
--profile sts
```

```sh
aws sts get-caller-identity --profile assumed
```

```sh
aws s3 ls --profile assumed
```
