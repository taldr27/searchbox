require 'rails_helper'


RSpec.describe Article, type: :model do
  let(:user) { User.create(email: "user@example.com", password: "password") }
  let(:article) { Article.new(title: "Test Article", user: user) }

  describe "validations" do
    it "is valid with valid attributes" do
      expect(article).to be_valid
    end

    it "is not valid without a title" do
      article.title = nil
      expect(article).to_not be_valid
    end

    it "is not valid with a title less than 6 characters" do
      article.title = "short"
      expect(article).to_not be_valid
    end

    it "is not valid with a title more than 100 characters" do
      article.title = "a" * 101
      expect(article).to_not be_valid
    end
  end

  describe "associations" do
    it { should belong_to(:user) }
  end
end