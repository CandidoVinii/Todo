class TodoListsController < ApplicationController
  def index
    @todo_lists = TodoList.all
    if @all.empty?
      flash[:notice] = "No todo lists found."
    else
      @todo_lists
    end
  end

  def show
  end

  def new
    @todo_list = TodoList.new
  end

  def create
    @todo_list = TodoList.new(todo_list_params)
    if @todo_list.save
      redirect_to @todo_list, notice: "Lista criada com sucesso"
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
