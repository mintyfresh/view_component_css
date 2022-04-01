# frozen_string_literal: true

# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/new_comment
  def new_comment
    user    = User.last(2)[0] || FactoryBot.create(:user, :with_avatar)
    author  = User.last(2)[1] || FactoryBot.create(:user, :with_avatar)
    comment = Comment.where(author: author, commentable: user).last ||
              FactoryBot.create(:comment, author: author, commentable: user)

    UserMailer.new_comment(user: user, comment: comment)
  end
end
