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


    it 'shows change name form' do
      author1 = FactoryBot.create(:author, name: "Robert Jordon")
      get "/authors/#{author1.id}/change_name"

      expect(response).to render_template(:change_name)
    end

    it 'changes name on patch request' do
      author1 = FactoryBot.create(:author, name: "Robert Jordon")

      patch "/authors/#{author1.id}", params: {
        author: {name: "Brandon Sanderson"}}
      follow_redirect!

      expect(response).to render_template(:show)
      expect(response.body).to match /Brandon Sanderson/
      expect(response.body).to_not match /Robert Jordon/
    end
  end

  describe 'index page' do
    it 'should render the authors index page for root' do
      get '/'

      expect(response).to render_template('index')
    end

    it 'should redirect to the authors index page on author delete' do
      author1 = FactoryBot.create(:author, name: "Robert Jordon")
      author2 = FactoryBot.create(:author, name: "Brandon Sanderson")

      delete "/authors/#{author1.id}"
      follow_redirect!

      expect(response).to render_template(:index)
      expect(response.body).to match /Brandon Sanderson/
      expect(response.body).to_not match /Robert Jordon/
    end
  end

  describe 'new author page' do
    it 'should render the new item template' do

      get '/authors/new'

      expect(response).to render_template('new')
    end
  end
end
