require 'bundler/gem_tasks'
require 'rake/testtask'

Rake::TestTask.new(:test) do |t|
  t.libs << 'test'
  t.libs << 'lib'
  t.test_files = FileList['test/**/*_test.rb']

  desc 'Run Rubocop analysis and open in the browser'
  task :rubocop do
    system "rubocop -f html -o rubocop.html -c rubocop.yml &\
    start chrome rubocop.html"
  end
end

task default: :test
