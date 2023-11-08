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
    def update
        post = Post.find(params[:id])
        post.update(post_params) 
        if post.valid?
            render json: post
        else
            render json: { errors: post.errors.full_messages }, status: 422
        end
    end
    def destroy
        delete_post = Post.find(params[:id])
        posts = Post.all 
        if delete_post.destroy
            render json: posts
        else 
            render json: delete_post.errors
        end
    end
    private 
    def post_params 
        params.require(:post).permit(:image, :title, :time_spent, :difficulty, :price, :review, :user_id) 
    end 
end
