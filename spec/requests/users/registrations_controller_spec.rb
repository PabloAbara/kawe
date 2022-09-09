require "rails_helper"

RSpec.describe Users::RegistrationsController, type: :request do
  describe "GET/show" do
    context "when requests new user form" do
      it "render all fields" do
        get new_user_registration_path
        expect(response.body).to include("Name")
        expect(response.body).to include("Email")
        expect(response.body).to include("Password")
        expect(response.body).to include("Password confirmation")
      end
    end
  end

  describe "POST/create" do
    user_params = {
      name: "Test2",
      email: "test1@fin.cll",
      password: "123456",
      password_confirmation: "123456",
      role: "mentor"
    }
    context "with valid inputs" do
      it "creates a record in users table" do
        expect do
          post user_registration_path, params: { user: user_params }
        end.to change(User, :count).by(1)
      end
    end
  end
end
