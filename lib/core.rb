#!/usr/bin/env ruby -wKU

require 'rubygems'
require 'yaml'
require 'socket'

conffile = ARGV.first

# load config
if !File.exist?(conffile)
  raise "Configuration file #{File.expand_path(conffile)} not available."
end
config = YAML.load_file(conffile)
chan = config['chan']
port = config['port']

wakaba = Wakaba.new(chan)

ss = TCPServer.new(port)
loop {
  Thread.start(ss.accept) { |s|
    (s << ('=' * 70) + "\r\n").flush
    (s << "Welcome to #{wakaba.root} \r\n").flush
    (s << "To get the information about available commands send '?' or 'h' \r\n").flush
    (s << ('=' * 70) + "\r\n\r\n").flush
    (s << "$ ").flush
    begin
      while line = s.gets;  # Returns nil on EOF.
        begin
          request = /\"(.+)\\r\\n\"/.match(line.inspect)[1]
          if request == "q"
            (s << "See you.\r\n").flush
            s.close
          end
          cmd = TelnetCmd.new(wakaba, request)
          reply = cmd.run
          cmd = nil
          (s << "#{reply}\r\n").flush
        rescue Exception => e
        end
        (s << "$ ").flush
      end
    rescue
      bt = $!.backtrace * "\n  "
      ($stderr << "error: #{$!.inspect}\n  #{bt}\n").flush
    ensure
      s.close
    end
  }
}

