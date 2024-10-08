class SharedUrl < ApplicationRecord
  
  # associations
  belongs_to :file_record

  # validations
  validates :shared_url, presence: true, uniqueness: true
  # Generate the unique URL before creating the record
  before_validation :generate_shared_url, on: :create

  private
  # Method to generate a unique shared URL
  def generate_shared_url
    self.shared_url ||= SecureRandom.hex(10)  # Generate a 10-character hex string
  end
end
