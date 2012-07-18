desc 'Build the .framework for the specs to use'
task :build do
  `xcodebuild -alltargets`
end

# This assumes macruby's rspec has not been namespaced.
desc 'Run specs'
task :spec => :build do
  exec 'rspec spec/*_spec.rb'
end

desc 'Default: run specs.'
task :default => :spec

