module Quartz
  class JobFactory
    include Singleton
    include org.quartz.spi.JobFactory
    attr_accessor :jobs
    def initialize
      @jobs||={}
    end
    def new_job(event)
      event.get_job_detail.job
      
    end
  end
end
