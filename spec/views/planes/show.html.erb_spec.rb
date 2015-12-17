require 'rails_helper'

RSpec.describe "planes/show", type: :view do
  before(:each) do
    @plane = assign(:plane, Plane.create!(
      :state => "State"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/State/)
  end
end
