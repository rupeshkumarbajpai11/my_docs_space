class FileUploader < CarrierWave::Uploader::Base
  # Choose the storage type (file system or AWS S3)
  # storage :fog  # for AWS S3 
  # Specify a directory for storing uploaded files
  # include CarrierWave::MiniMagick
  
  storage :file
  
  # # Limit file size
  # def size_range
  #   1..1.gigabytes
  # end

  # # Compress images (if required)
  # process resize_to_limit: [1024, 1024] if model.file_type == 'image'
end
