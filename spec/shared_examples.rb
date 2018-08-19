
RSpec.shared_examples "sinatra verbose" do
  it do
    expect {
      run_async_and_wait(subject)
    }.to output(/has taken the stage/).to_stderr
  end

  it do
    run_async_and_wait(subject)

    expect {
      subject.stop!
    }.to output(/Sinatra has ended his set/).to_stderr
  end
end

RSpec.shared_examples "webrick verbose" do
  it do
    expect {
      run_async_and_wait(subject)
    }.to output(/WEBrick::HTTPServer#start: pid=/).to_stderr
  end

  it do
    run_async_and_wait(subject)

    expect {
      subject.stop!
      sleep 0.1
    }.to output(/WEBrick::HTTPServer#start done/).to_stderr_from_any_process
  end
end

RSpec.shared_examples "access log verbose" do
  it do
    expect {
      run_async_and_wait(subject)
      Net::HTTP.get URI("http://localhost:#{subject.settings.port}/__test")
      sleep 0.25
    }.to output(/GET \/__test HTTP\/1\.1" 404/).to_stderr
  end
end

RSpec.shared_examples "sinatra silenced" do
  it do
    expect {
      run_async_and_wait(subject)
    }.not_to output(/has taken the stage/).to_stderr
  end

  it do
    expect {
      subject.stop!
    }.not_to output(/Sinatra has ended his set/).to_stderr
  end
end

RSpec.shared_examples "webrick silenced" do
  it do
    expect {
      run_async_and_wait(subject)
    }.not_to output(/WEBrick::HTTPServer#start/).to_stderr
  end

  it do
    run_async_and_wait(subject)

    expect {
      subject.stop!
    }.not_to output(/WEBrick::HTTPServer#start done/).to_stderr_from_any_process
  end
end

RSpec.shared_examples "access log silenced" do
  it do
    expect {
      run_async_and_wait(subject)
      Net::HTTP.get URI("http://localhost:#{subject.settings.port}/__test")
      sleep 0.1
    }.not_to output(/GET \/__test HTTP\/1\.1" 404/).to_stderr
  end
end
