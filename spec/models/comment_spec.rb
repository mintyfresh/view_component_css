# frozen_string_literal: true

# == Schema Information
#
# Table name: comments
#
#  id               :integer          not null, primary key
#  author_id        :integer          not null
#  commentable_type :string           not null
#  commentable_id   :integer          not null
#  message          :text             not null
#  likes_count      :integer          default(0), not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_comments_on_author_id    (author_id)
#  index_comments_on_commentable  (commentable_type,commentable_id)
#
# Foreign Keys
#
#  author_id  (author_id => users.id)
#
require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject(:comment) { build(:comment) }

  it 'has a valid factory' do
    expect(comment).to be_valid
  end

  it 'is invalid without an author' do
    comment.author = nil
    expect(comment).to be_invalid
  end

  it 'is invalid without a commentable object' do
    comment.commentable = nil
    expect(comment).to be_invalid
  end

  it 'is invalid without a message' do
    comment.message = nil
    expect(comment).to be_invalid
  end

  it 'is invalid when the message is shorter than 5 characters' do
    comment.message = 'a' * 4
    expect(comment).to be_invalid
  end

  it 'is invalid when the message is longer than 1000 characters' do
    comment.message = 'a' * 1001
    expect(comment).to be_invalid
  end

  it 'is invalid when the message consists of only whitespace' do
    comment.message = ' ' * 10
    expect(comment).to be_invalid
  end
end
