class AddColumnMailconfigIdToCompaign < ActiveRecord::Migration
  def change
    add_column :compaigns, :mailconfig_id, :integer
  end
end
