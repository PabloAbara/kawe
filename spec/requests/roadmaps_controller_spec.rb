require "rails_helper"

RSpec.describe RoadmapsController, type: :request do
  let!(:user) { create(:user) }
  let!(:roadmap) { create(:roadmap) }

  before do
    sign_in user
  end

  describe "index" do
    it do
      get roadmaps_path

      expect(response.body).to include "redirected"
    end
  end

  describe "show" do
    let!(:checkpoint) { create(:checkpoint, roadmap: roadmap) }

    it "check link existance with include"
    it "check title existance with include"

    context "with completed checkpoint" do
      let!(:completed_checkpoint) do
        create(:completed_checkpoint, user: user, checkpoint: checkpoint)
      end

      it do
        get roadmap_path(roadmap)

        expect(response.body).to include "Marcar como incompleto"
      end
    end

    context "without completed checkpoint" do
      it do
        get roadmap_path(roadmap)

        expect(response.body).to include "Marcar como completo"
      end
    end
  end

  describe "post complete_checkpoint" do
    it "complete_checkpoint_route"
  end

  describe "delete uncomplete_checkpoint" do
    it "uncomplete_checkpoint_route"
  end
end
