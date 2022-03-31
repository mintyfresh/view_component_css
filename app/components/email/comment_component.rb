# frozen_string_literal: true

module Email
  class CommentComponent < ApplicationComponent
    # @param comment [Comment]
    def initialize(comment:)
      @comment = comment
    end

    def extra_css
      @extra_css ||= tag.style(File.read("#{__FILE__.chomp('.rb')}.css"))
    end
  end
end
