RSpec.describe "webrick silenced" do
  subject { create_sinatra }

  before do
    subject.set :silent_webrick, true
  end

  it_behaves_like "sinatra verbose"
  it_behaves_like "webrick silenced"
  it_behaves_like "access log verbose"
end
