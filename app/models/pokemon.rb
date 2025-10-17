class Pokemon < ApplicationRecord
  has_one_attached :photo

  has_many :pokeballs, dependent: :destroy
  has_many :trainers, through: :pokeballs

  validates :name, presence: true
  validates :element_type, presence: true
end
