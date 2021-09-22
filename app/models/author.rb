class Author < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true
  has_many :todo_items, dependent: :destroy
end
