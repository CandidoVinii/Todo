require "test_helper"

class TodoListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @todo_list = TodoList.create!(title: "Minha Lista de Teste")
  end

  test "deve acessar o índice" do
    get todo_lists_url
    assert_response :success
  end

  test "deve exibir uma lista" do
    get todo_list_url(@todo_list)
    assert_response :success
  end

  test "deve acessar o formulário de nova lista" do
    get new_todo_list_url
    assert_response :success
  end

  test "deve criar uma lista" do
    assert_difference("TodoList.count") do
      post todo_lists_url, params: { todo_list: { title: "Nova Lista" } }
    end
    assert_redirected_to todo_list_path(TodoList.last)
  end

  test "deve acessar o formulário de edição" do
    get edit_todo_list_url(@todo_list)
    assert_response :success
  end

  test "deve atualizar uma lista" do
    patch todo_list_url(@todo_list), params: { todo_list: { title: "Atualizado" } }
    assert_redirected_to todo_lists_path()
    @todo_list.reload
    assert_equal "Atualizado", @todo_list.title
  end

  test "deve apagar uma lista" do
    assert_difference("TodoList.count", -1) do
      delete todo_list_url(@todo_list)
    end
    assert_redirected_to todo_lists_path
  end
end
