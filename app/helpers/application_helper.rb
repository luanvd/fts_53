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
    elsif object.class == QuestionAnswer
      if object.correct?
        "<span class='label label-success'>#{t("question.correct")}</span>"
      else
        "<span class='label label-danger'>#{t("question.incorrect")}</span>"
      end
    elsif object.class == Lesson
      case object.status
      when "start"
        "<span class='label label-primary'>#{t("lesson.start")}</span>"
      when "testing"
        "<span class='label label-warning'>#{t("lesson.testing")}</span>"
      when "unchecked"
        "<span class='label label-info'>#{t("lesson.unchecked")}</span>"
      else
        "<span class='label label-success'>#{t("lesson.checked")}</span>"
      end
    end
  end
end
