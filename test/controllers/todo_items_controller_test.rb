require "test_helper"

class TodoItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @todo_list = TodoList.create!(title: "Minha Lista de Teste")
    @todo_item = @todo_list.todo_items.create!(content: "Tarefa de Teste")
  end

  test "deve acessar o formulário de nova tarefa" do
    get new_todo_list_todo_item_path(@todo_list)
    assert_response :success
  end

  test "deve criar uma nova tarefa" do
    assert_difference("TodoItem.count") do
      post todo_list_todo_items_path(@todo_list), params: {
        todo_item: { content: "Nova Tarefa" }
      }
    end

    assert_redirected_to todo_list_path(@todo_list)
  end

  test "não deve criar tarefa inválida" do
    post todo_list_todo_items_path(@todo_list), params: {
      todo_item: { content: "" }
    }

    assert_response :unprocessable_entity
    assert_select "form"
  end

  test "deve acessar o formulário de edição" do
    get edit_todo_list_todo_item_path(@todo_list, @todo_item)
    assert_response :success
  end

  test "deve atualizar uma tarefa" do
    patch todo_list_todo_item_path(@todo_list, @todo_item), params: {
      todo_item: { content: "Atualizado" }
    }

    assert_redirected_to todo_list_path(@todo_list)
    @todo_item.reload
    assert_equal "Atualizado", @todo_item.content
  end

  test "deve apagar uma tarefa" do
    assert_difference("TodoItem.count", -1) do
      delete todo_list_todo_item_path(@todo_list, @todo_item)
    end

    assert_redirected_to todo_list_path(@todo_list)
  end
end
