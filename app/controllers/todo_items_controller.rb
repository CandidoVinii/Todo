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
    if @todo_item.update(done: true)
      redirect_to todo_list_path(@todo_list), notice: "Task is done!"
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
