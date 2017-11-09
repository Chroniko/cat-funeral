class EventsController < ApplicationController
  before_action :redirect_away_from_categories_without_events, only: :index

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to root_path
    else
      redirect_back(fallback_location: new_event_path)
      #render :new
    end
  end

  private
    
    def event_params
      params.require(:event).permit(:starts_at)
    end
end