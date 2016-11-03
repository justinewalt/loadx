class CreateJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :jobs do |t|

      t.string :description,     null: false, default: ""
      t.text :details,         null: false, default: ""
      t.datetime :pickup_date,   null: false
      t.datetime :delivery_date,  null: false
      t.string :special_details, default: ""
      t.datetime :time_delivered
      t.boolean :delivered?,  default: false

      t.timestamps
    end
  end
end
