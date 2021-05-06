class City < ApplicationRecord
    has_many :dogs
    has_many :dogsitter, through: :dogs
end
