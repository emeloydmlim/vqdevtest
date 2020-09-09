class Task < ApplicationRecord 
    belongs_to :project, optional: true   
    validates :task, presence: true
    has_many :attachments, dependent: :destroy
end