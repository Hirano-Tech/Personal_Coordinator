class GuOsyaristum < ApplicationRecord
  validates :name, presence: true
  validates :gender, presence: true, length: { is: 2 }
  validates :height, presence: true, length: { is: 3 }, numericality: :only_integer
  validates :staff_id, presence: true, length: { is: 32 }, uniqueness: true

  belongs_to :gu_store
end
