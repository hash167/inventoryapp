class UsersController < ApplicationController
	before_action :set_user, only: [:show, :edit, :create,:update, :destroy]
	def index
		@user = User.all
	end
	def new
		@user = User.new
	end
	def show
	end
	def edit

	end
	def create
		if @user = User.create(user_params)
			flash[:success] = "User created"
			redirect_to users_path
		else
			flash[:alert] = "User not created"
			redirect_to :new
		end
	end
	def update
		if @user.update(user_params)
			flash[:success] = "User information updated"
			redirect_to user_path(@user)
		else
			flash[:alert] = "Something went wrong while creating user"
			redirect_to :edit
		end
	end
	def detroy
		if @user.destroy
			redirect_to users_path
		else
			render :edit
		end
	end

	private
	def set_user
		@user = User.find(params[:id])
	end
	def user_params
		params.require(:user).permit(:name, :email,:company,:location)
	end
end
