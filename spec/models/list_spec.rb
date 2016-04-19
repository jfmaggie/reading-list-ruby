require "rails_helper"

RSpec.describe List, type: :model do
  let(:list) { FactoryGirl.build(:list) }
  let(:invalid_list) { FactoryGirl.build(:invalid_list) }

  describe "Creating a new list" do
    it "should successfully save a list with a valid name" do
      expect{ list.save }.to change{ List.count }.by(1)
    end

    it "should not save an invalid list" do
      expect{ invalid_list.save }.to change{ List.count }.by(0)
    end
  end
end
