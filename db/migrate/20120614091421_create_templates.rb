class CreateTemplates < ActiveRecord::Migration
  def change
    create_table :templates do |t|
      t.string :lang
      t.string :content_type
      t.text :content

      t.timestamps
    end
  end
end
