class PagesController < ApplicationController
  def index
    @loan_application = LoanApplication.new
  end

  def thankyou
  end
  
end
