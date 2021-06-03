class CreateGuStores < ActiveRecord::Migration[6.1]
  def up
    create_table :gu_stores, if_not_exists: 'true' do |t|
      t.string :name, null: false
      t.string :address, null: false
      t.string :google_map, null: false
      t.string :phone, null: false
      t.timestamps
    end

    add_index :gu_stores, :google_map, unique: true
  end

  def down
    drop_table :gu_stores, if_not_exists: 'true'
  end
end
