RSpec.describe Sinatra do
  subject { create_sinatra }

  it do
    subject.set :silent_access_log, true
    expect {
      run_async_and_wait(subject)
      Net::HTTP.get URI("http://localhost:#{subject.settings.port}/__test")
      sleep 0.25
    }.not_to output(/GET \/__test HTTP\/1\.1" 404/).to_stderr

    subject.stop!

    subject.set :silent_access_log, false
    expect {
      run_async_and_wait(subject)
      Net::HTTP.get URI("http://localhost:#{subject.settings.port}/__test")
      sleep 0.25
    }.to output(/GET \/__test HTTP\/1\.1" 404/).to_stderr

    subject.stop!

    subject.set :silent_access_log, true
    expect {
      run_async_and_wait(subject)
      Net::HTTP.get URI("http://localhost:#{subject.settings.port}/__test")
      sleep 0.25
    }.not_to output(/GET \/__test HTTP\/1\.1" 404/).to_stderr
  end
end
