class PostsController < ApplicationController
  before_action :signed_in_user, only: [:new, :create]

def index
  @posts = Post.all

end

def new
  @post = Post.new

end

def create
  @post = Post.new(post_params)
  @post.user_id = current_user.id

  if @post.save
    redirect_to root_path
  else
    render 'new'
  end
end


private

    def signed_in_user
      unless signed_in?
        redirect_to sign_in_url
      end
    end

    def post_params
      params.require(:post).permit(:title, :body)
    end
end



