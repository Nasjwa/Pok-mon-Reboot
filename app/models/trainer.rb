class Trainer < ApplicationRecord
  has_one_attached :photo

  has_many :pokeballs, dependent: :destroy
  has_many :pokemons, through: :pokeballs

  validates :name, presence: true
  validates :age, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, allow_nil: true
end
