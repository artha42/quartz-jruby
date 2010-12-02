require 'java'
import org.quartz.Job
module Quartz
  class CronJob
    include org.quartz.Job
    attr_accessor :name
    def initialize(name)
      @name=name
    end
    def execute(context)
      job_block = JobFactory.instance.jobs[@name]
      job_block.call
    end
  end
end
