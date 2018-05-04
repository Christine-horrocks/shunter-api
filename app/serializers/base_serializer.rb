class BaseSerializer

  def to_h
    content
  end

  def t(dictionary_key)
    I18n.t(dictionary_key)
  end

  def text_with_link(text_dictionary_key, link_text_dictionary_key, link)
    I18n.t(text_dictionary_key, link: ActionController::Base.helpers.link_to(I18n.t(link_text_dictionary_key), link).html_safe).html_safe
  end

  def whole_text_link(link_text_dictionary_key, link)
    ActionController::Base.helpers.link_to(I18n.t(link_text_dictionary_key), link).html_safe
  end

  def content
    raise "You must call content through a specific class, you cannot cal lit through BaseSerializer."
  end

end
