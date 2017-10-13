class CreateContents < ActiveRecord::Migration[5.1]
  def change
    create_table :contents do |t|
      t.string :url
      t.string :title

      t.timestamps
    end
  end
end
