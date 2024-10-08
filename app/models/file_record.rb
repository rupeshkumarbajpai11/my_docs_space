class FileRecord < ApplicationRecord
  # uploader
  mount_uploader :file, FileUploader

  # associations
  has_one :shared_url, dependent: :destroy 
  belongs_to :user
  
  # validations
  validates :title, presence: true
  validates :file, presence: true
  

end
