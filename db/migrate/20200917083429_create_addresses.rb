class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :post_code	,       null: false
      t.string :city,             null: false
      t.string :house_number,     null: false
      t.string :building_name,    null: false
      t.string :phone_number,     null: false

      t.integer :prefecture_id,   foreign_key: true

      t.references :customer,         null: false,  foreign_key: true

      t.timestamps
    end
  end
end
