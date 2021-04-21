class ArticlesController < ApplicationController
  def show
    service = WikipediaApi.new
    result = service.fetch_article(article_id)

    @title = result["parse"]["title"]
    @content = result["parse"]["text"]
  end

private
  def article_id
    params.require(:article_id)
  end
end
