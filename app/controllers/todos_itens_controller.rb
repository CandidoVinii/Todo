class TodosItensController < ApplicationController
  before_action :set_todo_list
  before_action :set_todo, only: [ :edit, :update, :destroy ]

  def new
    @todo = @todo_list.todos_itens.build
  end

  def create
    @todo = @todo_list.todos.build(todo_params)
    if @todo.save
      redirect_to todo_list_path(@todo_list), notice: "Tarefa criada com sucesso!"
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

  def set_todo_list
    @todo_list = TodoList.find(params[:todo_list_id])
  end

  def set_todo
    @todo = @todo_list.todos.find(params[:id])
  end

  def todo_params
    params.require(:todo).permit(:content, :done)
  end
end
