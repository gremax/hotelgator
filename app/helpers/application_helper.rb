module ApplicationHelper
  def boolean_human(boolean)
    if boolean
      "Yes"
    else
      "No"
    end
  end
end
