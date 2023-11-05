require 'rails_helper'

RSpec.describe User, type: :model do
 it 'is not valid without an email' do
  user = User.create(
    password: "password", 
    password_confirmation: "password"
  )
  expect(user.errors[:email]).to_not be_empty
 end 
 it 'is not valid without a password' do
    user = User.create(
    email: "test1@example.com",
    password_confirmation: "password"
    )
    expect(user.errors[:password]).to_not be_empty
 end
 it 'is not valid without a password confirmation' do
    user = User.create(
    email: "test1@example.com",
    password: "password"
    )
    expect(user.errors[:password_confirmation]).to_not be_empty
 end
 context 'without an @ sign' do
    let(:email) { 'testexample.com' }

    it 'is not valid' do
      expect(subject).to_not be_valid
      expect(subject.errors[:email]).to include('is invalid')
    end
  end
end


