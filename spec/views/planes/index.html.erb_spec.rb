require 'rails_helper'

RSpec.describe "planes/index", type: :view do
  before(:each) do
    assign(:planes, [
      Plane.create!(
        :state => "State"
      ),
      Plane.create!(
        :state => "State"
      )
    ])
  end

  it "renders a list of planes" do
    render
    assert_select "tr>td", :text => "State".to_s, :count => 2
  end
end
