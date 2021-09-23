# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Author, type: :model do
  subject do
    described_class.new(name: 'Anne Rice')
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'validates name uniqueness' do
    subject.save
    invalid_author = subject.dup
    expect(invalid_author).to_not be_valid
  end

  it 'has many todo items' do
    relationship = Author.reflect_on_association(:todo_items)
    expect(relationship.macro).to eq(:has_many)
  end
end
