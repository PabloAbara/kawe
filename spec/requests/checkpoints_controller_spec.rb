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
    end
  end

  describe "POST/create_resource" do
    context "with valid params" do
      it "creates a new resource" do

        expect do
          post create_resource_roadmap_checkpoint_path(
            roadmap,checkpoint,
            params: {
              resource: {
                title: "New Resource",
                link: "https://www.notion.so/fintual-fin/" }})
        end.to change(Resource, :count).by(1)
      end

      it "redirects with notice" do
        post create_resource_roadmap_checkpoint_path(
          roadmap,checkpoint,
          params: {
            resource: {
              title: "New Resource",
              link: "https://www.notion.so/fintual-fin/"
            }
          }
        )

        expect(response).to redirect_to(roadmap_checkpoint_path(roadmap, checkpoint))
      end
    end

    context "without params" do
      let(:new_checkpoint) {build(:checkpoint)}

      it "does't create new resource" do

        expect do
          post create_resource_roadmap_checkpoint_path(
            roadmap,checkpoint)
        end.not_to change(Resource, :count)
      end

      it "redirects with alert" do
        post create_resource_roadmap_checkpoint_path(
          roadmap,checkpoint)

        expect(response).to redirect_to(roadmap_checkpoint_path(roadmap, checkpoint))
      end
    end
  end

  describe "DELETE/delete_resource" do
    let!(:resource) { create(:resource, checkpoint: checkpoint) }

    context "with valid params" do

      it "deletes the resource" do

        expect do
          delete delete_resource_roadmap_checkpoint_path(roadmap, checkpoint,resource_id: resource.id)
        end.to change(Resource, :count).by(-1)
      end

      it "redirects with notice" do
        delete delete_resource_roadmap_checkpoint_path(roadmap, checkpoint,resource_id: resource.id)

        expect(response).to redirect_to(roadmap_checkpoint_path(roadmap, checkpoint))
      end
    end

    context "without resource" do
      it "does't delete any resource" do

        expect do
          delete delete_resource_roadmap_checkpoint_path(roadmap, checkpoint)
        end.not_to change(Resource, :count)
      end
    end

    context "without valid resource" do
      before do
        resource.delete
      end

      it "does't delete any resource" do

        expect do
          delete delete_resource_roadmap_checkpoint_path(roadmap, checkpoint, resource_id: resource.id)
        end.not_to change(Resource, :count)
      end
    end
  end

  describe "POST/rate_resource" do
    let!(:resource) { create(:resource, checkpoint: checkpoint) }
    context "with valid resource" do
      it "creates rating resource" do

        expect do
          post rate_resource_roadmap_checkpoint_path(
            roadmap,checkpoint,
            params: {
              resource: {
                rating: "5",
                resource_id: resource.id }})
        end.to change(ResourceRating, :count).by(1)
      end
      it "redirects with notice" do
        post rate_resource_roadmap_checkpoint_path(
          roadmap,checkpoint,
          params: {
            resource: {
              rating: "5",
              resource_id: resource.id
            }
          }
        )

        expect(response).to redirect_to(roadmap_checkpoint_path(roadmap, checkpoint))
      end
    end

    context "without valid resource" do
      before do
        resource.delete
      end

      it "doesn't create new rating resource" do

        expect do
          post rate_resource_roadmap_checkpoint_path(
            roadmap,checkpoint,
            params: {
              resource: {
                rating: "5",
                resource_id: resource.id }})
        end.to change(ResourceRating, :count).by(0)
      end
      it "redirects with alert" do
        post rate_resource_roadmap_checkpoint_path(
          roadmap,checkpoint,
          params: {
            resource: {
              rating: "5",
              resource_id: resource.id }})

        expect(response).to redirect_to(roadmap_checkpoint_path(roadmap, checkpoint))
      end
    end
  end


end
