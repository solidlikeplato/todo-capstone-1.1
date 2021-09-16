require 'spec_helper'

RSpec.describe "todo_items/show.html.erb" do

  it 'passes correct params' do
    item1 = FactoryBot.create(:todo_item, title: "Of Mice and Men", description: "George and Lenny")
    controller.extra_params = { id: item1.id }
    
    expect(controller.request.fullpath).to eq todo_item_path(item1)
  end

  it 'renders correct params' do
    item1 = FactoryBot.create(:todo_item, title: "Of Mice and Men", description: "George and Lenny", is_done: false)
    assign(:todo_item, item1)
    controller.extra_params = { id: item1.id }
    
    render(template: 'todo_items/show')

    expect(rendered).to match /Of Mice and Men/
    expect(rendered).to match /George and Lenny/
    expect(rendered).to match /not done/
  end
end
