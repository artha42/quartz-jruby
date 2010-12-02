require File.dirname(__FILE__) + '/test_helper.rb'

org.apache.log4j.BasicConfigurator.configure
class TestScheduler
  include Quartz::Scheduler
  schedule(:say_hello_5, :every=>5.seconds) { info "every 5 seconds" }
  schedule(:say_hello_30, :every=>30.seconds) { error "every 30 seconds" }

end
TestScheduler.instance.run
