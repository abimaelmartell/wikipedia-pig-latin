require 'rails_helper'

RSpec.describe "Articles", type: :request do
  describe "GET /wiki/:article_id" do
    let (:article_id) { "Pig_Latin" }

    let (:stub_response) {{
      "parse" => {
        "title" => "Pig Latin",
        "text" => "test"
      }
    }}

    it "returns http success" do
      expect_any_instance_of(WikipediaApi).to receive(:fetch_article).and_return(stub_response)

      get "/wiki/#{article_id}"

      expect(response).to have_http_status(:success)
    end
  end
end
