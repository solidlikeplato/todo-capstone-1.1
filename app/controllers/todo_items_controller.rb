class TodoItemsController < ApplicationController
  before_action :set_author, only: [:create, :new, :destroy]
  before_action :set_todo_item, except: [:create, :new]

  def show
  end

  def new
  end

  def destroy
    @todo_item.destroy
    redirect_to @author
  end

  def create
    @todo_item = @author.todo_items.create(todo_item_params)
    redirect_to @author
  end

  def update
    @todo_item.update(todo_item_params)
    
    redirect_to @todo_item
  end

  def change_status
    @todo_item.update_attribute(:is_done, !@todo_item.is_done)
    redirect_to @todo_item
  end

  private
  def set_todo_item
    @todo_item = TodoItem.find(params[:id])
  end

  def set_author
    @author = Author.find(params[:author_id])
  end

  def todo_item_params
    params[:todo_item].permit(:title, :description,:author, :is_done)
  end
end
