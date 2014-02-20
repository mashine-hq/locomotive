# HomeController Class
class HomeController < ApplicationController
  def index
    @contact = Contact.new
  end

  def notify
    @contact = Contact.new(params[:contact].permit(:name, :email, :message))
    if @contact.valid? && ContactMailer.notify(@contact).deliver
      flash.now[:delivered] = 'Message was succesfully sent!'
    end
    respond_to do |format|
      format.html { render index }
      format.js {}
    end
  end
end
