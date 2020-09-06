class Task < ApplicationRecord 
    belongs_to :project, optional: true   
    validates :task, presence: true

end