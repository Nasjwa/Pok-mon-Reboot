class Pokeball < ApplicationRecord
  belongs_to :trainer
  belongs_to :pokemon

  validates :location, presence: true
  validates :caught_on, presence: true
  validates :pokemon_id, uniqueness: { scope: :trainer_id, message: "already caught by this trainer" }
end
