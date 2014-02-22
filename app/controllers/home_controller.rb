class HomeController < ApplicationController

  def index
    @contact = Contact.new
  end

  def notify
    @delivered = false

    @contact = Contact.new(params[:contact].permit(:name, :email, :phone, :message))

    if @contact.deliver
      flash.now[:delivered] = 'Message was succesfully sent!'
      @delivered = true
    end

    respond_to do |format|
      format.html { render index }
      format.js {}
    end
  end

end
