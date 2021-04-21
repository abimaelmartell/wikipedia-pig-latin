module PigLatinable
  extend ActiveSupport::Concern

  def itletay
    PigLatinTranslator.translate_text(title)
  end

  def ontentcay
    PigLatinTranslator.translate_html(content)
  end
end
