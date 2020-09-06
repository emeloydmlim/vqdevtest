class Project < ApplicationRecord 
    belongs_to :user, optional: true
    has_many :tasks, dependent: :destroy
    validates :name, presence: true, length: {minimum: 6, maximum: 100}
    validates :description, presence: true, length: {minimum: 6, maximum: 300}
    
end