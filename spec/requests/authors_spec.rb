require 'rails_helper'

RSpec.describe "Authors", type: :request do
    before do
      @author1 = FactoryBot.create(:author, id: 1, name: "Asimov")
      @todo1 = FactoryBot.create(:todo_item, author: @author1, title: "Foundation")
  end

  describe 'show page' do
    it 'should render the show page' do
      get '/authors/1'
      expect(response).to render_template('show')
    end

    it 'should display the authors name and the title of the todo' do
      get '/authors/1'

      expect(response.body).to match /Asimov/
      expect(response.body).to match /Foundation/
    end
  end

  describe 'index page' do
    it 'should render the authors index page for root' do
      get '/'

      expect(response).to render_template('index')

    end
  end
end
