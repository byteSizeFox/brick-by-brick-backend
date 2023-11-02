require 'rails_helper'

RSpec.describe "Posts", type: :request do   
  let(:user) { User.create(
    email: 'user1@email.com', 
    password: 'password',
    password_confirmation: 'password'
  )}

  describe "GET /index" do
    it 'gets a lists of posts' do
      post = user.posts.create(
        title: 'post1',
        time_spent: '3 hours',
        difficulty: 5,
        price: '$100',
        review: 'sample review',
        image: 'https://unsplash.com/photos/lego-mini-figure-on-brown-sand-kgz9vsP5JCU',
        user_id: user.id
      )
      get '/posts' 

      post = JSON.parse(response.body)
      expect(post.first['title']).to eq 'post1'
      expect(response).to have_http_status(200) 
    end
  end
  describe "POST /create" do
    it 'saves a valid entry into the database' do
      post_params = {
        post: {
          title: 'post1',
          time_spent: '3 hours',
          difficulty: 5,
          price: '$100',
          review: 'sample review',
          image: 'https://unsplash.com/photos/lego-mini-figure-on-brown-sand-kgz9vsP5JCU',
          user_id: user.id
        }
      }
      post '/posts', params: post_params
      post = JSON.parse(response.body)
      expect(post['title']).to eq 'post1'
      expect(response).to have_http_status(200)
    end
    it 'does not save an entry missing a title' do
      post_params = {
        post: {
          title: '',
          time_spent: '3 hours',
          difficulty: 5,
          price: '$100',
          review: 'sample review',
          image: 'https://unsplash.com/photos/lego-mini-figure-on-brown-sand-kgz9vsP5JCU',
          user_id: user.id
        }
      }
      post '/posts', params: post_params
      post_error = JSON.parse(response.body)
      expect(post_error['title']).to include("can't be blank")
      expect(response).to have_http_status(422)
    end
    it 'does not save an entry missing a time spent' do
      post_params = {
        post: {
          title: 'post1',
          time_spent: nil,
          difficulty: 5,
          price: '$100',
          review: 'sample review',
          image: 'https://unsplash.com/photos/lego-mini-figure-on-brown-sand-kgz9vsP5JCU',
          user_id: user.id
        }
      }
      post '/posts', params: post_params
      post_error = JSON.parse(response.body)
      expect(post_error['time_spent']).to include("can't be blank")
      expect(response).to have_http_status(422)
    end
    it 'does not save an entry missing difficulty' do
      post_params = {
        post: {
          title: 'post1',
          time_spent: '3 hours',
          difficulty: nil,
          price: '$100',
          review: 'sample review',
          image: 'https://unsplash.com/photos/lego-mini-figure-on-brown-sand-kgz9vsP5JCU',
          user_id: user.id
        }
      }
      post '/posts', params: post_params
      post_error = JSON.parse(response.body)
      expect(post_error['difficulty']).to include("can't be blank")
      expect(response).to have_http_status(422)
    end
    it 'does not save an entry missing price' do
      post_params = {
        post: {
          title: 'post1',
          time_spent: '3 hours',
          difficulty: 5,
          price: nil,
          review: 'sample review',
          image: 'https://unsplash.com/photos/lego-mini-figure-on-brown-sand-kgz9vsP5JCU',
          user_id: user.id
        }
      }
      post '/posts', params: post_params
      post_error = JSON.parse(response.body)
      expect(post_error['price']).to include("can't be blank")
      expect(response).to have_http_status(422)
    end
    it 'does not save an entry missing review' do
      post_params = {
        post: {
          title: 'post1',
          time_spent: '3 hours',
          difficulty: 5,
          price: '$100',
          review: nil,
          image: 'https://unsplash.com/photos/lego-mini-figure-on-brown-sand-kgz9vsP5JCU',
          user_id: user.id
        }
      }
      post '/posts', params: post_params
      post_error = JSON.parse(response.body)
      expect(post_error['review']).to include("can't be blank")
      expect(response).to have_http_status(422)
    end
    it 'does not save an entry missing image' do
     post_params = {
        post: {
          title: 'post1',
          time_spent: '3 hours',
          difficulty: 5,
          price: '$100',
          review: 'sample review',
          image: nil,
          user_id: user.id
        }
      }
      post '/posts', params: post_params
      post_error = JSON.parse(response.body)
      expect(post_error['image']).to include("can't be blank")
      expect(response).to have_http_status(422)
    end
    it 'does not save an entry missing a user id' do
      post_params = {
        post: {
          title: 'post1',
          time_spent: '3 hours',
          difficulty: 5,
          price: '$100',
          review: 'sample review',
          image: 'https://unsplash.com/photos/lego-mini-figure-on-brown-sand-kgz9vsP5JCU',
          user_id: nil
        }
      }
      post '/posts', params: post_params
      post_error = JSON.parse(response.body)
      expect(post_error['user_id']).to include("can't be blank")
      expect(response).to have_http_status(422)
    end
  end

  describe "PUT /update" do
    it 'updates a post' do
      post = user.posts.create(
        title: 'post1',
        time_spent: '3 hours',
        difficulty: 5,
        price: '$100',
        review: 'sample review',
        image: 'https://unsplash.com/photos/lego-mini-figure-on-brown-sand-kgz9vsP5JCU',
        user_id: user.id
      )
      put "/posts/#{post.id}", params: { post: { review: 'updated review' } }

      post.reload
      
      expect(post.review).to eq 'updated review'
      expect(response).to have_http_status(200) 
    end
  end
end 
