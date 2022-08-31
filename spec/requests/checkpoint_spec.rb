require "rails_helper"

RSpec.describe "Checkpoints", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/checkpoint/index"
      expect(response.has_http_status?(:success)).to be(true)
    end
  end
end
