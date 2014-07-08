require 'spec_helper'

describe User do

  context "with a valid email address and password" do
    subject { Fabricate(:user) }

    it "is valid" do
      # expect(subject.valid?).to be_true
      # expect(subject.email).not_to be_blank
      expect(subject.user_name).not_to be_blank
      # expect(subject.salt).not_to be_blank
      # expect(subject.fish).not_to be_blank
    end
  end
end
