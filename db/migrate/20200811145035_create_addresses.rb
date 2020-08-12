class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string      :postal_num,    null: false
      t.integer     :pref_id,       null: false
      t.string      :city,          null: false
      t.string      :house_num,     null: false
      t.string      :building
      t.string      :tel_num,       null:false
      t.references  :item,          null: false,foreign_key: true
      t.timestamps
    end
  end
end
