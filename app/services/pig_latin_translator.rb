class PigLatinTranslator
  WORD_REGEX = /\w+/.freeze

  def self.translate_text(text)
    text.split.map{ |x| translate_word(x) }.join(" ")
  end

  def self.translate_html(html)
    doc = Nokogiri::HTML::DocumentFragment.parse(html)

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

  def self.translate_word(word)
    PigLatin.translate(word)
  end
end
