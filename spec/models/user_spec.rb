require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_uniqueness_of(:email).case_insensitive}
  end

  describe 'set_api_key' do
    it 'can generate an api key' do
      user = User.create(email: "margo@example.com", password: "123", password_confirmation: "123")
      expect(user.api_key).to be_a String
      expect(user.api_key.length).to eq(24)
    end
  end

end
