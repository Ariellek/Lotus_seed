class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def index
    @events = Event.all
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect to events_url
    else
      render 'new'
    end
  end

  private
  def event_params
    params.require(:event).permit(:starts_at, :ends_at, :title, :description)
  end
end
