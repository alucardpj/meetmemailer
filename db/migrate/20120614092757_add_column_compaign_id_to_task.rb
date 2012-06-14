class AddColumnCompaignIdToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :compaign_id, :integer
  end
end
