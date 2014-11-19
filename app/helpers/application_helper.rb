module ApplicationHelper
  def full_title(page_title)
    base_title = "Hotelgator"
    if page_title.empty?
      "#{base_title}"
    else
      "#{base_title} · #{page_title}"
    end
  end
  
  def boolean_human(boolean)
    if boolean
      "Yes"
    else
      "No"
    end
  end
end
