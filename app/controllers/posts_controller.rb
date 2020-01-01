class PostsController < ApplicationController
    def index
        posts = Post.all
        render :json => posts
    end

    def show
        post = post.find(params[:id])
        render :json => post
    end

    def create
        post = Post.new(set_param)
        if post.save
            render :json => post
        end
    end

    private

    def set_param
        params.require(:post).permit(:title, :discription)
    end

end
