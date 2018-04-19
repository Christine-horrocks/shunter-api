class BaseSerializer

  def to_h
    content
  end

  def content
    raise "You must call content through a specific class, you cannot cal lit through BaseSerializer."
  end

end
