class UsersController < ApplicationController
    before_action :correct_user, only: [:edit, :update, :destroy]
    
    def new 
        @user = User.new
    end
    
    def create
        @user = User.new(user_params)
        if @user.save
            log_in @user
            redirect_to @user
        else
            render 'new'
        end
    end
    
    def show
        @user = User.find(params[:id])
    end
    
    def index
        @users = User.all
    end
    
    def edit
        @user = User.find(params[:id])
    end
    
    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            redirect_to @user
        else
            render 'edit'
        end
    end
    
    def destroy
        @user = User.find(params[:id])
        @user.delete
    end
    
    private
    
        def correct_user
            @user = User.find_by(params[:id])
            redirect_to root_path unless current_user?(@user)
        end
            
    
        def user_params    
            params.require(:user).permit(:name, :email, :park, :picture, :password, :password_confirmation)
        end
end
