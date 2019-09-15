require 'rails_helper'

RSpec.describe Product, type: :model do
	  before(:each) do 
	    @product = FactoryBot.create(:product)    
	  end

	  it "has a valid factory" do
	    # Always testing the factory in order to see if they are valid
    	expect(@product).to be_valid
	  end

	  context "validation" do

	    it "is valid with valid attributes" do
	      expect(@product).to be_a(Product)
	    end

	    describe "#title" do
	      it { expect(@product).to validate_presence_of(:title) }
	    end

	    describe "#description" do
	      it { expect(@product).to validate_length_of(:description).is_at_least(5)}
	    end

	    describe "#price" do
	      it { expect(@product).to validate_numericality_of(:price).is_greater_than_or_equal_to(0) }
	    end

	    describe "#image_product" do
	      it { expect(@product).to validate_presence_of(:image_product) }
	    end

	    describe "#quantity" do
	      it { expect(@product).to validate_numericality_of(:quantity).only_integer }
	    end

	    describe "#status" do
	      it { expect(@product).to validate_inclusion_of(:status).in_array([true, false]) }
	    end

	  end

	  context "associations" do

	    describe "company" do
	      it { expect(@product).to belong_to(:company) }
	    end
	 end

end
