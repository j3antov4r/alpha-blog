class SessionsController < ApplicationController

	def new

	end

	def create
		mySess = params[:session]
		user = User.find_by( email: mySess[:email].downcase )
    if user && user.authenticate( mySess[:password])
    	session[:user_id] = user.id
    	flash[:success] = "You have successfully logged in"
    	redirect_to user_path( user )
    else
    	flash.now[:danger] = "There was something wrong with your login information"
    	render 'new'
    end	
	end  


	def destroy
		session[:user_id] = nil
		flash[:success] = "You have logged out"
		redirect_to root_path
	end

end