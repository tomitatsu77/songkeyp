class SongsController < ApplicationController

  def index
    @release=Song.new
    @songs=Song.order("song_name")
    @random = Song.order("RANDOM()").first
  end

  def show
    @song=Song.find(params[:id])
  end

  def create
    @release=Song.new(song_params)
    @release.user_id=current_user.id
    @release.save
    redirect_to songs_path
  end

  def update
    @song = Song.find(params[:id])
    @song.update(song_params)
    flash[:notice] ="更新しました"
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @song = Song.find(params[:id])
    @song.destroy
    redirect_to songs_path
  end

  private
  def song_params
    params.require(:song).permit(:song_name, :artist, :memo, :key)
  end
end
