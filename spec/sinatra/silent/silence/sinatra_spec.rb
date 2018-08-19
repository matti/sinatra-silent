RSpec.describe "sinatra silenced" do
  subject { create_sinatra }

  before do
    subject.set :silent_sinatra, true
  end

  it_behaves_like "sinatra silenced"
  it_behaves_like "webrick verbose"
  it_behaves_like "access log verbose"
end
