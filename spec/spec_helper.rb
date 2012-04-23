require "simplecov"
SimpleCov.start do
  add_filter 'spec'
end

require "open-uri"
require "exfe_cli"

def fixture(filename)
  ExfeCli::Engine.jsonize(raw_fixture(filename)).recursively_symbolize_keys
end

def raw_fixture(filename)
  open("spec/fixtures/#{filename}") { |file| file.read }
end
