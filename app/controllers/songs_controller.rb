class SongsController < ApplicationController
  def index
		@songs = Song.all
	end

	def show
		@song = Song.find(params[:id])
	end

	def new
    @song = Song.new
    @genres = Genre.all
    @artists = Artist.all
	end

	def create
    @song = Song.new(song_params(:name, :genre_id, :artist_id))
    # @song.genre = params[:song][:genre]
    # @song.artist = params[:song][:artist]
	  @song.save
	  redirect_to song_path(@song)
	end

  def edit
    @song = Song.find(params[:id])
    @genres = Genre.all
    @artists = Artist.all
  end
  
  def update
    p params
	  @song = Song.find(params[:id])
	  @song.update(song_params(:name, :genre_id, :artist_id))
	  redirect_to song_path(@song)
	end

	private
 
	def song_params(*args)
		params.require(:song).permit(*args)
	end
end
