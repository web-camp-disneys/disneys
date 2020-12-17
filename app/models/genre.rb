class Genre < ApplicationRecord
    validates :name, presence: true
    validates :is_active, inclusion: { in: [true, false] }
end