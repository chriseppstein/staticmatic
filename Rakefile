require 'rake'
require 'rubygems' 
require 'spec'
require 'spec/rake/spectask'

task :default => :spec

desc "Run all specs in spec directory (excluding plugin specs)"

Spec::Rake::SpecTask.new(:spec) do |t|
  t.spec_files = FileList['spec/**/*_spec.rb']
end