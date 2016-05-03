class LoanApplicationsController < ApplicationController
  
  def new
    @loan_application = LoanApplication.new
  end

  def create
    loan_application = LoanApplication.new(application_params)
  end
  
  private  

  def set_ip_address_and_host_url(application)
    ip = request.remote_ip
    url = requst.original_url
    application.application_ip = ip
    application.application_url = url
  end  

  def application_params
    params.reuire(:loan_application).permit(:amount, :zipcode, :application_id, :application_url :first_name, :last_name, :email)
  end  
end
