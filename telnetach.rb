#!/usr/bin/env ruby -wKU

require 'rubygems'
require 'daemons'
require './lib/cmd.rb'
require './lib/wakaba.rb'
require './lib/wakaba/generic.rb'
Dir["./lib/wakaba/*.rb"].each { |file| require file }

conffile = File.join(Dir.pwd, 'telnetach.yml')

Daemons.run(File.join(File.dirname(__FILE__), 'lib/core.rb'), {
  :appname   => 'telnetach',
  :ARGV      => [ARGV[0], '-f', '--', conffile],
  :dir_mode  => :normal,
  :dir       => 'tmp',
  :backtrace => true,
  :monitor   => false,
  :ontop     => false
})
