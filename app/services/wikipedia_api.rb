require 'net/http'

class WikipediaApi
  BASE_URL = "https://en.wikipedia.org/w/api.php?".freeze

  DEFAULT_PARAMS = {
    format: "json"
  }

  def fetch_article(article_id)
    params = {
      action: "parse",
      page: article_id,
      prop: "text",
      formatversion: 2, # returns content in html
    }

    do_request(params)
  end

private

  def build_url(params = {})
    "#{BASE_URL}#{params.to_query}"
  end

  def do_request(params)
    url = build_url(params.merge(DEFAULT_PARAMS))

    response = Net::HTTP.get(URI.parse(url))

    JSON.parse(response)
  end
end
