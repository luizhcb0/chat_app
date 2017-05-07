class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :username, null: false, index: true
      t.belongs_to :dialect, null: false, index: true
      t.timestamps
    end
    add_foreign_key :users, :dialects, on_delete: :nullify
  end
end
