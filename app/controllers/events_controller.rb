class EventsController < ApplicationController
  before_action :redirect_away_from_categories_without_events, only: :index

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to root_path
    else
      render "home/reservation"
    end
  end

  private
    
    def event_params
      params.require(:event).permit(:starts_at)
    end
end