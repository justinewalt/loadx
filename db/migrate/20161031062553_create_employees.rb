class CreateEmployees < ActiveRecord::Migration[5.0]
  def change
    create_table :employees do |t|

      t.string :first_name,    null: false, default: ""
      t.string :last_name,     null: false, default: ""
      t.string :salutation,    null: false, default: ""
      t.string :nickname,      default: ""
      t.string :email,         null: false, default: ""
      t.string :role,          :boolean, default: false
      t.integer :phone,        null: false

      t.timestamps
    end
  end
end
