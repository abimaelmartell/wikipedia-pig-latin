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

    context "With article not created" do
      it "should call api and create entry" do
        expect_any_instance_of(WikipediaApi).to receive(:fetch_article).and_return(stub_response)

        expect {
          get "/wiki/#{article_id}"
        }.to change { Article.count }

        expect(response).to have_http_status(:success)
      end
    end

    context "With article created" do
      before do
        Article.create!(
          title: "Pig Latin",
          content: "test",
          wikipedia_id: article_id
        )
      end

      it "shouldnt call api" do
        expect_any_instance_of(WikipediaApi).to_not receive(:fetch_article)
        get "/wiki/#{article_id}"
        expect(response).to have_http_status(:success)
      end
    end
  end
end
