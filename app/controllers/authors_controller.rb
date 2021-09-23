class AuthorsController < ApplicationController
  before_action :set_author, only: [ :show, :update, :change_name, :destroy]
  
  def show
  end

  def index
    @authors = Author.all
  end

  def destroy
    @author.destroy
    redirect_to '/'
  end

  def new
  end

  def change_name
  end

  def create
    @author = Author.new(author_params)
    @author.save
    redirect_to @author
  end

  def update
    @author.update(author_params)
    
    redirect_to @author
  end

  private
    def set_author
      @author = Author.find(params[:id])
    end

    def author_params
      params.require(:author).permit(:name)
    end
end
