require "rails_helper"

RSpec.describe Roadmap, type: :model do
  subject {Roadmap.new(
    title: 'El camino para convertirte en dev en 3 meses',
    project_link: 'https://fintual.notion.site/Paraffin-7eeb003d91614a2cbed2a2e260efde61'
    )
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a title" do
    subject.title=nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a project_link" do
    subject.project_link=nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a valid project_link" do
    subject.project_link="aaaaaaa"
    expect(subject).to_not be_valid
  end  
  
end
