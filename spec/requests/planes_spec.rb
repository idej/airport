require 'rails_helper'

RSpec.describe "Planes", type: :request do
  describe "GET /planes" do
    it "works! (now write some real specs)" do
      get planes_path
      expect(response).to have_http_status(200)
    end
  end
end
