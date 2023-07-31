class PostsController < ApplicationController
    def index
      @posts = Post.all
    end

    def new
    end

    def create
      category = Category.find params["post"]["category_ids"].map(&:to_i)
      post = Post.new(post_params.merge(author_id: 1))
      if post.save
        post.categories << category
        redirect_to posts_path, notice: 'Post was successfully created.'
      else
        render :new
      end
    end

    def show
      begin
        @post = Post.find params[:id]
      rescue => exception
        @post = nil
      end
    end

    def edit
      @post = Post.find params[:id]
    end

    def update
      @post = Post.find params[:id]
      category = Category.find params["post"]["category_ids"].map(&:to_i)
      if @post.update(post_params.merge(author_id: 1))
        @post.categories << category
        redirect_to posts_path
      else
        render :edit
      end
    end

    private

    def post_params
      params.require(:post).permit(:title, :description, :article, :thumbnail_image)
    end
end
