#!/usr/bin/env ruby -wKU

module Fourchan

  def root
    'http://boards.4chan.org/'
  end

  def boards_url
    '/u/'
  end

  def thread_url(b, t)
    "/#{b}/thread/#{t}/"
  end

  def valid_board?(b)
    @boards.include? "/#{b}/"
  end

  def valid_thread?(t)
    !!(t =~ /^[0-9]+$/)
  end

  def get_boards(html)
    links = []
    html.css('span.boardList a').each do |l|
      if /\/[a-z0-9]+\//.match(l["href"])
        links << l["href"]
      end
    end
    links
  end

  def board_last(b)
    h = html("/#{b}/")
    threads = []
    h.css('div.board/div.thread').each do |t|
      thread_n = t.attr('id').gsub(/[^0-9]/, "")
      thread_caption = t.css('.post.op div.postInfo .subject').text
      thread_author = t.css('.post.op div.postInfo .nameBlock').text
      thread_date = t.css('.post.op div.postInfo .dateTime').text
      header = "\##{thread_n} -- #{thread_caption} #{thread_author} #{thread_date}"
      line = ('-' * (64 - (header.length > 64 ? 64 : header.length)))
      body = plaintextize(t.css('.post.op blockquote.postMessage').inner_html.strip)
      stats_txt = t.css('.summary.desktop').text
      stats = /[^0-9]*([0-9]+)\s[^0-9]*\s([0-9]+\s)?.*/.match(stats_txt)
      count_posts = t.css('div.replyContainer').count
      count_images = t.css('div.fileText').count
      if stats
        count_posts += stats[1].to_i
        count_images += stats[2].to_i
      end
      stat = "#{count_posts} replies, #{count_images} images."
      threads << "-- #{header} #{line}\r\n#{body}\r\n\r\n#{stat}\r\n"
    end
    threads.reverse
  end

  def thread(b, t, c)
    h = html(thread_url(b, t))
    posts = []
    begin
    h.css('div.thread div.post').each do |p|
      post_n = p.attr('id').gsub(/[^0-9]/, "")
      post_caption = p.css('div.postInfo .subject').text
      post_author = p.css('div.postInfo .nameBlock').text
      post_date = p.css('div.postInfo .dateTime').text
      header = "\##{post_n} -- #{post_caption} #{post_author} #{post_date}"
      line = ('-' * (64 - (header.length > 64 ? 64 : header.length)))
      if !p.css('div.fileText').empty?
        body = "http:" + p.css('div.fileText a').first['href'] + "\r\n"
      else
        body = ""
      end
      body += plaintextize(p.css('blockquote.postMessage').inner_html.strip)
      posts << "-- #{header} #{line}\r\n#{body}\r\n"
    end
    rescue Exception => e
      p e
    end
    if c && c < posts.length
      posts[-c..-1]
    else
      posts
    end
  end

  def images(b, t)
    h = html(thread_url(b, t))
    images = []
    h.css('div.fileText').each do |l|
      images << "http:" + l.css('a').first['href']
    end
    images
  end

  def plaintextize(xhtml)
    CGI.unescapeHTML(xhtml
      .gsub(/<\/p>.*$/, "\r\n")
      .gsub(/<p>/, "")
      .gsub(/<a class="quotelink".*>>>(.+)<\/a>/, "\r\n>>\1")
      .gsub(/<span class="quote".*>>(.+)<\/span>/, ">\1")
      .gsub(/<br>/, "\r\n")
      .gsub(/<[^>]+>/, ''))
      #.gsub(/<\/?a\s?.*>/, '')
  end
end
