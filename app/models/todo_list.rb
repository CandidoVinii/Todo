class TodoList < ApplicationRecord
  has_many :todo_item, dependent: :destroy
end
