class BlogsController < ApplicationController
  def index
    #@blogs = Blog.all(:order => "created_at DESC")
    if logged_in?
      @blogs = Blog.paginate :all, :page => params[:page], :order => "created_at DESC", :per_page => 5
      @shoutboxes = Shoutbox.all(:order => "created_at DESC")
    else
      @blogs = Blog.paginate :all, :page => params[:page], :order => "created_at DESC", :per_page => 5, :conditions => {:members_only => false}
    end
  end
  
  def show
    @blog = Blog.find(params[:id])
  end
  
  def new
    @blog = Blog.new
    @blog.user = current_user
  end
  
  def create
    @blog = Blog.new(params[:blog])
    if @blog.save
      flash[:notice] = "Successfully created blog."
      redirect_to blogs_url
    else
      render :action => 'new'
    end
  end
  
  def edit
    @blog = Blog.find(params[:id])
  end
  
  def update
    @blog = Blog.find(params[:id])
    if @blog.update_attributes(params[:blog])
      flash[:notice] = "Successfully updated blog."
      redirect_to blogs_url
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    flash[:notice] = "Successfully destroyed blog."
    redirect_to blogs_url
  end
end
