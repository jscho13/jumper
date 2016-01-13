class ReviewMailer < ApplicationMailer
  def new_review(review, venue)
    @review = review
    @venue = venue
    @review_poster = User.find(review.user_id)
    @venue_poster = User.find(venue.user_id)

    mail(
      to: @venue_poster.email,
      subject: "There's a new review for #{@venue_poster.username}")
  end
end
