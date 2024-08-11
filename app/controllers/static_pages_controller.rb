class StaticPagesController < ApplicationController
  def index
    @posts = Blog.all
    @skills = Skill.all
  end

  def about
    @skills = Skill.all
  end

  def contact
  end

  def tech_news
    # @tweets = SocialTool.twitter_search
  end
  
  def privacy
  end
end
