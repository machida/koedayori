class ApplicationController < ActionController::Base
  # 高齢の利用者が古い端末・ブラウザを使っている可能性があるため、意図的に有効化していない
  # allow_browser versions: :modern

  # Changes to the importmap will invalidate the etag for HTML responses
  stale_when_importmap_changes

  def current_family
    @current_family||=Family.find_by(id: session[:family_id])
  end
  helper_method :current_family
end
