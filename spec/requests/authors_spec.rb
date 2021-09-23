# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Authors', type: :request do
  before do
    @author1 = FactoryBot.create(:author,
                                 id: 1,
                                 name: 'Asimov')
    @todo1 = FactoryBot.create(:todo_item,
                               is_done: true,
                               author: @author1,
                               title: 'Foundation')
    @todo2 = FactoryBot.create(:todo_item,
                               is_done: false,
                               author: @author1,
                               title: 'I, Robot')
  end

  describe 'show page' do
    it 'should render the show page' do
      get '/authors/1'

      expect(response).to render_template('show')
    end

    it 'should display the authors name and the title of the todo' do
      get '/authors/1'

      expect(response.body).to match /Asimov/
      expect(response.body).to match /Foundation(\s|\S)*I, Robot/
    end

    it 'sorts by status' do
      get '/authors/1', params: { sort: 'is_done' }

      expect(response.body).to match /I, Robot(\s|\S)*Foundation/
    end

    it 'shows change name form' do
      get '/authors/1/change_name'

      expect(response).to render_template(:change_name)
    end

    it 'changes name on patch request' do
      patch '/authors/1', params: {
        author: { name: 'Brandon Sanderson' }
      }
      follow_redirect!

      expect(response).to render_template(:show)
      expect(response.body).to match /Brandon Sanderson/
      expect(response.body).to_not match /Asimov/
    end
  end

  describe 'index page' do
    it 'should render the authors index page for root' do
      get '/'

      expect(response).to render_template('index')
    end

    it 'should redirect to the authors index page on author delete' do
      author2 = FactoryBot.create(:author,
                                  id: 2,
                                  name: 'Robert Jordon')

      delete '/authors/1'
      follow_redirect!

      expect(response).to render_template(:index)
      expect(response.body).to match /Robert Jordon/
      expect(response.body).to_not match /Asimov/
    end
  end

  describe 'new author page' do
    it 'should render the new item template' do
      get '/authors/new'

      expect(response).to render_template('new')
    end
  end
end
