module HomeHelper
  def get_dates
    start_date = week_parameter * 7
    ((start_date+0)..(start_date+6)).map do |i|
      i.days.from_now
    end
  end

  def week_parameter
    params[:week].to_i
  end
end
