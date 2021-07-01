class Osyalista < ApplicationRecord
  self.table_name = 'gu_staffs'

  belongs_to :gu_store, class_name: 'GuStore', foreign_key: 'store_id'
end
