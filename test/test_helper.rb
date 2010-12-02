require 'stringio'
#require 'test/unit'

JAVA_HOME = File.expand_path(File.join(File.dirname(__FILE__),"..","java"))
JARS = Dir.glob(JAVA_HOME+"/*.jar").collect { |e| e.split(JAVA_HOME)[1].slice(1..-1) }
$:.unshift(JAVA_HOME)
JARS.each { |jar| 
  puts "requiring #{jar}"
  require jar 
}

require File.dirname(__FILE__) + '/../lib/quartz'
