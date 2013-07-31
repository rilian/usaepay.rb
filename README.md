# API

```Ruby
wsdl = 'https://sandbox.usaepay.com/soap/gate/1234567890/usaepay.wsdl'
USAePay::Client.new wsdl
```

# CLI

```
usaepay -w https://sandbox.usaepay.com/soap/gate/1234567890/usaepay.wsdl -k test -p 1234 -command get_transaction_report -b '{"StartDate": "04/28/2013", "EndDate": "06/29/2013", "Report": "check:settled by date", "Format": "csv"}
```