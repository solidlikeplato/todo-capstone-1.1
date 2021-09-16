FactoryBot.define do
  factory :todo_item, class: TodoItem do
    author { association :author }
    title { 'Write "I, Robot"'}
    description { 'How do we program robots?' }
    is_done { false }
  end
end