require "simplecov"
SimpleCov.start do
  add_filter 'spec'
end

require "open-uri"
require "exfe_cli"

def fixture(filename)
  ExfeCli::Engine.new.dehydrate(raw_fixture(filename))
end

def raw_fixture(filename)
  open("spec/fixtures/#{filename}") { |file| file.read }
end
