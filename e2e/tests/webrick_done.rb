require "sinatra/base"
require_relative "../../lib/sinatra/silent"
require_relative "../../spec/helper_methods"

subject = create_sinatra
subject.set :silent_webrick, true
run_async_and_wait(subject)

subject.stop!

subject.set :silent_webrick, false
run_async_and_wait(subject)

subject.stop!
sleep 0.25 # wait for flush
