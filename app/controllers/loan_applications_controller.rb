class LoanApplicationsController < ApplicationController
  
  def new
    @loan_application = LoanApplication.new
  end

  def create
    loan_application = LoanApplication.new(application_params)
    loan_application.application_ip = get_ip_address
    if loan_application.save
      redirect_to root_path
    else
      render :new
    end    
  end
  
  private  

  def get_ip_address
    request.remote_ip
  end  

  def application_params
    params.require(:loan_application).permit(:amount, :zip_code, :phone_number, :application_ip, :first_name, :last_name, :email_address)
  end  
end
