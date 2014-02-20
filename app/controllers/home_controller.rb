# HomeController Class
class HomeController < ApplicationController
  def index
    @contact = Contact.new
  end

  def notify
    @contact = Contact.new(params.permit(:name, :email, :message))
    if @contact.valid? && ContactMailer.notify(@contact).deliver
      flash.now[:delivered] = 'Message was succesfully sent!'
    end
    render :index
  end
end
