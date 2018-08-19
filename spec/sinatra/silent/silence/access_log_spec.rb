RSpec.describe "access log silenced" do
  subject { create_sinatra }

  before do
    subject.set :silent_access_log, true
  end

  it_behaves_like "sinatra verbose"
  it_behaves_like "webrick verbose"
  it_behaves_like "access log silenced"
end
