class Attachment < ApplicationRecord
  belongs_to :task
  validates :name, presence: true
  validates :file, presence: true
  validates :task, presence: true
  mount_uploader :file, FileuploadUploader
end
