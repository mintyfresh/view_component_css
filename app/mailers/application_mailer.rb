# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  helper ApplicationHelper

  default from: 'from@example.com'
  layout 'mailer'

  # @return [Array<String>]
  def singleton_stylesheets
    @singleton_stylesheets ||= Set.new
  end
end
