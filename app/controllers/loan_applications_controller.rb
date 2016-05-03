class LoanApplicationsController < ApplicationController
  
  def new
    @loan_application = LoanApplication.new
  end

  def create
    loan_application = LoanApplication.new(application_params)
    loan_application.application_ip, loan_application.application_url = get_ip_address_and_host_url
    if loan_application.save
      redirect_to root_path
    else
      render :new
    end    
  end
  
  private  

  def get_ip_address_and_host_url
    ip = request.remote_ip
    url = request.original_url
    [ip, url]  
  end  

  def application_params
    params.require(:loan_application).permit(:amount, :zip_code, :phone_number, :application_ip, :application_url, :first_name, :last_name, :email_address)
  end  
end
