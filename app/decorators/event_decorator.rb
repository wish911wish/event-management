class EventDecorator < Draper::Decorator
  delegate_all

  def event_time
    if event.start_time.strftime('%Y%m%d') == event.end_time.strftime('%Y%m%d')
      "#{event.start_time.strftime('%Y/%m/%d')} #{event.start_time.strftime('%H:%M')}~#{event.end_time.strftime('%H:%M')}"
    else
      "#{event.start_time.strftime('%Y/%m/%d')} ~ #{event.end_time.strftime('%Y/%m/%d')}"
    end
  end

  def organiser
    if event.group
      event.group
    else
      User.find(event.user_id)
    end
  end

end
