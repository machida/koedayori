class Families::SessionsController < Families::ApplicationController
  skip_before_action :authenticate_family!

  def new
  end

  def create
    family = Family.find_by(aikotoba: params[:family][:aikotoba])

    if family&.authenticate(params[:family][:password])
      session[:family_id] = family.id
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    session.delete(:family_id)
    redirect_to root_path
  end
end
