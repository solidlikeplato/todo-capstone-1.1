require 'rails_helper'

RSpec.describe 'TodoItems', type: :request do
  before do
    @item1 = FactoryBot.create(:todo_item, id: 1)
  end
  describe 'show page' do
    it 'should render the show page' do
      get '/todo_items/1'
      expect(response).to render_template('show')
    end
  end
  
  it 'changes status' do
    item1 = FactoryBot.create(:todo_item, title: "Of Mice and Men", description: "George and Lenny", is_done: true)    
    patch "/todo_items/#{item1.id}/change_status"

    expect(response).to redirect_to("/todo_items/#{item1.id}")
    follow_redirect!

    expect(response).to render_template(:show)
    expect(response.body).to match /not done/
  end

  it 'shows change title form' do
    item1 = FactoryBot.create(:todo_item, title: "Of Mice and Men", description: "George and Lenny", is_done: true)    
    get "/todo_items/#{item1.id}/change_title"

    expect(response).to render_template(:change_title)
  end

  it 'changes the title on patch request' do
    item1 = FactoryBot.create(:todo_item, title: "Of Mice and Men", description: "George and Lenny", is_done: true)    
    patch "/todo_items/#{item1.id}", params: {title: "East of Eden"}
    follow_redirect!

    expect(response).to render_template(:show)
    expect(response.body).to match /East of Eden/
  end

  it 'shows change description form' do
    item1 = FactoryBot.create(:todo_item, title: "Of Mice and Men", description: "George and Lenny", is_done: true)    
    get "/todo_items/#{item1.id}/change_description"

    expect(response).to render_template(:change_description)
  end

  it 'changes the description on patch request' do
    item1 = FactoryBot.create(:todo_item, title: "Of Mice and Men", description: "George and Lenny", is_done: true)    
    patch "/todo_items/#{item1.id}", params: {description: "the Trasks and the Hamiltons"}
    follow_redirect!

    expect(response).to render_template(:show)
    expect(response.body).to match /the Trasks and the Hamiltons/
  end
end
