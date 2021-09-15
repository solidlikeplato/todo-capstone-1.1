class AddIsDoneToTodoItems < ActiveRecord::Migration[6.1]
  def change
    add_column :todo_items, :is_done, :boolean, default: false
  end
end
