module ApplicationHelper
  def flash_class(type)
    case type
    when :alert.to_s
      "alert-danger"
    when :notice.to_s
      "alert-success"
    else
      ""
    end
  end
end
