class TodoItem < ApplicationRecord
  belongs_to :author
  validates :description, presence: true
  validates :title, presence: true
end
