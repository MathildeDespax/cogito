class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.new_quizz.subject
  #
  def new_quizz(student, quizz)
    @quizz = quizz
    @student = student  # Instance variable => available in view

    mail(to: @student.email, subject: 'You received a new Quizz')
    # This will render a view in `app/views/user_mailer`!
  end
end
