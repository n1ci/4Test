class SongsController < ApplicationController
    def index
        @albums = Album.order(:band, :title)
        @no_songs = Song.count
      end
    
      def new
        @albums = Album.select("id, band || ': ' || title as album_name").order(:band, :title)
      end
    
      def create
        @song = Song.new(song_params)
        if @song.save
          redirect_to action: "index"
        else
          @albums = Album.select("id, band || ': ' || title as album_name").order(:band, :title)
          render action: "new"
        end
      end
    
      def edit
        @song = Song.find(params[:id])
        @albums = Album.select("id, band || ': ' || title as album_name").order(:band, :title)
      end
    
      def update
        @song = Song.find(params[:id])
        if @song.update_attributes(song_params)
          redirect_to action: "index"
        else
          @albums = Album.select("id, band || ': ' || title as album_name").order(:band, :title)
          render action: "edit"
        end
      end
    
      def destroy
        Song.find(params[:id]).destroy
        redirect_to action: "index"
      end
    
      def song_params
        params.require(:song).permit(:album_id, :title, :duration)
      end
    end