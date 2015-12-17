require 'rails_helper'

RSpec.describe "planes/new", type: :view do
  before(:each) do
    assign(:plane, Plane.new(
      :state => "MyString"
    ))
  end

  it "renders new plane form" do
    render

    assert_select "form[action=?][method=?]", planes_path, "post" do

      assert_select "input#plane_state[name=?]", "plane[state]"
    end
  end
end
