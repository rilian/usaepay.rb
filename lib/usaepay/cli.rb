require 'optparse'

module USAePay
  def self.cli
    options = {}
    OptionParser.new do |opts|
      opts.banner = "Usage: usaepay [options]"
      
      opts.on("-wsdl", "WSDL URL or path") do |wsdl|
        options[:wsdl] = wsdl
      end

      opts.on("-source-key", "Merchant account source key") do |source_key|
        options[:source_key] = source_key
      end

      opts.on("-pin", "Merchant account pin") do |pin|
        options[:pin] = pin
      end

      opts.on("-c", "-command", "SOAP Command to run. See: http://wiki.usaepay.com/developer/soap") do |command|
        options[:command] = command
      end
    end.parse!

    p options
  end
end

USAePay.cli
