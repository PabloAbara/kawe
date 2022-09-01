require "rails_helper"

RSpec.describe Resource, type: :model do
  subject do
    build(:resource)
  end

  it "is valid with valid attributes" do
    expect(subject.valid?).to be(true)
  end

  context "without a title" do
    before do
      subject.title = nil
    end

    it do
      expect(subject.valid?).to be(false)
    end
  end

  context "without a checkpoint" do
    before do
      subject.checkpoint = nil
    end

    it do
      expect(subject.valid?).to be(false)
    end
  end

  context "without a link" do
    it "is not valid" do
      subject.link = nil

      expect(subject.valid?).to be(false)
    end
  end
end