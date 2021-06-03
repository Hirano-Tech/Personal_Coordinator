class CreateGuOsyarista < ActiveRecord::Migration[6.1]
  def up
    create_table :gu_osyarista, if_not_exists: 'true' do |t|
      t.string :name, null: false
      t.string :gender, null: false
      t.integer :height, null: false
      t.string :staff_id, null: false
      t.references :gu_store, foreign_key: true
      t.timestamps
    end

    add_index :gu_osyarista, :staff_id, unique: true
  end

  def down
    drop_table :gu_osyarista, if_not_exists: 'true'
  end
end
