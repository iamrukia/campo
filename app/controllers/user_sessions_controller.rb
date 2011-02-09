class UserSessionsController < ApplicationController
  def new
  end

  def create
    @user = User.authenticate params[:user][:login], params[:user][:password]
    if @user
      flash[:success] = "Success login"
      login_as @user
      redirect_to root_url
    else
      flash[:error] = "Wrong login name or password"
      redirect_to login_url
    end
  end

  def destroy
    logout
    flash[:success] = "Success Logout"
    redirect_to root_url
  end
end