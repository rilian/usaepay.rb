require 'savon'
require 'forwardable'
require 'net/https'

module USAePay
  class Client
    extend Forwardable
    def_delegator :@savon, :request
    def initialize(wsdl, opts={})
      @wsdl = wsdl
      @source_key = opts[:source_key] || raise('Missing source_key')
      @pin = opts[:pin]
      @savon = Savon::Client.new @wsdl
      yield self
    end

    def sha1
      Digest::SHA1.hexdigest(@source_key.to_s + seed.to_s + @pin.to_s)
    end

    def seed
      @seed ||= Time.now.to_i.to_s + rand(32768).to_s
    end

    def token
      {
        "SourceKey" => @source_key,
        "PinHash" => {
          "Type" => "sha1",
          "Seed" => seed,
          "HashValue" => sha1
        },
        "ClientIP" => "127.0.0.1"
      }
    end
  end
end


