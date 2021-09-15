class TodoItem < ApplicationRecord
  validates :author, presence: true
  validates :description, presence: true
  validates :title, presence: true
end
