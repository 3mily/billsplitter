class Event < ActiveRecord::Base
  belongs_to :user
  has_many :attendees
  def format_datetime(date,time)
    year = date["year"]
    month = date["month"]
    day = date["day"]
    hour = time["hour"]
    minute = time["minute"]
    datetime =  year + "-" + month + "-" + day + " " + hour + ":" + minute
  end


  def has_paid?(event_id)
    paid = 0
    attendees.each do |attendee|
      if attendee.pre_auth?
        paid += 1
      end
    end
    paid
  end

    
end
