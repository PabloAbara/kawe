require "rails_helper"

RSpec.describe Checkpoint, type: :model do
  
  let!(:roadmap) do 
		Roadmap.create(
			title: 'El camino para convertirte en dev en 3 meses',
			project_link: 'https://fintual.notion.site/Paraffin-7eeb003d91614a2cbed2a2e260efde61'
    )
  end
    
  subject do
    described_class.new(
      title: 'Intro to Git',
      roadmap_id: roadmap.id
		)
	end

	context "happy path" do
		it "is valid with valid attributes" do
			expect(subject).to be_valid
		end
	end
    
	context "without title" do
		before do 
			subject.title=nil
		end

		it do 
			expect(subject).to_not be_valid
		end
	end

	context "without roadmap_id" do 
		before do
			subject.roadmap_id=nil
		end
		
		it do
			expect(subject).to_not be_valid
		end
	end

	context "without valid roadmap_id" do 
		before do
			subject.roadmap_id=100
		end
		
		it do
			expect(subject).to_not be_valid
		end
	end

end
