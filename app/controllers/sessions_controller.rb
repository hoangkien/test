class SessionsController < ApplicationController
  def new
  end

  def create
    #kiem tra thong tin user co dung khong
    user = User.find_by_username(params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      #dung redirect toi trang user
      session[:username] = params[:session][:username]
      redirect_to users_path
    else
      flash[:notice] = "Sai thong tin tai khoan hoac mat khau"
      render "new"
    end
  end

  def destroy
  end
end
