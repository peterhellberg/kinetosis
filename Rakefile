require 'bundler/gem_tasks'
require 'rake/testtask'
require 'rake/clean'

NAME = 'kinetosis'

# rule to build the extension: this says
# that the extension should be rebuilt
# after any change to the files in ext
file "lib/#{NAME}/#{NAME}.bundle" =>
  Dir.glob("ext/*{.rb,.c}") do
    Dir.chdir("ext") do
      # this does essentially the same thing
      # as what RubyGems does
      ruby "extconf.rb"
      sh "make"
    end
    cp "ext/#{NAME}.bundle", "lib/#{NAME}/"
  end

# make the :test task depend on the shared
# object, so it will be built automatically
# before running the tests
task :test => "lib/#{NAME}/#{NAME}.bundle"

# use 'rake clean' and 'rake clobber' to
# easily delete generated files
CLEAN.include('ext/*{.o,.log,.bundle}')
CLEAN.include('ext/Makefile')
CLOBBER.include('lib/*.bundle')

Rake::TestTask.new(:test) do |t|
  t.test_files = FileList['spec/*_spec.rb']
  t.ruby_opts = ['-rubygems'] if defined? Gem
  t.ruby_opts << '-I.'
end

desc "Run tests"
task :default => :test
