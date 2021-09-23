# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'authors/index.html.erb' do
  before do
    FactoryBot.create(:author,
                      id: 1,
                      name: 'Asimov')
    FactoryBot.create(:author,
                      id: 2,
                      name: 'Heinlen')
  end

  it 'displays the welcome message' do
    assign(:authors, Author.all)

    render

    expect(rendered).to match /Welcome to the To Do list app/
  end

  it 'renders all authors' do
    assign(:authors, Author.all)

    render

    expect(rendered).to match /Asimov/
    expect(rendered).to match /Heinlen/
  end

  it 'contains links to all authors' do
    assign(:authors, Author.all)

    render

    expect(rendered).to match %r{a href="/authors/1"}
    expect(rendered).to match %r{a href="/authors/2"}
  end
end
