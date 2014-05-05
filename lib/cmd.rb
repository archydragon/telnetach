#!/usr/bin/env ruby -wKU

class TelnetCmd
  attr_accessor :cmd, :args, :wakaba

  def initialize(wakaba, request)
    splitted = request.split(' ')
    @cmd = splitted.shift
    @args = splitted
    @wakaba = wakaba
  end

  def run
    case @cmd
    when "?"
      self.help
    when "h"
      self.help
    when "b"
      if @args.empty?
        self.boards
      else
        self.board_last
      end
    when "t"
      if @args.empty?
        self.noargs
      else
        self.thread
      end
    when "i"
      if @args.empty?
        self.noargs
      else
        self.images
      end
    else
      self.unknown
    end
  end

  def unknown
    "Unknown command."
  end

  def noargs
    "Not enough arguments"
  end

  def help
    <<-AAAA
Telnet client for #{@wakaba.root} imageboard.
`?` or `h`                     -- this help
`b`                            -- list of availble boards
`b /d/` or `b d`               -- last active threads from the board /d/
`t a 1234` or `t /a/1234`      -- read required tread completely
`t a 1234 3` or `t /a/1234 3`  -- read last 3 messages in thread
`i a 1234` or `i /a/1234`      -- get list of images in thread
`q`                            -- disconnect
  AAAA
  end

  def boards
    "Available boards:\r\n" + @wakaba.boards.join(", ")
  end

  def board_last
    b = @args[0].tr('/', '')
    if @wakaba.valid_board?(b.downcase)
      last = @wakaba.board_last(b.downcase).join("\r\n")
      "Last active threads in /#{b.downcase}/:\r\n#{last}"
    else
      "Invalid request. Possible, this board is not available."
    end
  end

  def thread
    splitted = @args[0].split('/')
    if splitted.length == 1
      b = @args[0]
      t = @args[1]
      c = @args[2]
    else
      splitted.reject! { |s| s.empty? }
      b = splitted[0]
      t = splitted[1]
      c = @args[1]
    end
    if @wakaba.valid_board?(b.downcase) && @wakaba.valid_thread?(t)
      begin
        thr = @wakaba.thread(b.downcase, t, c.to_i).join("\r\n")
        "Thread /#{b.downcase}/#{t}:\r\n#{thr}"
      rescue Exception => e
        "Thread not found."
      end
    else
      "Invalid request. Possible, this board is not available, or\r\nthread number isn't a number."
    end
  end

  def images
    splitted = @args[0].split('/')
    if splitted.length == 1
      b = @args[0]
      t = @args[1]
    else
      splitted.reject! { |s| s.empty? }
      b = splitted[0]
      t = splitted[1]
    end
    if @wakaba.valid_board?(b.downcase) && @wakaba.valid_thread?(t)
      begin
        img = @wakaba.images(b.downcase, t).join("\r\n")
        "Images from thread /#{b.downcase}/#{t}:\r\n#{img}\r\n"
      rescue Exception => e
        p e
        "Thread not found."
      end
    else
      "Invalid request. Possible, this board is not available, or\r\nthread number isn't a number."
    end
  end

end
