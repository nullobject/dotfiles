#!/usr/bin/ruby

require 'irb/completion'
require 'rubygems'

ARGV.concat [ "--readline", "--prompt-mode", "simple" ]

begin
  require 'wirble'
  Wirble.init
  Wirble.colorize
rescue LoadError => err
  warn "Couldn't load Wirble: #{err}"
end

begin
  require 'hirb'
  Hirb.enable
rescue LoadError => err
  warn "Couldn't load Hirb: #{err}"
end

load File.dirname(__FILE__) + '/.railsrc' if $0 == 'irb' && ENV['RAILS_ENV']
