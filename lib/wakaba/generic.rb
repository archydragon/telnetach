#!/usr/bin/env ruby -wKU

require 'cgi'

module Generic

  def thread_url(b, t)
    "/#{b}/res/#{t}.html"
  end

  def valid_board?(b)
    @boards.include? "/#{b}/"
  end

  def valid_thread?(t)
    !!(t =~ /^[0-9]+$/)
  end

  def board_last(b)
    h = html("/#{b}/")
    threads = []
    begin
    src = h.css('form#delform/label') + h.css('form#delform/*/label')
    src.each do |l|
      thread_n = l.css('input').first['value']
      thread_title = l.text.strip
      header = "\##{thread_n} -- #{thread_title}"
      line = ('-' * (64 - (header.length > 64 ? 64 : header.length)))
      body_elem = l.next_element.next_element.next_element
      raw_body = plaintextize(body_elem.inner_html.strip)
      body = raw_body#.split[0..49].join(" ")# + (body != raw_body ? "…" : "")
      stats_txt = body_elem.next_element.text
      stats = /[^0-9]*([0-9]+)\s[^0-9]*\s([0-9]+\s)?.*/.match(stats_txt)
      count_posts = 0
      count_images = 0
      p stats_txt
      p stats
      if body_elem.next_element.attr('class') == 'omittedposts'
        count_posts = stats[1].to_i - 1
        begin
          count_images = stats[2].to_i
        rescue Exception => e
          count_images = 0
        end
      end
      next_elem = body_elem.next_element
      while next_elem && next_elem.name != 'br' do
        if next_elem.name == 'table'
          count_posts += 1
          if !next_elem.css('img').empty?
            count_images += 1
          end
        end
        next_elem = next_elem.next_element
      end
      stat = "#{count_posts} replies, #{count_images} images in replies."
      threads << "-- #{header} #{line}\r\n#{body}\r\n#{stat}\r\n"
    end
    rescue Exception => ee
      p ee
    end
    threads.reverse
  end

  def thread(b, t, c)
    h = html(thread_url(b, t))
    posts = []
    op = h.css('form#delform label').first
    begin
    body = ""
    img = h.css('form#delform span.filesize').first
    if img
      href = img.css('a').first['href']
      body = URI::join(self.root, href).to_s + "\r\n"
    end
    post_n = op.css('input').first['value']
    post_title = op.text.strip
    header = "\##{post_n} -- #{post_title}"
    line = ('-' * (64 - (header.length > 64 ? 64 : header.length)))
    body_elem = op.next_element.next_element#.next_element
    raw_body = plaintextize(body_elem.inner_html.strip)
    body += raw_body
    posts << "-- #{header} #{line}\r\n#{body}"
    next_elem = body_elem.next_element
    while next_elem.name != 'br' do
      body = ""
      if next_elem.name == 'table'
        image = next_elem.css('span.filesize')
        if !image.empty?
          href = image.css('a').first['href']
          body = URI::join(self.root, href).to_s + "\r\n"
        end
        p = next_elem.css('td.reply')
        post_n = p.css('label/input').first['value']
        post_title = p.css('label').first.text.strip
        header = "\##{post_n} -- #{post_title}"
        line = ('-' * (64 - (header.length > 64 ? 64 : header.length)))
        body_elem = p.css('blockquote')
        raw_body = plaintextize(body_elem.inner_html.strip)
        body += raw_body
        posts << "-- #{header} #{line}\r\n#{body}"
      end
      next_elem = next_elem.next_element
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
    h.css('span.filesize a').each do |l|
      images << URI::join(self.root, l['href']).to_s
    end
    images
  end

end
