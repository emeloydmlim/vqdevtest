class Project < ApplicationRecord 
    belongs_to :user, optional: true
    validates :name, presence: true, length: {minimum: 6, maximum: 100}
    validates :description, presence: true, length: {minimum: 6, maximum: 300}

end