require_relative '../rails_helper'

describe BaseSerializer do
  context '#to_h' do
    it 'raises an error if called in BaseSerializer' do

      expect { subject.to_h }.to raise_error("You must call content through a specific class, you cannot cal lit through BaseSerializer.")
    end
  end

  context '#t' do
    it 'wraps the arguments for translation' do
      args = 'text or link'
      expect(subject.t(args)).to eq(I18n.t('text or link'))
    end
  end

  context '#link_to' do
    it 'wraps the arguments to create a text link' do
      body = 'text or link'
      url = '//link'
      html_options = {}
      expect(subject.link_to(body, url, html_options = {})).to eq("<a href=\"//link\">text or link</a>")
    end
  end


end
