class SessionsController < ApplicationController

	def new
	end

	def create
		@user = User.find_by(email: params[:email])
		if @user && @user.authenticate(params[:password])
			session[:user_id] = @user.id
			flash[:success] = 'Welcome back!'
			redirect_to '/posts'
		else
			redirect_to '/login'
			flash[:warning] = "Invalid email or password. Please try again."	
		end
	end

	def destroy
		session[:user_id] = nil
		flash[:success] = "Logged out! Hope to see you soon."
		redirect_to welcome_index_path
	end
end
