class Families::PostsController < Families::ApplicationController
  def index
    @speaker = current_family.speakers.find(params[:speaker_id])
    @posts = @speaker.posts
  end
end
