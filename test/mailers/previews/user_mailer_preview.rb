class UserMailerPreview < ActionMailer::Preview
  def new_quizz
    user = User.first
    quizz = Quizz.first
    UserMailer.new_quizz(user, quizz)
  end
end
