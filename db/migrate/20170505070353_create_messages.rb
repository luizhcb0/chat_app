class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.text :text
      t.belongs_to :user, index: true, null: false
      t.belongs_to :dialect, null: false, index: true
      t.timestamps
    end
    add_foreign_key :messages, :users, on_delete: :cascade
    add_foreign_key :messages, :dialects, on_delete: :cascade
  end
end
