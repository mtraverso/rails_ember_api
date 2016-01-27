class Api::V1::ContactsController < ApplicationController
  def index
    render json: Contact.all
  end
  
  def show
     if Contact.find(params[:id])
      render json: Contact.find(params[:id])
    else
      render json: '{"result":"Error"}'
    end
  end
  
  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      render json: '{"result":"OK"}'
    else
      render json: '{"result":"Error"}'
    end
  end
  
  def update
    @contact = Contact.find(params[:id])
    if @contact.update(contact_params)
      render json: '{"result":"OK"}'
    else
      render json: '{"result":"Error"}'
    end
    
  end
  
  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    render json: '{"result":"OK"}'
  end
  
  def contact_params
    params.permit(:first_name, :last_name, :email, :phone)
  end
  
end
