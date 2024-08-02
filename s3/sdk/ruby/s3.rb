# Require necessary libraries
require 'aws-sdk-s3'  # AWS SDK for Ruby for S3 interaction
require 'pry'         # (Optional) Interactive debugging tool
require 'securerandom' # Library to generate secure random values

# Read bucket name from environment variable
bucket_name = ENV['BUCKET_NAME']

# Define the AWS region for the S3 bucket
region = "us-east-1"

# Initialize the S3 client
client = Aws::S3::Client.new(region: region)

# Create a new S3 bucket in the specified region
if region == 'us-east-1'
  # No need for `create_bucket_configuration` in us-east-1
  resp = client.create_bucket(bucket: bucket_name)
else
  resp = client.create_bucket({
    bucket: bucket_name,
    create_bucket_configuration: {
      location_constraint: region,
    }
  })
end

# Print the location of the created bucket
puts "Bucket created with location: #{resp.location}"

# Determine the number of files to create (between 1 and 6 inclusive)
numberof_files = 1 + rand(6)
puts "numberof_files: #{numberof_files}"

# Iterate to create and upload files
numberof_files.times.each do |i|
  puts "i: #{i}"
  
  # Define file name and path
  filename = "file_#{i}.txt"
  output_path = "/tmp/#{filename}"

  # Create and write a UUID to the file
  File.open(output_path, "w") do |f|
    f.write SecureRandom.uuid
  end

  # Read and upload the file to S3
  File.open(output_path, "rb") do |f|
    client.put_object(
      bucket: bucket_name,
      key: filename,
      body: f
    )
  end

  # Clean up temporary file
  File.delete(output_path) if File.exist?(output_path)
end
