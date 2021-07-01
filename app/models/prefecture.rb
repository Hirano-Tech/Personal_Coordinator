class Prefecture < ApplicationRecord
  self.table_name = 'prefectures'

  has_many :gu_stores, class_name: 'GuStore', foreign_key: 'prefectures_id'
end
