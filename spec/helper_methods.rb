def create_sinatra
  s = Sinatra.new
  s.set :port, 4567 + ENV['TEST_ENV_NUMBER'].to_i
  s
end

def run_async_and_wait(subject)
  Thread.new do
    subject.run!
  end

  loop do
    break if subject.running?
    sleep 0.1
  end
end
