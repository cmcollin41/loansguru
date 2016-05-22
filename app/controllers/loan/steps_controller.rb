class Loan::StepsController < ApplicationController
    include Wicked::Wizard
    steps *Loan.form_steps

    def show
      @loan_application = Loan.find(params[:loan_id])
      render_wizard
    end

    def update
      @loan_application = Loan.find(params[:loan_id])
      @loan_application.update(loan_params(step))
      render_wizard @loan_application
    end

    private

    def finish_wizard_path
      '/thankyou'
    end

    def loan_params(step)
      permitted_attributes = case step
        when "add_loan"
          [:FirstName, :LastName, :Zip, :Email, :RequestedAmount]
        when "add_applicant"
          [:Address1, :City, :State, :SSN, :HomePhone, :DOB, :IsMilitary]
        when "add_employer"
          [:EmployerName, :WorkPhone, :PayFrequency, :PayDay1, :PayDay2, :MonthlyIncome, :IncomeType]
        when "add_bank"
          [:AccountType, :RoutingNumber, :AccountNumber, :HomePhone, :DirectDeposit]
        end

      params.require(:loan).permit(permitted_attributes).merge(form_step: step)
    end
end

