# Rakefile for USAePay.  -*-ruby-*-

desc "Run all the tests"
task :default => [:test]

def release
  "usaepay-#{File.read("usaepay.gemspec")[/s.version *= *"(.*?)"/, 1]}"
end

desc "Make binaries executable"
task :chmod do
  Dir["bin/*"].each { |binary| File.chmod(0775, binary) }
end

task :gem do
  sh "gem build usaepay.gemspec"
end
