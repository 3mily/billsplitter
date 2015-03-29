class Event < ActiveRecord::Base
  belongs_to :user

  def format_datetime(date,time)
    year = date["year"]
    month = date["month"]
    day = date["day"]
    hour = time["hour"]
    minute = time["minute"]
    datetime =  year + "-" + month + "-" + day + " " + hour + ":" + minute
  end

    
end
