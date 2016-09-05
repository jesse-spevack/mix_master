class SongsController < ApplicationController
  def new
    @artist = Artist.find(params[:artist_id])
    @song = @artist.songs.new
  end

  def create
    @artist = Artist.find(params[:artist_id])
    @song = @artist.songs.new(song_params)
    if @song.save
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  def show
    @song = Song.find(params[:id])
    @artist = @song.artist
  end

  def edit
    @song = Song.find(params[:id])
    @artist = @song.artist
  end

  def update
    @song = Song.find(params[:id])
    @song.update(song_params)
    # @artist = @song.artist

    redirect_to song_path(@song)
  end

  def index
    @songs = Song.order(:title)
  end

  def destroy
    @song = Song.find(params[:id])
    @artist = @song.artist
    @song.destroy

    redirect_to artist_songs_path(@artist)
  end

  private

  def song_params
    params.require(:song).permit(:title)
  end
end