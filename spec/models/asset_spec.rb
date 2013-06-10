require 'spec_helper'

describe Asset do
  context "Validation test" do
    it "validates mandatory fields" do 
      FactoryGirl.create(:asset).should be_valid
    end

    it "validates mandatory field purchase date" do 
      FactoryGirl.build(:asset, purchase_date: nil).should_not be_valid
    end
 
    it "validates mandatory field serial number" do 
      FactoryGirl.build(:asset, serial_number: nil).should_not be_valid
    end

    it "validates mandatory field asset id" do 
      FactoryGirl.build(:asset, asset_id: nil).should_not be_valid
    end

    it "validates mandatory field make year" do 
      FactoryGirl.build(:asset, make_year: nil).should_not be_valid
    end

    it "validates numeric asset id" do 
      FactoryGirl.build(:asset, asset_id: 'a'*21).should_not be_valid
    end

    it "validates mandatory field serial number" do 
      FactoryGirl.build(:asset, serial_number: 'a'*26).should_not be_valid
    end

    it "validates mandatory field description" do 
      FactoryGirl.build(:asset, description: 'a'*201).should_not be_valid
    end

    it "validates mandatory field display_size" do 
      FactoryGirl.build(:asset, display_size: 'a'*11).should_not be_valid
    end

    it "validates mandatory field manufacturer" do 
      FactoryGirl.build(:asset, manufacturer: 'a'*21).should_not be_valid
    end

    it "validates mandatory field model" do 
      FactoryGirl.build(:asset, model: 'a'*16).should_not be_valid
    end

    it "validates mandatory field operating_system" do 
      FactoryGirl.build(:asset, operating_system: 'a'*16).should_not be_valid
    end

    it "validates asset bounded flag" do 
      FactoryGirl.build(:asset, asset_bounded: nil).should_not be_valid
    end
 end
end
