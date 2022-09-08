# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  name                   :string           not null
#
require "rails_helper"

RSpec.describe User, type: :model do
  subject do
    described_class.new(email: "test@fin.cl", password: "123456", password_confirmation: "123456", role: "mentor")
  end

  it "is valid with valid attributes" do
    expect(subject.valid?).to be(true)
  end

  it "is not valid without an email" do
    subject.email = nil
    expect(subject.valid?).to be(false)
  end

  it "is not valid without a role" do
    subject.role = nil
    expect(subject.valid?).to be(false)
  end
end
