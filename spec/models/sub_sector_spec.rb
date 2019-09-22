require 'rails_helper'

RSpec.describe SubSector, type: :model do

  before(:each) do 
    @sub_sector = FactoryBot.create(:sub_sector)    
  end

  it "has a valid factory" do
    # teste toujours tes factories pour voir si elles sont valides
    expect(@sub_sector).to be_valid
  end

  context "validation" do

    it "is valid with valid attributes" do
      expect(@sub_sector).to be_a(SubSector)
    end

    describe "#name" do
      it { expect(@sub_sector).to validate_presence_of(:name) }
    end

  end

  context "associations" do

    describe "sub_sector" do
      it { expect(@sub_sector).to belong_to(:sector) }
    end

  end
end
