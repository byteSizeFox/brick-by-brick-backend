class PostsController < ApplicationController
    def index
        posts = Post.all 
        render json: posts
    end
    def create 
        post = Post.create(post_params)
        if post.valid?
            render json: post 
        else 
            render json: post.errors, status: 422
        end
    end 
    private 
    def post_params 
        params.require(:post).permit(:image, :title, :time_spent, :difficulty, :price, :review, :user_id) 
    end 
end
