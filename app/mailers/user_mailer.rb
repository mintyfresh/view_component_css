# frozen_string_literal: true

class UserMailer < ApplicationMailer
  # @param user [User]
  # @param comment [Comment]
  def new_comment(user:, comment:)
    @user    = user
    @comment = comment

    bootstrap_mail to: user.email
  end
end
