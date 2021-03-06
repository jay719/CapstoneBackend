class UsersController < ApplicationController
    def index 
        @users = User.all

        render json: @users, include: [:friends,:trips] 
    end

    def create
        @user = User.create(
            username: params[:username],
            password: params[:password]
        )  
        render json: {user: @user}
    end
    def show 
        @user = User.find(params[:id])
        render json: @user, include: [:friends,:trips] 
    end
end 
