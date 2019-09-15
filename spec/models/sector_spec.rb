require 'rails_helper'

RSpec.describe Sector, type: :model do

  before(:each) do 
    @sector = FactoryBot.create(:sector)    
  end

  it "has a valid factory" do
    # teste toujours tes factories pour voir si elles sont valides
    expect(@sector).to be_valid
  end

  context "validation" do

    it "is valid with valid attributes" do
      expect(@sector).to be_a(Sector)
    end

    describe "#name" do
      it { expect(@sector).to validate_uniqueness_of(:name) }
    end

    describe "#icon" do
      it { expect(@sector).to validate_presence_of(:icon) }
    end

  end

  context "associations" do

    describe "sub_sectors" do
      it { expect(@sector).to have_many(:sub_sectors) }
    end

  end
end
