# Install

Make sure you have Ruby and Ruby development headers. On ubuntu you need the ruby and ruby-dev packages

```
apt-get install ruby ruby-dev
```

Then install using rubygems

```
gem install usaepay
```

# API

```Ruby
wsdl = 'https://sandbox.usaepay.com/soap/gate/1234567890/usaepay.wsdl'
USAePay::Client.new(wsdl, {:source_key => 'test', :pin => '1234') do |c|
  response = c.request('get_transaction_report') do |r|
    body = {
      "StartDate" => "04/28/2013", 
      "EndDate" => "06/29/2013", 
      "Report" => "check:settled by date", 
      "Format" => "csv"
    }
    r.body = {'Token' => c.token}.merge(body)
  end
  puts response.to_hash.to_json
end
```

# CLI

```
usaepay -w https://sandbox.usaepay.com/soap/gate/1234567890/usaepay.wsdl -k test -p 1234 -command get_transaction_report -b '{"StartDate": "04/28/2013", "EndDate": "06/29/2013", "Report": "check:settled by date", "Format": "csv"}
```
