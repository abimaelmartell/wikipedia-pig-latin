class ArticleTranslator
  attr_reader :title, :content

  WORD_REGEX = /\w+/

  def initialize(title, content)
    @title = title
    @content = content
  end

  def translated_title
    title.split(' ').map{ |x| translate_word(x) }.join(" ")
  end

  def translated_content
    doc = Nokogiri::HTML::DocumentFragment.parse(content)

    doc.traverse do |x|
      if x.text?
        x.content = x
          .content
          .gsub(WORD_REGEX) { |word| translate_word(word) }
      end
    end

    doc.to_html
  end

private

  def translate_word(word)
    PigLatin.translate(word)
  end
end
