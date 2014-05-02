class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :contact_person
      t.string :email
      t.string :mobile
      t.integer :pnumber
      t.date :check_in
      t.date :leave_away
      t.integer :product_id
      t.integer :user_id
      t.integer :status
      t.timestamps
    end

    add_index :orders, :product_id
    add_index :orders, :user_id

  end
end
