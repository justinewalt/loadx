class CreateBids < ActiveRecord::Migration[5.0]
  def change
    create_table :bids do |t|
      t.float :amount,        null: false
      t.datetime :expiration, null: false

      t.timestamps
    end
  end
end
