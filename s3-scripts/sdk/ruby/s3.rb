require 'aws-sdk-s3'
require 'securerandom'
require 'pry'

bucket_name = ENV['BUCKET_NAME']
region = 'ap-south-1'

puts "Bucket name: #{bucket_name}"

# Initialize the S3 client 
client = Aws::S3::Client.new(region: region)

# Create the bucket (only needed if not already existing)
begin
  client.create_bucket({
    bucket: bucket_name,
    create_bucket_configuration: {
      location_constraint: region,
    }
  })
rescue Aws::S3::Errors::BucketAlreadyOwnedByYou
  puts "Bucket already exists."
end

#binding.pry

# Generate a random number of files
number_of_files = 1 + rand(6)
puts "number_of_files: #{number_of_files}"

# Upload random files to S3
number_of_files.times do |i|
  puts "i: #{i}"
  filename = "file_#{i}.txt"
  output_path = "/tmp/#{filename}"

  # Write a UUID to the file
  File.open(output_path, "w") do |f|
    f.write(SecureRandom.uuid)
  end

  # Upload to S3 (corrected variable name and usage)
  File.open(output_path, 'rb') do |f|
    client.put_object(
      bucket: bucket_name,
      key: filename,
      body: f
    )
  end

  puts "#{filename} uploaded successfully."
end
