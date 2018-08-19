RSpec.describe "all silenced" do
  subject { create_sinatra }

  before do
    subject.set :silent_all, true
  end

  it_behaves_like "sinatra silenced"
  it_behaves_like "webrick silenced"
  it_behaves_like "access log silenced"
end
