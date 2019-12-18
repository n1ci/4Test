class AlbumsController < ApplicationController
    def index
        @albums = Album.order(:title)
        @albums.each do |a|
          a.duration = 0
          a.no_songs = a.songs.count
          a.songs.each do |s|
            a.duration += s.duration
          end
          a.save
        end
      end
    
      def new
      end
    
      def create
        @album = Album.new(album_params)
        if @album.save
          redirect_to action: "index"
        else
          render action: "new"
        end
      end
    
      def edit
        @album = Album.find(params[:id])
      end
    
      def update
        @album = Album.find(params[:id])
        if @album.update_attributes(album_params)
          redirect_to action: "index"
        else
          render action: "edit"
        end
      end
    
      def show
        position = 0
        @album = Album.find(params[:id])
        @album.songs.each do |s|
          position += 1
          s.position = position
          s.save
        end
    end
    
      def destroy
        Album.find(params[:id]).destroy
        redirect_to action: "index"
      end
    
      def album_params
        params.require(:album).permit(:band, :title, :year)
      end
    end
    