require 'rails_helper'

RSpec.describe TodoItem, type: :model do
  subject do
      described_class.new(author: 'Ethan', title: 'wash the car', description: 'it\'s dirty' )
  end

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without an author" do
    subject.author = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without an title" do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without an description" do
    subject.description = nil
    expect(subject).to_not be_valid
  end
  
end
