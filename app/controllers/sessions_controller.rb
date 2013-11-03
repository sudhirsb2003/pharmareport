class SessionsController < ApplicationController

	def new
	end

	def create
		user=TabUser.find_by(name: params[:session][:name])
		if user && user.authenticate(params[:session][:password])
			session[:user_id] = user.id
			redirect_to tab_user_url(user) , notice: "Successfully Logged In"
		else
			flash.now[:error] = "Invalid Username/Password"
			redirect_to login_path

		end
	end

	def destroy
		session[:user_id]=nil
		redirect_to login_path , notice: "Logged Out" 
	end

end
