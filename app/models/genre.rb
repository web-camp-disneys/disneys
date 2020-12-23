class Genre < ApplicationRecord
    validates :name,:is_active, presence: true
    validates :is_active, inclusion: { in: [true, false] }

    has_many :items
end