class SessionsController < ApplicationController
  def new
  end

  def create
     # authenticate the user
     @user = User.find_by({ "email" => params["email"] })
     if @user
       if BCrypt::Password.new(@user["password"]) == params["password"]
         session["user_id"] = @user["id"]
         flash["notice"] = "Welcome, #{@user["first_name"]}."
         redirect_to "/places"
       else
         flash["notice"] = "Incorrect email/password combination."
         redirect_to "/login"
       end
     else
       flash["notice"] = "Incorrect email/password combination."
       redirect_to "/login"
     end
  end

  def destroy
    flash["notice"] = "You are now logged out."
    session["user_id"] = nil
    redirect_to "/login"
  end
end
  