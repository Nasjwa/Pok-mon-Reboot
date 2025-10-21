class Pokemon < ApplicationRecord
  has_one_attached :photo
  has_many :pokeballs, dependent: :destroy
  has_many :trainers, through: :pokeballs
end
