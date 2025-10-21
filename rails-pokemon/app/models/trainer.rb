class Trainer < ApplicationRecord
  has_one_attached :photo
  has_many :pokeballs, dependent: :destroy
  has_many :pokemons, through: :pokeballs
end
