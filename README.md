# API

```Ruby
wsdl = 'https://sandbox.usaepay.com/soap/gate/1234567890/usaepay.wsdl'
USAePay::Client.new wsdl
```

# CLI

```
usaepay -wsdl https://sandbox.usaepay.com/soap/gate/1234567890/usaepay.wsdl -source_key test -pin 1234 -command search_transactions
```