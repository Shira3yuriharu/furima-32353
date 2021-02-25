class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :user, foreign_key: true,  null: false
      t.string :name,                         null: false
      t.text :explain,                        null: false
      t.integer :category_id,                 null: false
      t.integer :status_id,                   null: false
      t.integer :method_of_payment_id,        null: false
      t.integer :area_id,                     null: false
      t.integer :days_required_id,            null: false
      t.integer :price,                       null: false
      t.timestamps
    end
  end
end