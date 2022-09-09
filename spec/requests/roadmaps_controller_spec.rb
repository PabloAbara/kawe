require "rails_helper"

RSpec.describe RoadmapsController, type: :request do
  let!(:user) { create(:user) }
  let!(:roadmap) { create(:roadmap) }

  before do
    sign_in user
  end

  describe "GET/index" do
    it do
      get roadmaps_path

      expect(response).to redirect_to(roadmap_path(roadmap))
    end
  end

  describe "GET/show" do
    let!(:checkpoint) { create(:checkpoint, roadmap: roadmap) }

    context "with valid roadmap" do
      it "checks attributes showing" do
        get roadmap_path(roadmap)

        expect(response.body).to include "https://github.com/PabloAbara/kawe"
        expect(response.body).to include "Kawe"
      end
    end

    context "with completed checkpoint" do
      let!(:completed_checkpoint) do
        create(:completed_checkpoint, user: user, checkpoint: checkpoint)
      end

      it do
        get roadmap_path(roadmap)

        expect(response.body).to include "Completo ✅"
      end
    end

    context "without completed checkpoint" do
      it do
        get roadmap_path(roadmap)

        expect(response.body).to include "Incompleto 👮🏻‍♂️"
      end
    end
  end

  describe "POST/complete_checkpoint" do
    let!(:checkpoint) { create(:checkpoint, roadmap: roadmap) }

    context "with valid checkpoint_id" do
      it "creates a completed checkpoint" do
        expect do
          post roadmap_complete_checkpoint_path(roadmap, checkpoint_id: checkpoint.id)
        end.to change(CompletedCheckpoint, :count).by(1)
      end

      it "redirects and sends flash message" do
        post roadmap_complete_checkpoint_path(roadmap, checkpoint_id: checkpoint.id)
        expect(response).to redirect_to(roadmap_path(roadmap))
        expect(flash[:notice]).to be_present
      end
    end

    context "without checkpoint_id" do
      it "doesn't create a completed checkpoint" do
        expect do
          post roadmap_complete_checkpoint_path(roadmap)
        end.not_to change(CompletedCheckpoint, :count)
      end

      it "redirects and sends flash message" do
        post roadmap_complete_checkpoint_path(roadmap)
        expect(response).to redirect_to(roadmap_path(roadmap))
        expect(flash[:alert]).to be_present
      end
    end

    context "without valid checkpoint_id" do
      before do
        checkpoint.delete
      end

      it "doesn't create a completed checkpoint" do
        expect do
          post roadmap_complete_checkpoint_path(roadmap, checkpoint_id: checkpoint.id)
        end.not_to change(CompletedCheckpoint, :count)
      end

      it "redirects and sends flash message" do
        post roadmap_complete_checkpoint_path(roadmap, checkpoint_id: checkpoint.id)
        expect(response).to redirect_to(roadmap_path(roadmap))
        expect(flash[:alert]).to be_present
      end
    end
  end

  describe "DELETE/uncomplete_checkpoint" do
    let!(:checkpoint) { create(:checkpoint, roadmap: roadmap) }
    let!(:completed_checkpoint) do
      create(:completed_checkpoint, checkpoint: checkpoint, user: user)
    end

    context "with existing completed_checkpoint" do
      it "deletes completed checkpoint" do
        expect do
          delete roadmap_uncomplete_checkpoint_path(roadmap, checkpoint_id: checkpoint.id)
        end.to change(CompletedCheckpoint, :count).by(-1)
      end

      it "redirects and sends flash message" do
        delete roadmap_uncomplete_checkpoint_path(roadmap, checkpoint_id: checkpoint.id)
        expect(response).to redirect_to(roadmap_path(roadmap))
        expect(flash[:notice]).to be_present
      end
    end

    context "without existing completed_checkpoint" do
      before do
        completed_checkpoint.delete
      end

      it "doesn't delete completed checkpoint" do
        expect do
          delete roadmap_uncomplete_checkpoint_path(roadmap, checkpoint_id: checkpoint.id)
        end.not_to change(CompletedCheckpoint, :count)
      end

      it "redirects and sends flash message" do
        delete roadmap_uncomplete_checkpoint_path(roadmap, checkpoint_id: checkpoint.id)
        expect(response).to redirect_to(roadmap_path(roadmap))
        expect(flash[:alert]).to be_present
      end
    end

    context "without checkpoint_id" do
      it "doesn't delete completed checkpoint" do
        expect do
          delete roadmap_uncomplete_checkpoint_path(roadmap)
        end.not_to change(CompletedCheckpoint, :count)
      end

      it "redirects and sends flash message" do
        delete roadmap_uncomplete_checkpoint_path(roadmap)
        expect(response).to redirect_to(roadmap_path(roadmap))
        expect(flash[:alert]).to be_present
      end
    end

    context "without valid checkpoint_id" do
      let!(:new_checkpoint) { create(:checkpoint, title: "New Checkpoint") }

      it "doesn't delete completed checkpoint" do
        expect do
          delete roadmap_uncomplete_checkpoint_path(roadmap, roadmap: roadmap,
                                                             checkpoint_id: new_checkpoint.id)
        end.not_to change(CompletedCheckpoint, :count)
      end

      it "redirects and sends flash message" do
        delete roadmap_uncomplete_checkpoint_path(roadmap, roadmap: roadmap,
                                                           checkpoint_id: new_checkpoint.id)
        expect(response).to redirect_to(roadmap_path(roadmap))
        expect(flash[:alert]).to be_present
      end
    end
  end

  describe "POST/create_checkpoint" do
    let!(:new_checkpoint) { create(:checkpoint) }

    context "with valid parameters" do
      it "creates a checkpoint" do
        expect do
          post roadmap_create_checkpoint_path(roadmap, checkpoint: { title: new_checkpoint.title })
        end.to change(Checkpoint, :count).by(1)
      end

      it "redirects and sends flash message" do
        post roadmap_create_checkpoint_path(roadmap, checkpoint: { title: new_checkpoint.title })
        expect(response).to redirect_to(roadmap_path(roadmap))
        expect(flash[:notice]).to be_present
      end
    end

    context "without valid title" do
      invalid_checkpoint_title = ""

      it "doesn't create a checkpoint" do
        expect do
          post roadmap_complete_checkpoint_path(roadmap,
                                                checkpoint: { title: invalid_checkpoint_title })
        end.not_to change(CompletedCheckpoint, :count)
      end

      it "redirects and sends flash message" do
        post roadmap_complete_checkpoint_path(roadmap,
                                              checkpoint: { title: invalid_checkpoint_title })
        expect(response).to redirect_to(roadmap_path(roadmap))
        expect(flash[:alert]).to be_present
      end
    end

    context "without valid roadmap" do
      invalid_checkpoint_roadmap = 0

      it "doesn't create a checkpoint" do
        expect do
          post roadmap_complete_checkpoint_path(invalid_checkpoint_roadmap,
                                                checkpoint: { title: new_checkpoint.title })
        end.not_to change(Checkpoint, :count)
      end

      it "redirects and sends flash message" do
        post roadmap_complete_checkpoint_path(invalid_checkpoint_roadmap,
                                              checkpoint: { title: new_checkpoint.title })
        expect(response).to redirect_to(roadmap_path(roadmap))
        expect(flash[:alert]).to be_present
      end
    end
  end
end
