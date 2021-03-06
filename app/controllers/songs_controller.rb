class SongsController < ApplicationController

  def index
    @release=Song.new
    @songs=current_user.songs.order("song_name")
    #@random = Song.order("RANDOM()").first
    @random = current_user.songs.pluck(:id).sample
    @artist=current_user.songs.select(:artist).distinct
  end

  def show
    @song=Song.find(params[:id])
  end

  def artist
    @songs=current_user.songs.order("artist")
    @artist=""
  end

  def create
    @release=Song.new(song_params)
    @release.user_id=current_user.id
    if  params[:song][:select_artist] == "1"
    elsif params[:song][:select_artist] == "2"
      @release.artist = params[:song][:artist77]
    end
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

  def search1
    @song_search = current_user.songs.search1(params[:keyword])
    @keyword = params[:keyword]
    #indexビュー用
    @release=Song.new
    @songs=current_user.songs.order("song_name")
    @random = current_user.songs.pluck(:id).sample
    @artist=current_user.songs.select(:artist).distinct
    render "index"
  end

  def search2
    @artist_search = current_user.songs.order("artist").search2(params[:keyword])
    @keyword = params[:keyword]
    #artistビュー用
    @songs=current_user.songs.order("artist")
    @artist=""
    @search_artist=""
    render "artist"
  end

  private
  def song_params
    params.require(:song).permit(:song_name, :artist, :memo, :key)
  end
end
