## Quartz for JRuby

From [Quartz Scheduler's website](http://www.quartz-scheduler.org/)

> Quartz is a full-featured, open source job scheduling service that can be integrated with, or used along side virtually any Java EE or Java SE application - from the smallest stand-alone application to the largest e-commerce system. Quartz can be used to create simple or complex schedules for executing tens, hundreds, or even tens-of-thousands of jobs; jobs whose tasks are defined as standard Java components that may executed virtually anything you may program them to do. The Quartz Scheduler includes many enterprise-class features, such as JTA transactions and clustering.


## Usage

        class TestScheduler
          include Quartz::Scheduler
          schedule(:say_hello_5, :every=>5.seconds) { info "every 5 seconds" }
          schedule(:say_hello_30, :every=>30.seconds) { error "every 30 seconds" }
        end
        TestScheduler.instance.run

## Feedback

If you have any feedback, send me an email vagmi <at> [artha42.com](http://www.artha42.com).


