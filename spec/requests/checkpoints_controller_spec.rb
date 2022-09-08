require "rails_helper"

RSpec.describe CheckpointsController, type: :request do
  let!(:user) { create(:user) }
  let!(:roadmap) { create(:roadmap) }
  let!(:checkpoint) { create(:checkpoint, roadmap: roadmap) }

  before do
    sign_in user
  end

  describe "GET/show" do
    let!(:resource) { create(:resource, checkpoint: checkpoint) }

    context "with valid resource" do
      it "checks http status" do
        get roadmap_checkpoint_path(roadmap, checkpoint)

        expect(response).to have_http_status(200)
      end

      it "checks resource static information showing " do
        get roadmap_checkpoint_path(roadmap, checkpoint)

        expect(response.body).to include "Un gran video de Rails"
        expect(response.body).to include "https://www.youtube.com/watch?v=lGLade0I8xw"
      end
    end

    context "without user rating on resource" do
      it "shows rate input form"
    end

    context "with user rating on resource" do
      let!(:resource_rating) { create(:resource_rating, user: user, resource: resource) }
      it "shows user rating"
    end

  end
end
