class TodoListsController < ApplicationController
  def index
    @all = TodoList.all
    if @all.empty?
      flash[:notice] = "No todo lists found."
    else
      @all
    end
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
