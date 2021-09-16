require 'rails_helper'

RSpec.describe TodoItem, type: :model do
  before(:each) do
    @author1 = Author.new(name: "Isaac Asimov")
  end
  

  it "is valid with valid attributes" do
    subject = described_class.new(
      author: @author1,
      title: "I, Robot",
      description: "The three laws"
    )
    expect(subject).to be_valid
  end

  it "is not valid without an author" do
    subject = described_class.new(
      author: nil,
      title: "I, Robot",
      description: "The three laws"
    )
    expect(subject).to_not be_valid
  end

  it "is not valid without an title" do
    subject = described_class.new(
      author: @author1,
      title: nil,
      description: "The three laws"
    )
    expect(subject).to_not be_valid
  end

  it "is not valid without an description" do
    subject = described_class.new(
      author: @author1,
      title: "I, Robot",
      description: nil
    )
    expect(subject).to_not be_valid
  end
  
end
