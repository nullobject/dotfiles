require 'irb/completion'
require 'rubygems'
require 'yaml'

ARGV.concat ["--readline", "--prompt-mode", "simple"]

begin
  require 'wirble'
  Wirble.init
  Wirble.colorize
rescue LoadError => e
  warn "Couldn't load Wirble: #{e}"
end

begin
  require 'hirb'
  Hirb.enable
rescue LoadError => e
  warn "Couldn't load Hirb: #{e}"
end
