module ApplicationHelper
  def full_title page_title = ""
    base_title = t "app_name"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  def status_of object
    if object.waiting?
      "<span class='label label-primary'>#{t("question.waiting")}</span>"
    else
      "<span class='label label-success'>#{t("question.approved")}</span>"
    end
  end
end
