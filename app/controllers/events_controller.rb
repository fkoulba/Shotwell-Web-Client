class EventsController < ApplicationController
  def index
    params[:page] ||= 1
    params[:per_page] ||= 100

    @events = Event.order(:id => :desc).limit(params[:per_page]).offset(params[:per_page].to_i * (params[:page].to_i - 1))

    respond_to do |format|
      format.html
      format.json { render :json => { :events => @events, :meta => { :total => Event.count } } }
    end
  end

  def show
    @event = Event.find(params[:id], :include => :photos)

    respond_to do |format|
      format.html
      format.json { render :json => { :event => @event.as_json(:include => :photos) } }
    end
  end
end
