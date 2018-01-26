require 'rails_helper'
require "validates_email_format_of/rspec_matcher"

describe Guard do
  it { should validate_email_format_of(:email).with_message('Does not appear to be a valid e-mail address') }
end

RSpec.describe Guard, :type => :model do
 subject {
   described_class.new(first_name: "Oleg", last_name: "Chursin", email: "oc@gmail.com", password_digest: "$2a$10$FWvJySx2YRNjOdxu6vQLEOh6o4L2kvwosgsikRhtlPFv/xTJ/759W")}

 describe "Validations" do

   it "is invalid without a first name" do
     subject.first_name = nil
     expect(subject).to_not be_valid
   end

   it "is invalid without a last name" do
     subject.last_name = nil
     expect(subject).to_not be_valid
   end

   it "is invalid without a email" do
     subject.email = nil
     expect(subject).to_not be_valid
   end

   it "is invalid without a password digest" do
     subject.password_digest = nil
     expect(subject).to_not be_valid
   end
 end



end
