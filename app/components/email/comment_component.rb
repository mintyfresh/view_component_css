# frozen_string_literal: true

module Email
  class CommentComponent < ApplicationComponent
    # @param comment [Comment]
    def initialize(comment:)
      @comment = comment
    end
  end
end
