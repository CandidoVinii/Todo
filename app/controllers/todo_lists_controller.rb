class TodoListsController < ApplicationController
  def index
    @todo_lists = TodoList.all
    respond_to do |format|
      format.html do
        if @todo_lists.empty?
          flash[:notice] = "No todo lists found. Create a new list!!"
        end
      end
      format.json { render json: @todo_lists }
    end
  end

  def show
    @todo_list = TodoList.find_by(id: params[:id])
    respond_to do |format|
      if @todo_list
        format.html
        format.json { render json: @todo_list }
      else
        format.html { render file: "#{Rails.root}/public/404.html", status: :not_found }
        format.json { render json: { error: "Todo list not found" }, status: :not_found }
      end
    end
  end

  def new
    @todo_list = TodoList.new
    respond_to do |format|
      format.html
      format.json { render json: @todo_list }
    end
  end

  def create
    @todo_list = TodoList.new(todo_list_params)
    respond_to do |format|
      if @todo_list.save
        format.html { redirect_to @todo_list, notice: "List created successfully" }
        format.json { render json: @todo_list, status: :created }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @todo_list.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @todo_list = TodoList.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @todo_list }
    end
  end

  def update
    @todo_list = TodoList.find(params[:id])
    respond_to do |format|
      if @todo_list.update(todo_list_params)
        format.html { redirect_to @todo_list, notice: "List updated successfully" }
        format.json { render json: @todo_list }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @todo_list.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @todo_list = TodoList.find(params[:id])
    if @todo_list.destroy
    redirect_to todo_lists_path, notice: "List deleted successfully"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def todo_list_params
    params.require(:todo_list).permit(:title)
  end
end
