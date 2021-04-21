class ArticlesController < ApplicationController
  def show
    service = WikipediaApi.new
    result = service.fetch_article(article_id)

    title = result["parse"]["title"]
    content = result["parse"]["text"]

    translator = ArticleTranslator.new(title, content)

    @title = translator.translated_title
    @content = translator.translated_content
  end

private

  def article_id
    params.require(:article_id)
  end
end
