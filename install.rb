#!/usr/bin/env ruby

require "net/http"

uri = URI "https://raw.githubusercontent.com/samphippen/rubyfmt/master/src/rubyfmt.rb"
res = Net::HTTP.get uri
pwd = File.dirname __FILE__
outfile = File.join pwd, "rubyfmt.rb"
File.write outfile, res
File.chmod 0755, outfile
