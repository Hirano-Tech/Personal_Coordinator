class GuStore < ApplicationRecord
  self.table_name = 'gu_stores'

  belongs_to :prefecture, class_name: 'Prefecture', foreign_key: 'prefectures_id'
  has_many :gu_staffs, class_name: 'Osyalista', foreign_key: 'store_id'



  # 都道府県ごとの店舗数を集計する。
  # SELECT prefectures_id, COUNT(prefectures_id) FROM gu_stores GROUP BY prefectures_id ORDER BY COUNT(prefectures_id) ASC;
end
