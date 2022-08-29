require 'rails_helper'

RSpec.describe "Roadmaps", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/roadmap/index"
      expect(response).to have_http_status(:success)
    end
  end

end
