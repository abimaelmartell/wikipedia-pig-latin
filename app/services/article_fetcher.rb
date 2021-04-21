class ArticleFetcher
  def self.fetch_and_create_article(article_id)
    service = WikipediaApi.new
    result = service.fetch_article(article_id)

    title = result["parse"]["title"]
    content = result["parse"]["text"]

    Article.create!(
      title: title,
      content: content,
      wikipedia_id: article_id,
    )
  end
end
