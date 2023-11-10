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
		user_id: 1
		)
		expect(post.errors[:title]).to_not be_empty

	end
	it 'should validate time_spent' do
		post = Post.create(
		title: 'post1',
		time_spent: nil,
		difficulty: 5,
		price: '$100',
		review: 'sample review',
		image: 'https://unsplash.com/photos/lego-mini-figure-on-brown-sand-kgz9vsP5JCU',
		user_id: 1
		)
		expect(post.errors[:time_spent]).to_not be_empty
	
	end 

	it 'should validate difficulty' do
	post = Post.create(
		title: 'post1',
		time_spent: '3 hours',
		difficulty: nil,
		price: '$100',
		review: 'sample review',
		image: 'https://unsplash.com/photos/lego-mini-figure-on-brown-sand-kgz9vsP5JCU',
		user_id: 1
	)
		expect(post.errors[:difficulty]).to_not be_empty

	end 

	it 'should validate price' do
	post = Post.create(
		title: 'post1',
		time_spent: '3 hours',
		difficulty: 5,
		price: nil,
		review: 'sample review',
		image: 'https://unsplash.com/photos/lego-mini-figure-on-brown-sand-kgz9vsP5JCU',
		user_id: 1
	)
		expect(post.errors[:price]).to_not be_empty

	end 

	it 'should validate review' do
	post = Post.create(
		title: 'post1',
		time_spent: '3 hours',
		difficulty: 5,
		price: '$100',
		review: nil,
		image: 'https://unsplash.com/photos/lego-mini-figure-on-brown-sand-kgz9vsP5JCU',
		user_id: 1
	)
		expect(post.errors[:review]).to_not be_empty

	end 

	it 'should validate image' do
	post = Post.create(
		title: 'post1',
		time_spent: '3 hours',
		difficulty: 5,
		price: '$100',
		review: 'sample review',
		image: nil,
		user_id: 1
	)
		expect(post.errors[:image]).to_not be_empty
	end

	# it 'should validate image' do
	# 	post = Post.create(
	# 		title: 'post1',
	# 		time_spent: '3 hours',
	# 		difficulty: 5,
	# 		price: '$100',
	# 		review: 'sample review',
	# 		image: 'https://unsplash.com/photos/lego-mini-figure-on-brown-sand-kgz9vsP5JCU',
	# 		user_id: 1
	# )
	# 	expect(post.errors[:image]).to_not be_empty

	# end 
end
