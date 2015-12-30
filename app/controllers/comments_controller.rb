class CommentsController < ApplicationController
    
    def create
        @comment = Comment.new(comment_params)
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
    
        def comment_params
            params.require(:comment).permit(:content, :post_id)
        end
end
