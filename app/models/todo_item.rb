class TodoItem < ApplicationRecord
  belongs_to :todo_list

  validates :content, presence: { message: "Você precisa preencher a descrição da tarefa"}
end
