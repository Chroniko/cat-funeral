class HomeController < ApplicationController
  include HomeHelper

  def index
    @dates = Date.today
    @week = get_week_parameter
    @weather = Weather.today
  end

  def reservation
    @event = Event.new
  end
end
