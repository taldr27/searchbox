require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.create(email: "user@example.com", password: "password") }

  describe "associations" do
    it { should have_many(:articles) }
  end

  describe "devise modules" do
    it { should respond_to(:email) }
    it { should respond_to(:password) }
    it { should respond_to(:remember_me) }
  end

  describe "username" do
    it "returns the capitalized email address username" do
      expect(user.username).to eq "User"
    end
  end

  describe "validations" do
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email).case_insensitive }
    it { should validate_presence_of(:password).on(:create) }
  end
end
