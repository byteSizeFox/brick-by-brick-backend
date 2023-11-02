require 'rails_helper'

RSpec.describe Post, type: :model do

  it 'should validate title' do
    post = Post.create(
      title: nil,
      time_spent: '3 hours',
      difficulty: 5,
      price: '$100',
      review: 'sample review',
      image: 'https://unsplash.com/photos/lego-mini-figure-on-brown-sand-kgz9vsP5JCU',
      user_id: user.id
    )
      expect(post.errors[:title]).to_not be_empty

  end
end 
