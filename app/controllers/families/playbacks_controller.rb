class Families::PlaybacksController < Families::ApplicationController
  def create
    post = current_family.posts.find(params[:post_id])
    post.played_at = Time.current
    if post.save
      head :ok
    else
      head :bad_request
    end
  end
end
