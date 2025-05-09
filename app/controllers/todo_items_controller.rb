class TodoItemsController < ApplicationController
  before_action :set_todo_list
  before_action :set_todo, only: [ :edit, :update, :destroy ]


  def render_not_found
    render file: "#{Rails.root}/public/404.html", status: :not_found
  end

  def show
    respond_to do |format|
      if @todo_item
        format.html { render :show }
        format.json { render json: @todo_item }
      else
        format.html { render_not_found }
        format.json { render json: { error: "Item not found" }, status: :not_found }
      end
    end
  end

  def new
    @todo_item = @todo_list.todo_items.build
    respond_to do |format|
      format.html
      format.json { render json: @todo_item }
    end
  end

  def create
    @todo_item = @todo_list.todo_items.build(todo_item_params)
    respond_to do |format|
      if @todo_item.save
        format.html { redirect_to todo_list_path(@todo_list), notice: "Task created successfully!" }
        format.json { render json: @todo_item, status: :created }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @todo_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    respond_to do |format|
      format.html
      format.json { render json: @todo_item }
    end
  end

  def update
    respond_to do |format|
      if @todo_item.update(todo_item_params)
        format.html { redirect_to todo_list_path(@todo_list), notice: "Task updated successfully!" }
        format.json { render json: @todo_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @todo_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def done
    @todo_item = TodoItem.find(params[:id])
    respond_to do |format|
      if @todo_item.update(done: true)
        format.html { redirect_to todo_list_path(@todo_list), notice: "Task marked as done!" }
        format.json { render json: @todo_item, status: :ok }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: { error: "Failed to mark task as done" }, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @todo_item = TodoItem.find(params[:id])
    respond_to do |format|
      if @todo_item.destroy
        format.html { redirect_to todo_list_path(@todo_list), notice: "Task deleted successfully!" }
        format.json { head :no_content }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: { error: "Failed to delete task" }, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_todo_list
    @todo_list = TodoList.find(params[:todo_list_id])
  end

  def set_todo
    @todo_item = @todo_list.todo_items.find(params[:id])
    render_not_found unless @todo_item
  end

  def todo_item_params
    params.require(:todo_item).permit(:content, :done)
  end
end
