RSpec.describe Sinatra do
  subject { create_sinatra }

  it_behaves_like "sinatra verbose"
  it_behaves_like "webrick verbose"
  it_behaves_like "access log verbose"
end
