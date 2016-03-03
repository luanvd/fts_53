class SubjectNotificationService
  def initialize subject
    @users = User.all
    @subject = subject
  end

  def mail_to_user_when_create
    @users.each do |user|
      SubjectNotifier.send_new_subject_email(user, @subject).deliver_now
    end
  end
end
