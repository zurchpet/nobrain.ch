class PrivateMessagesController < ApplicationController
  def index
    @private_messages = PrivateMessage.all(:conditions => {:to_id => current_user}, :order => "created_at DESC")
  end

  def sent
    @private_messages = PrivateMessage.all(:conditions => {:from_id => current_user}, :order => "created_at DESC")
    render :action => "index"
  end
  
  def show
    @private_message = PrivateMessage.find(params[:id])
    unless(current_user.id == @private_message.to_id || current_user.id == @private_message.from_id)
      redirect_to private_messages_url
    end
    @private_message.new = false
    @private_message.save!
  end
  
  def new
    @private_message = PrivateMessage.new
  end

  def reply
    @replied_message = PrivateMessage.find(params[:id])
    @private_message = PrivateMessage.new
    @private_message.to_id = @replied_message.from_id
    @private_message.subject = "Re: #{@replied_message.subject}"
    header = "#{User.find(@replied_message.from_id).username} schrieb am #{@replied_message.created_at.strftime("%d.%m.%Y um %H:%M")}"
    header += "\n----------\n"
    @private_message.content = header + @replied_message.content
  end
  
  def create
    @private_message = PrivateMessage.new(params[:private_message])
    if params[:reply_id]
        @replied_message = PrivateMessage.find(params[:reply_id])
        @replied_message.replyed_with_id = @private_message
    end
    @private_message.from = current_user
    @private_message.new = true
    if @private_message.save
      flash[:notice] = "Private Nachicht verschickt."
      redirect_to private_messages_url
    else
      render :action => 'new'
    end
  end
  
  def edit
    @private_message = PrivateMessage.find(params[:id])
  end
  
  def update
    @private_message = PrivateMessage.find(params[:id])
    if @private_message.update_attributes(params[:private_message])
      flash[:notice] = "Successfully updated private message."
      redirect_to @private_message
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @private_message = PrivateMessage.find(params[:id])
    @private_message.destroy
    flash[:notice] = "Successfully destroyed private message."
    redirect_to private_messages_url
  end
end
