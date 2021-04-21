require 'rails_helper'

RSpec.describe Article, type: :model do
  let (:article) {
    Article.new(
      title: 'Dog',
      content: 'Doc Content'
    )
  }

  describe '#itletay' do
    it 'should return title into pig latin' do
      expect(article.itletay).to eq("Ogday")
    end
  end

  describe '#ontentcay' do
    it 'should return content into pig latin' do
      expect(article.ontentcay).to eq("Ocday Ontentcay")
    end
  end
end
