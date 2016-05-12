class PagesController < ApplicationController
  def index
    @loan_application = LoanApplication.new
  end
end
