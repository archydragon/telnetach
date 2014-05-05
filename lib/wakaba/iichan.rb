#!/usr/bin/env ruby -wKU

module Iichan
  include Generic

  def root
    'http://iichan.hk/'
  end

  def boards_url
    '/n/list_ru.html'
  end

  def get_boards(html)
    links = []
    html.css('table.category a').each do |l|
      if /^\/[a-z0-9]+\/$/.match(l["href"])
        links << l["href"]
      end
    end
    links
  end

  def plaintextize(xhtml)
    CGI.unescapeHTML(xhtml
      .gsub(/<\/p>.*$/, "\r\n")
      .gsub(/<p>/, "")
      .gsub(/<br>/, "\r\n")
      .gsub(/<[^>]+>/, ''))
      #.gsub(/<\/?a\s?.*>/, '')
  end
end
