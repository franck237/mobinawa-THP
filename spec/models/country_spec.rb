require 'rails_helper'

RSpec.describe Country, type: :model do
  before(:each) do 
    @country = FactoryBot.create(:country)    
end

  it "has a valid factory" do
    # Always testing the factory in order to see if they are valid
    expect(build(:country)).to be_valid
  end

  context "validation" do

    it "is valid with valid attributes" do
      expect(@country).to be_a(Country)
    end

    describe "#name" do
      it { expect(@country).to validate_uniqueness_of(:name) }
    end

    describe "#flag" do
      it { expect(@country).to validate_uniqueness_of(:flag).case_insensitive }
    end

    describe "#code" do
      it { expect(@country).to validate_length_of(:code).is_at_least(1).is_at_most(4) }
    end

    describe "#status" do
      it { expect(@country).to validate_inclusion_of(:status).in_array([true, false]) }
    end

    describe "#digit" do
      it { expect(@country).to validate_numericality_of(:digit).only_integer }
    end


  end

  context "associations" do

    describe "admins" do
      it { expect(@country).to have_many(:admins) }
    end

    describe "companies" do
      it { expect(@country).to have_many(:companies) }
    end	    

  end

end

