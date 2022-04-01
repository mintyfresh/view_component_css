# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserMailer, type: :mailer do
  describe 'new_comment' do
    subject(:mail) { described_class.new_comment(user: user, comment: comment) }

    let(:user) { create(:user) }
    let(:author) { comment.author }
    let(:comment) { create(:comment, commentable: user) }

    it 'renders the headers' do
      expect(mail).to have_attributes(
        subject: 'New comment',
        to:      [user.email],
        from:    ['from@example.com']
      )
    end

    it 'renders the body' do
      expect(mail.body.encoded).to match("#{author.display_name} commented on your profile")
    end
  end
end
