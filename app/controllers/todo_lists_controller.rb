class TodoListsController < ApplicationController
  def index
    @todo_lists = TodoList.all
    if @todo_lists.empty?
      flash[:notice] = "No todo lists found."
    else
      @todo_lists
    end
  end

  def show
    @todo_list = TodoList.find(params[:id])
  end

  def new
    @todo_list = TodoList.new
  end

  def create
    @todo_list = TodoList.new(todo_list_params)
    if @todo_list.save
      redirect_to @todo_list, notice: "Lista criada com sucesso"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @todo_list = TodoList.find(params[:id])
  end

  def update
    @todo_list = TodoList.find(params[:id])
    if @todo_list.update(todo_list_params)
      redirect_to @todo_list, notice: "Lista atualizada com sucesso"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @todo_list = TodoList.find(params[:id])
    if @todo_list.destroy
    redirect_to todo_lists_path, notice: "Lista removida com sucesso"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def todo_list_params
    params.require(:todo_list).permit(:title)
  end
end
