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
    if object.class == Question
      if object.waiting?
        "<span class='label label-primary'>#{t("question.waiting")}</span>"
      elsif object.approved?
        "<span class='label label-success'>#{t("question.approved")}</span>"
      end
    else
      if object.correct?
        "<span class='label label-success'>#{t("question.correct")}</span>"
      else
        "<span class='label label-danger'>#{t("question.incorrect")}</span>"
      end
    end
  end
end
