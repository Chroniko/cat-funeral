module HomeHelper
  def get_dates
    start_date = get_week_parameter * 7
    dates = ((start_date+0)..(start_date+6)).map do |i|
      i.days.from_now
    end
  end

  def find_events(day)
    daily_events = Event.where("DATE(starts_at) = ?", day.to_date)
  end

  def get_week_parameter
    if params[:week].nil?
      week_par = 0
    else
      week_par = params[:week].to_i
    end
  end
end
