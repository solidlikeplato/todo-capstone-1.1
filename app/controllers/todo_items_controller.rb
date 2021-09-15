class TodoItemsController < ApplicationController
  before_action :set_todo_item, except: [:create]

  def show
  end

  def change_status
    @todo_item.update_attribute(:is_done, !@todo_item.is_done)
    redirect_to @todo_item
  end

  private
  def set_todo_item
    @todo_item = TodoItem.find(params[:id])
  end

  def todo_item_params
    params[:todo_item].permit(:title, :description, :author, :is_done)
  end

end
