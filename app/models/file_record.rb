class FileRecord < ApplicationRecord
  # uploader
  mount_uploader :file, FileUploader

  # associations
  has_one :shared_url, dependent: :destroy 
  belongs_to :user
  
  # validations
  validates :title, presence: true
  validates :file, presence: true
  validate :file_type_validation
  
  
  private

  def file_type_validation
    return if file.blank?

    allowed_types = ['image/jpeg', 'image/jpg', 'image/gif', 'image/png', 'application/pdf']
    unless allowed_types.include?(file.file.content_type)
      errors.add(:file, "must be a JPEG, GIF, PNG, or PDF file")
    end
  end

end
