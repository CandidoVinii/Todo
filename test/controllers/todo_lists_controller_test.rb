require "test_helper"

class TodoListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @todo_list = TodoList.create!(title: "Minha Lista de Teste")
  end

  test "should get index" do
    get todo_lists_url
    assert_response :success
  end

  test "should get show" do
    get todo_list_url(@todo_list)
    assert_response :success
  end

  test "should get new" do
    get new_todo_list_url
    assert_response :success
  end

  test "should create todo_list" do
    assert_difference("TodoList.count") do
      post todo_lists_url, params: { todo_list: { title: "Nova Lista" } }
    end
    assert_redirected_to todo_list_path(TodoList.last)
  end

  test "should get edit" do
    get edit_todo_list_url(@todo_list)
    assert_response :success
  end

  test "should update todo_list" do
    patch todo_list_url(@todo_list), params: { todo_list: { title: "Atualizado" } }
    assert_redirected_to todo_list_path(@todo_list)
    @todo_list.reload
    assert_equal "Atualizado", @todo_list.title
  end

  test "should destroy todo_list" do
    assert_difference("TodoList.count", -1) do
      delete todo_list_url(@todo_list)
    end
    assert_redirected_to todo_lists_path
  end
end
