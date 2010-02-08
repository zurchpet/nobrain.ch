class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.authenticate(params[:login], params[:password])
    if user
      session[:user_id] = user.id
      flash[:notice] = "Hallo #{user.username}. Du hast dich erfolgreich angemeldet."
      redirect_to_target_or_default(root_url)
    else
      flash.now[:error] = "Ungültiger Benutzername oder falsches Passwort."
      render :action => 'new'
    end
  end
  
  def destroy
    session[:user_id] = nil
    flash[:notice] = "Du wurdest abgemeldet."
    redirect_to root_url
  end
end
