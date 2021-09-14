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
end
