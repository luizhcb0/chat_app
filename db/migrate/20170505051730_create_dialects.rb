class CreateDialects < ActiveRecord::Migration[5.0]
  def change
    create_table :dialects do |t|
      t.string :name, null: false
      t.string :front_name, null: false
      t.string :svg_path, null: false
      t.timestamps
    end
  end
end
