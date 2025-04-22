class TodoItemsController < ApplicationController
  before_action :set_todo_list
  before_action :set_todo, only: [:edit, :update, :destroy]

  def new
    @todo_item = @todo_list.todo_items.build
  end

  def create
    @todo_item = @todo_list.todo_items.build(todo_item_params)
    if @todo_item.save
      redirect_to todo_list_path(@todo_list), notice: "Tarefa criada com sucesso!"
    else
      render :new
    end
  end

  def edit; end

  def update
    if @todo_item.update(todo_item_params)
      redirect_to todo_list_path(@todo_list), notice: "Tarefa atualizada!"
    else
      render :edit
    end
  end

  def destroy
    @todo_item.destroy
    redirect_to todo_list_path(@todo_list), notice: "Tarefa removida!"
  end

  private

  def set_todo_list
    @todo_list = TodoList.find(params[:todo_list_id])
  end

  def set_todo
    @todo_item = @todo_list.todo_items.find(params[:id])
  end

  def todo_item_params
    params.require(:todo_item).permit(:content, :done)
  end
end
