# frozen_string_literal: true

require "spec_helper"

RSpec.describe "authors/show.html.erb" do
  before do
    @author1 = FactoryBot.create(:author,
                                 id: 1,
                                 name: "Asimov")
    @todo1 = FactoryBot.create(:todo_item,
                               author: @author1,
                               title: "Foundation")
    @author2 = FactoryBot.create(:author,
                                 id: 2,
                                 name: "Heinlen")
    @todo1 = FactoryBot.create(:todo_item,
                               author: @author2,
                               title: "Starship Troopers")
  end

  it "passes correct params" do
    assign(:author, @author1)
    assign(:todo_items, @author1.todo_items)
    controller.extra_params = { id: 1 }

    expect(controller.request.fullpath).to eq "/authors/1"
  end

  it "renders correct items" do
    assign(:author, @author1)
    assign(:todo_items, @author1.todo_items)
    controller.extra_params = { id: 1 }
    render(template: "authors/show")

    expect(rendered).to match /Foundation/
    expect(rendered).to_not match /Starship Troopers/
  end

  it "has a new item button" do
    assign(:author, @author1)
    assign(:todo_items, @author1.todo_items)
    controller.extra_params = { id: 1 }

    render(template: "authors/show")

    expect(rendered).to match /New Item/
  end

  it "has a delete author button" do
    assign(:author, @author1)
    assign(:todo_items, @author1.todo_items)
    controller.extra_params = { id: 1 }

    render(template: "authors/show")

    expect(rendered).to match /Delete Author/
  end

  it "has a update name button" do
    assign(:author, @author1)
    assign(:todo_items, @author1.todo_items)
    controller.extra_params = { id: 1 }

    render(template: "authors/show")

    expect(rendered).to match /Update Name/
  end
end
