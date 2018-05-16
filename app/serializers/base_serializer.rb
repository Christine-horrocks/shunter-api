class BaseSerializer

  def to_h
    content
  end

  def to_yaml
    to_h.to_yaml
  end

  def t(*args)
    I18n.t(*args)
  end

  # def text_with_link(text_dictionary_key, link_text_dictionary_key, link)
  #   t(text_dictionary_key, link: ActionController::Base.helpers.link_to(I18n.t(link_text_dictionary_key), link).html_safe).html_safe
  # end

  def link_to(body, url, html_options = {})
    ActionController::Base.helpers.link_to(body, url, html_options).html_safe
  end

  def content
    raise "You must call content through a specific class, you cannot cal lit through BaseSerializer."
  end

end
