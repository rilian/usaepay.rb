require 'optparse'
require 'savon'
require 'json'
require(File.expand_path(File.dirname(__FILE__)) + '/../usaepay')

module USAePay
  def self.cli
    Savon.configure do |config|
      config.log = false            # disable logging
      config.log_level = :error     # changing the log level
      HTTPI.log = false           # to total silent the logging.
    end

    options = {}
    OptionParser.new do |opts|
      opts.banner = "Usage: usaepay [options]"
      
      opts.on("-w", "--wsdl WSDL_URL_OR_PATH", "WSDL URL or path") do |wsdl|
        options[:wsdl] = wsdl
      end

      opts.on("-k", "--source-key SOURCE_KEY", "Merchant account source key") do |source_key|
        options[:source_key] = source_key
      end

      opts.on("-p", "--pin PIN", "Merchant account pin") do |pin|
        options[:pin] = pin
      end

      opts.on("-c", "--command COMMAND", "SOAP Command to run. See: http://wiki.usaepay.com/developer/soap") do |command|
        options[:command] = command.to_sym
      end

      opts.on("-b", "--body BODY", "Request body. Must be in JSON") do |body|
        options[:body] = body
      end

      opts.on("-d", "-debug", "Output debug messages from savon") do |dbg|
        options[:debug] = dbg
        #Savon.configure do |config|
        #  config.log = true
        #end
      end
    end.parse!

    required_options! :wsdl, :source_key, :command, :body, options

    USAePay::Client.new(options[:wsdl], options) do |c|
      response = c.request(options[:command]) do |r|
        body = JSON.parse(options[:body])
        r.body = {'Token' => c.token}.merge(body)
      end
      puts response.to_hash.to_json
    end
  end

  def self.required_options!(*args)
    options = args.pop
    args.each do |name|
      required_option!(name, options)
    end
  end

  def self.required_option!(name, options)
    raise "Missing required parameter: #{name}" if options[name].nil?
  end
end

