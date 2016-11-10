class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|

      t.string :name,            null: false, default: "Main Office"
      t.string :street_address,  null: false, default: ""
      t.string :sub_district,    null: false, default: ""
      t.string :district,        null: false, default: ""
      t.string :province,        null: false, default: ""
      t.string :country,         null: false, default: ""
      t.string :postal_code,     null: false, default: ""

      t.belongs_to :job
      t.timestamps
    end
  end
end
