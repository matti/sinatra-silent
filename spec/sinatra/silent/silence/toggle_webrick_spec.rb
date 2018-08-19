RSpec.describe Sinatra do
  subject { create_sinatra }

  it do
    subject.set :silent_webrick, true
    expect {
      run_async_and_wait(subject)
    }.not_to output(/WEBrick::HTTPServer#start/).to_stderr
    expect {
      subject.stop!
    }.not_to output(/WEBrick::HTTPServer#start done/).to_stderr_from_any_process

    subject.set :silent_webrick, false
    expect {
      run_async_and_wait(subject)
    }.to output(/WEBrick::HTTPServer#start/).to_stderr

    # TODO: e2e/tests/webrick_done.rb tests this correctly
    expect {
      subject.stop!
    }.not_to output(/WEBrick::HTTPServer#start done/).to_stderr_from_any_process
    # }.to output(/WEBrick::HTTPServer#start done/).to_stderr_from_any_process

    subject.set :silent_webrick, true
    expect {
      run_async_and_wait(subject)
    }.not_to output(/WEBrick::HTTPServer#start/).to_stderr
    expect {
      subject.stop!
    }.not_to output(/WEBrick::HTTPServer#start done/).to_stderr_from_any_process
  end
end
