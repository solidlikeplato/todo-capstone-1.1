class ChangeAuthorToTable < ActiveRecord::Migration[6.1]
  def change
    remove_column :todo_items, :author, :string
    add_reference :todo_items, :author, null: false, foreign_key: true
  end
end
