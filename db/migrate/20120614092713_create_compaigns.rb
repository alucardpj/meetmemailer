class CreateCompaigns < ActiveRecord::Migration
  def change
    create_table :compaigns do |t|
      t.string :title
      t.integer :interval_min
      t.integer :interval_max
      t.string :status

      t.timestamps
    end
  end
end
