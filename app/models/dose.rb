# Validation
# A dose must have a description, a cocktail and an ingredient,
# and [cocktail, ingredient] pairings should be unique.
# Associations
# A dose belongs to an ingredient
# A dose belongs to a cocktail
class Dose < ApplicationRecord
  belongs_to :ingredient
  belongs_to :cocktail
  validates :description, presence: true
  validates :ingredient, presence: true
  validates :cocktail, presence: true, uniqueness: { scope: :ingredient }
end
