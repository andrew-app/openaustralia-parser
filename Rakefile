require 'rake'
require 'rake/testtask'
require 'rspec/core/rake_task'

task :default => [:spec]

RSpec::Core::RakeTask.new do |t|
  t.ruby_opts = ['-rtest/unit']
  t.pattern = ['spec/*_spec.rb', 'test/test_*.rb']
end

RSpec::Core::RakeTask.new(:spec_coverage) do |t|
  t.rcov = true
  t.rcov_opts = ["-x/Library/, -xspec"]
  t.ruby_opts = ['-rtest/unit']
  t.pattern = ['spec/*_spec.rb', 'test/test_*.rb']
end

task :gems do
  module Kernel
    alias :gem_old :gem
    def gem(name, *version_requirements)
      begin
        gem_old(name, *version_requirements)
      rescue Gem::LoadError
        print "  [ ]"
      else
        print "  [I]"
      end
      puts "  %-20s %s" % [name, version_requirements.inspect]
    end
  end

  puts "checking gems"
  require 'lib/environment'

  module Kernel
    alias :gem :gem_old
  end
end
