require "test_helper"

class TodosItensControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get todos_itens_index_url
    assert_response :success
  end

  test "should get show" do
    get todos_itens_show_url
    assert_response :success
  end

  test "should get new" do
    get todos_itens_new_url
    assert_response :success
  end

  test "should get create" do
    get todos_itens_create_url
    assert_response :success
  end

  test "should get edit" do
    get todos_itens_edit_url
    assert_response :success
  end

  test "should get update" do
    get todos_itens_update_url
    assert_response :success
  end

  test "should get destroy" do
    get todos_itens_destroy_url
    assert_response :success
  end
end
