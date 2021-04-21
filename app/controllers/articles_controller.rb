class ArticlesController < ApplicationController
  before_action :set_article

  def show; end

private

  def article_id
    params.require(:article_id)
  end

  def find_article
    Article.find_by_wikipedia_id(article_id)
  end

  def fetch_and_create_article
    ArticleFetcher.fetch_and_create_article(article_id)
  rescue WikipediaApi::Error => e
    raise ActionController::RoutingError.new(e.message)
  end

  def set_article
    @article ||= find_article || fetch_and_create_article
  end
end
