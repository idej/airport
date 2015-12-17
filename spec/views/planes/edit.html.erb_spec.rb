require 'rails_helper'

RSpec.describe "planes/edit", type: :view do
  before(:each) do
    @plane = assign(:plane, Plane.create!(
      :state => "MyString"
    ))
  end

  it "renders the edit plane form" do
    render

    assert_select "form[action=?][method=?]", plane_path(@plane), "post" do

      assert_select "input#plane_state[name=?]", "plane[state]"
    end
  end
end
