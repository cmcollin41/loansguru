class LoanApplicationsController < ApplicationController
  
  def new
    @loan_application = LoanApplication.new
  end

  def create
    loan_application = LoanApplication.new(application_params)
  end
  
  private    

  def application_params
    params.reuire(:loan_application).permit(:amount, :zipcode, :first_name, :last_name, :email)
  end  
end
