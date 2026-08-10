class Families::WithdrawalsController < Families::ApplicationController
  def new
  end

  def create
    current_family.destroy
    session[:family_id] = nil
    redirect_to root_path
  end
end
