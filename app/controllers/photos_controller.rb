class PhotosController < ApplicationController
  def index
    params[:page] ||= 1
    params[:per_page] ||= 100
    
    @photos = Photo.order(:id => :desc).limit(params[:per_page]).offset(params[:per_page].to_i * (params[:page].to_i - 1))
    
    respond_to do |format|
      format.html
      format.json { render :json => { :photos => @photos, :meta => { :total => Photo.count } } }
    end
  end

  def show
    @photo = Photo.find(params[:id])
    
    respond_to do |format|
      format.html
      format.json { render :json => { :photo => @photo } }
    end
  end
  
  def image
    @photo = Photo.find(params[:photo_id])
    send_file(@photo.filename)
  end

  def thumbnail_image
    @photo = Photo.find(params[:photo_id])
    send_file(@photo.thumbnail_filename)
  end
end
