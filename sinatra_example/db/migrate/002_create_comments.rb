class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |table|
      table.text :content
      table.references :photo

      table.timestamps
    end
  end
end
