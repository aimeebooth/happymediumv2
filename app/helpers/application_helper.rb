module ApplicationHelper

  def year(date)
    date.strftime '%Y'
  end

  def format_date(date)
    date.in_time_zone("Eastern Time (US & Canada)").strftime '%b %d, %Y'
  end
  
end
