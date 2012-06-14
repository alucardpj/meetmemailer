class CreateMailconfigs < ActiveRecord::Migration
  def change
    create_table :mailconfigs do |t|
      t.string :delivery_method
      t.string :address
      t.integer :port
      t.string :user_name
      t.string :password
      t.string :authentication

      t.timestamps
    end
  end
end
