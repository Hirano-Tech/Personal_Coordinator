class GuStore < ApplicationRecord
  validates :name, presence: true
  validates :address, presence: true
  validates :google_map, presence: true, uniqueness: true
  validates :phone, presence: true

  has_many :gu_osyarista
end
