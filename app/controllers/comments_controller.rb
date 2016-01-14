class CommentsController < ApplicationController
    before_action :logged_in_user, only: [:create]
    before_action :correct_user, only: [:destroy]
    
    def create
        @comment = current_user.comments.new(comment_params)
        @post = Post.find(@comment.post_id)
        @comment.save
        redirect_to @post
    end
    
    def destroy 
       @comment = Comment.find(params[:id])
       @post = Post.find(@comment.post_id)
       @comment.delete
       redirect_to @post
    end
    
    private
    
        def correct_user
            comment = Comment.find(params[:id])
            user = User.find(comment.user_id)
            redirect_to root_path unless current_user?(user)
        end
        
        def logged_in_user
            redirect_to root_path unless logged_in?
        end
    
        def comment_params
            params.require(:comment).permit(:content, :post_id)
        end
end
