class ShoutboxesController < ApplicationController
  def index
    @shoutboxes = Shoutbox.all(:order => "created_at DESC")
  end
  
  def show
    @shoutbox = Shoutbox.find(params[:id])
  end
  
  def new
    @shoutbox = Shoutbox.new
  end
  
  def create
    @shoutbox = Shoutbox.new(params[:shoutbox])
    @shoutbox.user = current_user
    if @shoutbox.save
      #flash[:notice] = "Successfully created shoutbox."
      redirect_to root_url
    else
      render :action => 'new'
    end
  end
  
  def edit
    @shoutbox = Shoutbox.find(params[:id])
  end
  
  def update
    @shoutbox = Shoutbox.find(params[:id])
    if @shoutbox.update_attributes(params[:shoutbox])
      flash[:notice] = "Successfully updated shoutbox."
      redirect_to @shoutbox
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @shoutbox = Shoutbox.find(params[:id])
    @shoutbox.destroy
    flash[:notice] = "Successfully destroyed shoutbox."
    redirect_to shoutboxes_url
  end
end
