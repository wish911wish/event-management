module ApplicationHelper
  def attend?(event)
    status = AttendStatus.where('user_id = ?', current_user.id).where('event_id = ?', event.id)[0].attend
    if status == 1
      content_tag :div, "参加", class: "attendance-status status_participation"
    elsif status == 2
      content_tag :div, "不参加", class: "attendance-status status_absence"
    end
  end

  def lList_image(object)
    content_tag(:span, "", class: "object_image") do
      image_tag object.avatar
    end
  end

  def lList_name(object)
    content_tag(:span, "", class: "object_name") do
      object.name
    end
  end

end
