class SongsController < ApplicationController

  def index
    @release=Song.new
    @songs=Song.order("song_name")
    #@random = Song.order("RANDOM()").first
    @random = Song.pluck(:id).sample
  end

  def show
    @song=Song.find(params[:id])
  end
  
  def artist
    @songs=Song.order("artist")
    @artist=""
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
  
  def search1
    @song_search = Song.search1(params[:keyword])
    @keyword = params[:keyword]
    #indexビュー用
    @release=Song.new
    @songs=Song.order("song_name")
    @random = Song.order("RANDOM()").first
    render "index"
  end
  
  def search2
    @artist_search = Song.search2(params[:keyword])
    @keyword = params[:keyword]
    #artistビュー用
    @songs=Song.order("artist")
    @artist=""
    @search_artist=""
    render "artist"
  end

  private
  def song_params
    params.require(:song).permit(:song_name, :artist, :memo, :key)
  end
end
