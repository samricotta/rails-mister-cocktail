class Cocktail < ApplicationRecord
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses

  validates :name, uniqueness: true, presence: true, length: { minimum: 2}
  # validates :dose_id, presence: true, uniqueness: true
end
