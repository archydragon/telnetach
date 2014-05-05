#!/usr/bin/env ruby -wKU

require 'rubygems'
require 'nokogiri'
require 'open-uri'

class Wakaba
  attr_accessor :root, :boards_url, :boards

  AVAILABLE = {
    "4chan.org"  => "Fourchan",
    "iichan.hk"  => "Iichan",
    "nowere.net" => "Nowere"
  }

  def initialize(chan)
    rawchan = /^(https?\:\/\/)?([^\/]+)\/?$/.match(chan)
    if !rawchan
      raise "Bad board link specified in configuration."
    end
    smod = AVAILABLE[rawchan[2]]
    if !smod
      raise "Board #{rawchan[2]} is not supported."
    end
    mod = Object.const_get(smod)
    extend mod
    @boards_url = self.boards_url
    @root = self.root
    html = html(self.boards_url)
    @boards = self.get_boards(html)
  end

  def html(url)
    Nokogiri::HTML(open(self.root + url,
      "User-Agent" => "Mozilla/5.0 (X11; OpenBSD amd64; rv:28.0) Gecko/20100101 Firefox/28.0"))
  end

end
