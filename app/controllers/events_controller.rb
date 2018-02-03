class EventsController < ApplicationController
  before_action :set_event, only: [:show, :update, :destroy]

  # GET /events
  def index
    @events = Event.all
    json_response(@events)
  end

  #POST /todos
  def create
    @event = Event.create!(event_params)
    json_response(@event, :created)
  end

  def update
    @event.update(event_params)
    head :no_content
  end

  def show
    json_response(@event)
  end

  def destroy
    @event.destroy
    head :no_content
  end


  private

  def event_params
    params.permit(:name, :date_start, :date_end, :time_start, :time_end, :url, :source, :source_id, :image_url, :event_address, :event_longitude, :event_lattitude, :golden?)
  end

  def set_event
    @event = Event.find(params[:id])
  end
end
