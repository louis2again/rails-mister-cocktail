# Validation
# An ingredient must have a unique name.
# An ingredient has many doses
class Ingredient < ApplicationRecord
  has_many :doses
  validates :name, uniqueness: true, presence: true
end
