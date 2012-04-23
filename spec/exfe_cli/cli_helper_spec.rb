require "spec_helper"

describe ExfeCli::CliHelper do
  subject { ExfeCli::CliHelper }
  it { should respond_to :config_file_path }

  context 'config_file_path' do
    it "should have correct config_file_path" do
      # assuming you are using a Mac...
      subject.config_file_path.should =~ %r{/Users/\w+/.exfe}
    end
  end
end
