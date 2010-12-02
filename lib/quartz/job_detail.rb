module Quartz
  class JobDetail < Java::OrgQuartz::JobDetail
    attr_accessor :job
    def initialize(name,group,job)
      super()
      set_name name
      set_group group
      @job = job
    end
    def validate
    end
  end
end
