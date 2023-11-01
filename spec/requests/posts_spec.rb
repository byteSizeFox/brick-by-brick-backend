require 'rails_helper'

RSpec.describe "Posts", type: :request do 
  let(:user) { User.create(
    email: 'user1@email.com', 
    password: 'password',
    password_confirmation: 'password'
    )
  }

  describe "GET /index" do
    it 'gets a lists of posts' do
      post = user.posts.create(
        title: 'post1',
        time_spent: '3 hours',
        difficulty: 5,
        price: '$100',
        review: 'sample review',
        image: 'https://unsplash.com/photos/lego-mini-figure-on-brown-sand-kgz9vsP5JCU',
        user_id: 1
      )
      get '/posts' 

    post = JSON.parse(response.body)
    expect(response).to have_http_status(200) 
    expect(post.first['title']).to eq('post1')
    end
  end
end
