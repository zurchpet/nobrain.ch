class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end
  
  def show
    @comment = Comment.find(params[:id])
  end
  
  def new
    @comment = Comment.new
  end
  
  def create
    @comment = Comment.new(params[:comment])
    @comment.blog = Blog.find(params[:blog_id])
    @comment.from_id = current_user.id
    #raise @comment.inspect
    if @comment.save
      flash[:notice] = "Kommentar erstellt."
      redirect_to @comment.blog
    else
      render :action => 'new'
    end
  end
  
  def edit
    @comment = Comment.find(params[:id])
  end
  
  def update
    @comment = Comment.find(params[:id])
    if @comment.update_attributes(params[:comment])
      flash[:notice] = "Kommentar aktualisiert."
      redirect_to @comment
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @comment = Comment.find(params[:id])
    blog = @comment.blog
    @comment.destroy
    flash[:notice] = "Kommentar gelöscht."
    redirect_to blog
  end
end
