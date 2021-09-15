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
end
