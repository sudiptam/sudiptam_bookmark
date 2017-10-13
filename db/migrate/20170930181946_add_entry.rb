class AddEntry < ActiveRecord::Migration[5.1]
  def change
  	add_column :contents, :favorites, :boolean
    add_column :contents, :archive, :boolean
  end
end
