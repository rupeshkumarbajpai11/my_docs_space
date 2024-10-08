class FileRecord < ApplicationRecord
  # uploader
  mount_uploader :my_file, FileUploader

  # associations
  has_one :shared_url, dependent: :destroy 
  belongs_to :user
  
  # validations
  validates :title, presence: true
  validates :my_file, presence: true
  

end
