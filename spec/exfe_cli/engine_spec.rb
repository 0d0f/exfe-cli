require "spec_helper"

describe ExfeCli::Engine do
  subject { ExfeCli::Engine }
  it { should respond_to :login }
end