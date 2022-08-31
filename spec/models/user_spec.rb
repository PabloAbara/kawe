require "rails_helper"

RSpec.describe User, type: :model do
  subject do
    described_class.new(email: "test@fin.cl", password: "123456", password_confirmation: "123456")
  end

  it "is valid with valid attributes" do
    expect(subject.valid?).to be(true)
  end

  it "is not valid without an email" do
    subject.email = nil
    expect(subject.valid?).to be(false)
  end
end
