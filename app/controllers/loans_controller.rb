  class LoansController < ApplicationController
    
    def new
      @loan_application = Loan.new
    end

    def create
      @loan_application = Loan.new
      @loan_application.UserID = "123"
      @loan_application.Password = "123"
      @loan_application.CampaignCode = 123
      @loan_application.CampaignID = 123
      @loan_application.ApplicationURL = "yourquid.com"
      @loan_application.Sub1 = "123"
      @loan_application.ApplicationIP = request.remote_ip
      @loan_application.save(validate: false)
      redirect_to loan_step_path(@loan_application.id, Loan.form_steps.first)  
    end

    private  

    def application_params
      params.require(:loan).permit(:Zip, :Address1, :City, :State, :RequestedAmount, :ApplicationIP, :FirstName,
      :LastName, :Email, :created_at, :updated_at, :CampaignID, :CampaignCode, :Sub1, :LeadID, :SSN, :EmployerName, :RoutingNumber,
      :AccountNumber, :DOB, :PayDay1, :PayDay2, :WorkPhone, :PayFrequency, :IncomeType, :AccountType, :DirectDeposit, :IsMilitary,
      :UserID, :Password, :ApplicationURL, :HomePhone, :MonthlyIncome)
    end  
  end


