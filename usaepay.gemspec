Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'usaepay'
  s.version     = '0.0.1'
  s.summary     = 'USAePay library and CLI'
  s.description = 'USAePay library for Ruby and command line interface'

  s.license = 'MIT'

  s.author   = 'Lance Carlson'
  s.email    = 'lcarlson@healpay.com'
  s.homepage = 'https://github.com/lancecarlson/usaepay.rb'

  s.files        = Dir['bin/**/*', 'lib/**/*']
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'savon',     '~> 2.3.0'
end
