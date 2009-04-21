#!/usr/bin/env ruby

require 'erb'
require 'optparse'
require 'pp'

help = <<HELP
$0 is a friendly VirtualHost generating script
 
Basic Command Line Usage:
  add_host.rb --host=foo.com --ports=5000-5010
  Options:
HELP

DOMAIN = {}

opts = OptionParser.new do |opts|
  opts.banner = help
  
  opts.on("--host [host]", "Hostname") do |host|
    DOMAIN[:host] = host
  end
  
  opts.on("--ports [ports]", "Proxy ports") do |ports|
    s, f = ports.split("-").collect{|x| x.to_i}
    DOMAIN[:ports] = (s..f).to_a
  end
end

opts.parse!

template = ERB.new(File.read("../config/apache-site.conf"))

`mkdir -p /var/local/#{DOMAIN[:host]}/shared/log`
`mkdir -p /var/local/#{DOMAIN[:host]}/shared/config`
`chown -R app:app /var/local/#{DOMAIN[:host]}`
template.run(binding)

