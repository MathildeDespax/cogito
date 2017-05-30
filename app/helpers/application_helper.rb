module ApplicationHelper
  def quizz_photo_url(quizz)
    quizz.photo.try(:path) || "http://unsplash.it/300x400"
  end
end
