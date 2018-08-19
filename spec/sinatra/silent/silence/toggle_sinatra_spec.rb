RSpec.describe Sinatra do
  subject { create_sinatra }

  it do
    subject.set :silent_sinatra, true
    expect {
      run_async_and_wait(subject)
    }.not_to output(/has taken the stage/).to_stderr
    expect {
      subject.stop!
    }.not_to output(/has ended his set/).to_stderr

    subject.set :silent_sinatra, false
    expect {
      run_async_and_wait(subject)
    }.to output(/has taken the stage/).to_stderr
    expect {
      subject.stop!
    }.to output(/has ended his set/).to_stderr

    subject.set :silent_sinatra, true
    expect {
      run_async_and_wait(subject)
    }.not_to output(/has taken the stage/).to_stderr
    expect {
      subject.stop!
    }.not_to output(/has ended his set/).to_stderr
  end
end
