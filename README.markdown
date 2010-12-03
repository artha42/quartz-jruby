## Quartz for JRuby

From [Quartz Scheduler's website](http://www.quartz-scheduler.org/)

> Quartz is a full-featured, open source job scheduling service that can be integrated with, or used along side virtually any Java EE or Java SE application - from the smallest stand-alone application to the largest e-commerce system. Quartz can be used to create simple or complex schedules for executing tens, hundreds, or even tens-of-thousands of jobs; jobs whose tasks are defined as standard Java components that may executed virtually anything you may program them to do. The Quartz Scheduler includes many enterprise-class features, such as JTA transactions and clustering.

Here is a quick [blog post](http://www.artha42.com/blog/scheduling_jobs_with_quartz_jruby) comparing the the Java version to the Ruby Version.

## Usage

Install with

        $ gem install quartz-jruby

You need to require the jars included /java directory independently.

        require 'quartz'
        class TestScheduler
          include Quartz::Scheduler
          schedule(:say_hello_5, :every=>5.seconds) { info "every 5 seconds" }
          schedule(:say_hello_30, :every=>30.seconds) { error "every 30 seconds" }
        end
        TestScheduler.instance.run

If you use log4j in your app, quartz-jruby integrates with it as well.

## Feedback

If you have any feedback, send me an email vagmi <at> [artha42.com](http://www.artha42.com).

## License

Copyright (c) 2010, Vagmi Mudumbai

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
