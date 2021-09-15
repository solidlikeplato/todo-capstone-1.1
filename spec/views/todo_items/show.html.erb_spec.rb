require 'spec_helper'

RSpec.describe "todo_items/show.html.erb" do

  it 'renders passes correct params' do
    item1 = FactoryBot.create(:todo_item, title: "Of Mice and Men", description: "George and Lenny")
    controller.extra_params = { :id => item1.id }
    
    expect(controller.request.fullpath).to eq todo_item_path(item1)
  end
end
