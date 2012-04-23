#!/usr/bin/env rake
require "bundler/gem_tasks"

desc 'beatify fixture jsons'
task :beautify_fixtures do
  require "open-uri"
  require "json"
  Dir['spec/fixtures/*.json'].each do |file|
    json = open(file) { |f| f.read }
    open(file, 'w') { |f| f.write JSON.pretty_generate JSON(json) }
  end
end

require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = 'spec/**/*_spec.rb'
end

task :default => :spec
