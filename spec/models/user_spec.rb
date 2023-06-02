require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_least(3).is_at_most(25) }
  end

  describe 'associations' do
    it { should have_many(:foods).dependent(:destroy) }
    it { should have_many(:recipes) }
    it { should have_many(:recipe_foods) }
  end

  describe 'devise modules' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
    it { should validate_confirmation_of(:password) }
    it { should validate_length_of(:password).is_at_least(6).is_at_most(128) }
    it { should have_secure_password }
  end
end
