require 'rails_helper'

RSpec.describe Prisoner, :type => :model do
  subject {
    described_class.new(first_name: "Bobby", last_name: "Fisher")
  }

  describe "Validations" do

    it "is invalid without a first name" do
      subject.first_name = nil
      expect(subject).to_not be_valid
    end

    it "is invalid without a last name" do
      subject.last_name = nil
      expect(subject).to_not be_valid
    end

    it "is truthy" do
      subject.last_name = "Fisher"
      expect(subject).to be_truthy
    end

  end

 end

 describe Prisoner, "#full_name" do
   it " is truthy " do
     expect(subject).to be_truthy
   end

 end
