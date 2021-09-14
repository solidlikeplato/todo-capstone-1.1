require "rails_helper"

RSpec.describe "index.html" do
  it "displays a welcome message" do
    render
    expect(rendered).to match /Welcome/
  end
end