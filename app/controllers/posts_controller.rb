class PostsController < ApplicationController
    
    def new
        @post = Post.new
    end
    
    def create
        @post = Post.new(post_params)
        if @post.save
           if @post.category == 'news'
               redirect_to news_path
           elsif @post.category == 'rumors'
               redirect_to rumors_path
           elsif @post.category == 'discussion'
               redirect_to discussion_path
           end
        else
            render :new
        end
    end
    
    def show
        @post = Post.find(params[:id])
        @comments = @post.comments
        @comment = @post.comments.new
    end
    
    def index
        @posts = Post.all
    end
    
    def news
        @posts = Post.where('category = ?', 'news')
    end
    
    def rumors
        @posts = Post.where('category = ?', 'rumors')
    end
    
    def discussion
        @posts = Post.where('category = ?', 'discussion')
    end
    
    def edit
        @post = Post.find(params[:id])
    end
    
    def update
        @post = Post.find(params[:id])
        @post.update(post_params)
        redirect_to @post
    end
    
    def destroy
        @post = Post.find(params[:id])
        @post.delete
        redirect_to posts_path
    end
    
    private
    
        def post_params
            params.require(:post).permit(:title, :link, :content, :category, :rating)
        end
end
