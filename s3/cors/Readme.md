## Create a bucket

aws s3 mb s3://deecorsv1

## Create block public access

```sh
aws s3api put-public-access-block \
 --bucket deecorsv1 \
 --public-access-block-configuration "BlockPublicAcls=true,IgnorePublicAcls=true,BlockPublicPolicy=false,RestrictPublicBuckets=false"
```

## Create a bucket policy

```sh
aws s3api put-bucket-policy --bucket deecorsv1 --policy file://bucket-policy.json
```

## Turn on static web hosting

```sh
aws s3api put-bucket-website --bucket deecorsv1 --website-configuration file://website.json
```

## Upload index.html file and include cross-origin resource

aws s3 cp index.html s3://deecorsv1

## View website and see index.html

http://deecorsv1.s3-website-us-east-1.amazonaws.com
http://deecorsv1.s3-website.us-east-1.amazonaws.com

## Create website 2

aws s3 mb s3://deecorsv2

## Create block public access

```sh
aws s3api put-public-access-block \
 --bucket deecorsv2 \
 --public-access-block-configuration "BlockPublicAcls=true,IgnorePublicAcls=true,BlockPublicPolicy=false,RestrictPublicBuckets=false"
```

## Create a bucket policy

```sh
aws s3api put-bucket-policy --bucket deecorsv2 --policy file://bucket-policy2.json
```

## Turn on static web hosting

```sh
aws s3api put-bucket-website --bucket deecorsv2 --website-configuration file://website.json
```

## Upload javascriptfile file

aws s3 cp hello.js s3://deecorsv2

## Create api gateway with mock response and then test the endpoint

## Apply a CORS policy
