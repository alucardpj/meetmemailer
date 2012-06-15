class RemoveColumnMailconfigIdFromTask < ActiveRecord::Migration
  def up
    remove_column :tasks, :mailconfig_id
  end

  def down
    add_column :tasks, :mailconfig_id, :integer
  end
end
