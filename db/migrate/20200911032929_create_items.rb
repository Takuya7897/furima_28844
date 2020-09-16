class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :user, foreign_key: true

      t.string     :name, null: false
      t.text       :introduction, null: false
      t.integer    :price, null: false

      t.integer :category_id, foreign_key: true
      t.integer :prefecture_code_id, foreign_key: true
      t.integer :ship_cost_id, foreign_key: true
      t.integer :ship_date_id, foreign_key: true
      t.integer :condition_id, foreign_key: true


    end
  end
end
