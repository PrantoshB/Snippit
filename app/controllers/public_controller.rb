class PublicController < ApplicationController
  def homepage
    @snippets = CodeSnippet.most_popular
    @contributors = User.top_contributors
  end
end
