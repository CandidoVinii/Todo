class TodoItemsController < ApplicationController
  before_action :set_todo_list
  before_action :set_todo, only: [ :edit, :update, :destroy ]


  def render_not_found
    render file: "#{Rails.root}/public/404.html", status: :not_found
  end

  def show
    @todo_item = @todo_list.todo_items.find_by(id: params[:id])
    render_not_found unless @todo_item
  end

  def new
    @todo_item = @todo_list.todo_items.build
  end

  def create
    @todo_item = @todo_list.todo_items.build(todo_item_params)
    if @todo_item.save
      redirect_to todo_list_path(@todo_list), notice: "Task created successfully!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @todo_item = TodoItem.find(params[:id])
  end

  def update
    if @todo_item.update(todo_item_params)
      redirect_to todo_list_path(@todo_list), notice: "Updated task!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @todo_item = TodoItem.find(params[:id])
    if @todo_item.destroy
    redirect_to todo_list_path(@todo_list), notice: "Task deleted!"
    else
      render :edit, status: :unprocessable_entity
    end
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
