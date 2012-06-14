class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :mailconfig_id
      t.string :from
      t.string :to
      t.integer :template_id
      t.string :status

      t.timestamps
    end
  end
end
