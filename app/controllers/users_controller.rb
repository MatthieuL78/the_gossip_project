class UsersController < ApplicationController

  def profile
  	unless user_signed_in?
  		redirect_to root_path
  	end
  end
  
end
