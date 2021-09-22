require 'spec_helper'

RSpec.describe "authors/show.html.erb" do

  it 'passes correct params' do
    author1 = FactoryBot.create(:author, name: "Asimov")

    assign(:author, author1)
    controller.extra_params = { id: author1.id }
    
    expect(controller.request.fullpath).to eq "/authors/#{author1.id}"
  end

  it 'renders correct items' do
    author1 = FactoryBot.create(:author, id: 1, name: "Asimov")
    todo1 = FactoryBot.create(:todo_item, author: author1, title: "Foundation")
    author2 = FactoryBot.create(:author, id: 2, name: "Heinlen")
    todo1 = FactoryBot.create(:todo_item, author: author2, title: "Starship Troopers")

    assign(:author, author1)
    controller.extra_params = {id: 1}
    render(template:'authors/show')

    expect(rendered).to match /Foundation/
    expect(rendered).to_not match /Starship Troopers/
  end

  it 'has a new item button' do
    author1 = FactoryBot.create(:author, name: "Asimov")
    assign(:author, author1)
    controller.extra_params = { id: author1.id }
    
    render(template:'authors/show')

    expect(rendered).to match /New Item/
  end

  it 'has a delete author button' do
    author1 = FactoryBot.create(:author, name: 'George Orwell')
    assign(:author, author1)
    controller.extra_params = { id: author1.id }
    
    render(template: 'authors/show')

    expect(rendered).to match /Delete Author/
  end

  it 'has a update name button' do
    author1 = FactoryBot.create(:author, name: "Asimov")
    assign(:author, author1)
    controller.extra_params = { id: author1.id }
    
    render(template:'authors/show')

    expect(rendered).to match /Update Name/
  end
end
