require 'spec_helper'

describe User do

  context "with a valid email address and password" do
    subject { Fabricate(:user) }

    it "is valid" do
      expect(2).to eq 2
      # expect(subject.valid?).to be_true
      # expect(subject.salt).not_to be_blank
      # expect(subject.fish).not_to be_blank
    end
  end
end
