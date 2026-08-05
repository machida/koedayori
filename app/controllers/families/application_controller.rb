class Families::ApplicationController < ApplicationController
  before_action :authenticate_family!

  private

  def authenticate_family!
    redirect_to new_families_session_path, alert: "ログインしてください" unless current_family
  end

  def current_family
    @current_family ||= Family.find_by(id: session[:family_id])
  end
  helper_method :current_family
end