class TodoList < ApplicationRecord
  has_many :todo_items, dependent: :destroy

  validates :title, presence: { message: "can't be blank" }
end
