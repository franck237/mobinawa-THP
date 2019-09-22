require 'rails_helper'

RSpec.describe Company, type: :model do
  before(:each) do 
    @company = FactoryBot.create(:company)    
end

  it "has a valid factory" do
    # Always testing the factory in order to see if they are valid
    expect(build(:company)).to be_valid
  end

  context "validation" do

    it "is valid with valid attributes" do
      expect(@company).to be_a(Company)
    end

    describe "#number" do
      it { expect(@company).to validate_presence_of(:number) }
    end

    describe "#name" do
      it { expect(@company).to validate_presence_of(:name) }
    end

    describe "#description" do
      it { expect(@company).to validate_length_of(:description).is_at_least(10)}
    end

    describe "#status" do
      it { expect(@company).to validate_inclusion_of(:status).in_array([0, 1, 2]) }
    end

  end

  context "associations" do

    describe "admin" do
      it { expect(@company).to belong_to(:admin) }
    end

    describe "company" do
      it { expect(@company).to belong_to(:country) }
    end	 

    describe "sub_sector" do
      it { expect(@company).to belong_to(:sub_sector) }
    end   
    describe "products" do
      it { expect(@company).to have_many(:products) }
    end

  end

end
