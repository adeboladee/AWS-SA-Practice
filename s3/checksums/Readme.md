## Create a new s3 bucket

```md
aws s3 mb s3://checksums-example-1
```

## Create a file we will do checksum on

```
echo "Hello uncledee " > myfile.txt
```

## Get a checksum of a file for md5

md5sum myfile.txt
#76e0a64508faa73dc38c6417c46cb9e3 myfile.txt

## Upload our file to s3

```
aws s3 cp myfile.txt s3://checksums-example-1
aws s3api head-object --bucket checksums-example-1 --key myfile.txt
```

## Upload a file with a differant kind of checksum

```sh
sudo apt install rhash
sha1sum myfile.txt
```

```sh
aws s3api put-object \
--bucket checksums-example-1 \
--key myfilecrc32.txt \
--body myfile.txt \
--checksum-algorithm="SHA1" \
--checksum-sha1="eb3ce8220d5b5629ea1dea74786dee641d001d1d"
```

cksum -o 3 -b yourfile.ext

--checksum-algorithm="CRC32"
--checksum-crc32
