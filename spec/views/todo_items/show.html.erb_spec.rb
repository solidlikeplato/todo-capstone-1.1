# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'todo_items/show.html.erb' do
  before do
    @item1 = FactoryBot.create(:todo_item,
                               id: 1,
                               title: 'Of Mice and Men',
                               description: 'George and Lenny',
                               is_done: false)
  end

  it 'passes correct params' do
    controller.extra_params = { id: 1 }

    expect(controller.request.fullpath).to eq todo_item_path(@item1)
  end

  it 'renders correct params' do
    assign(:todo_item, @item1)
    controller.extra_params = { id: 1 }

    render(template: 'todo_items/show')

    expect(rendered).to match /Of Mice and Men/
    expect(rendered).to match /George and Lenny/
    expect(rendered).to match /not done/
  end

  it 'has a delete item button' do
    assign(:todo_item, @item1)
    controller.extra_params = { id: 1 }

    render(template: 'todo_items/show')

    expect(rendered).to match /Delete Item/
  end
end
