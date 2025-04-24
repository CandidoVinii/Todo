class TodoItem < ApplicationRecord
  belongs_to :todo_list

  validates :content, presence: { message: "can't be blank" }
end
