require 'rails_helper'

RSpec.describe Admin, type: :model do
  
before(:each) do 
    @admin = FactoryBot.create(:admin)    
  end

  it "has a valid factory" do
    # teste toujours tes factories pour voir si elles sont valides
    expect(@admin).to be_valid
  end

  context "validation" do

    it "is valid with valid attributes" do
      expect(@admin).to be_a(Admin)
    end

    describe "#number" do
      it { expect(@admin).to validate_presence_of(:number) }
    end

    describe "#password" do
      it { expect(@admin).to validate_length_of(:password).is_at_least(8) }
    end

    describe "#firstname" do
      it { expect(@admin).to validate_presence_of(:firstname) }
    end

    describe "#lastname" do
      it { expect(@admin).to validate_presence_of(:lastname) }
    end

    describe "#function" do
      it { expect(@admin).to validate_presence_of(:function) }
    end

  end

  context "associations" do

    describe "country" do
      it { expect(@admin).to belong_to(:country) }
    end

  end

  context "public instance methods" do

    describe "#fullname" do

      it "should return a string" do
        expect(@admin.fullname).to be_a(String)
      end

      it "should return the full name" do
        expect(@admin.fullname).to eq("#{@admin.firstname} #{@admin.lastname}")
        user_2 = create(:admin, firstname: "Yvon", lastname: "EKWALLA", email: "eya@gmail.com")
        expect(user_2.fullname).to eq("Yvon EKWALLA")
      end
    end
  end

end
