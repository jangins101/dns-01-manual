# dns-01-manual

A manual implementation for **DNS-01** challenge hook used in dehydrated, a Let's Encrypt client.

When using this hook the script will tell you what to do to complete the **DNS-01** challenge of Let's Encrypt.


## Examples

``/path/to/dehydrated --challenge dns-01 --hook hook.sh --domain test.example.com --config /path/to/config``

``/path/to/dehydrated --challenge dns-01 --hook /path/to/hook.sh --signcsr /path/to/csr.pem``

``/path/to/dehydrated --challenge dns-01 --hook /path/to/hook.sh --revoke /path/to/cert.pem``


## Example run
```
./dehydrated --challenge dns-01 --hook hook.sh --domain test.example.com --config /path/to/config

# INFO: Using main config file /path/to/config

Startup Hook Executed (startup_hook)y
Processing test.example.com
 + Checking domain name(s) of existing cert... unchanged.
 + Checking expire date of existing cert...
 + Valid till Apr 1 12:00:00 2018 GMT (Longer than 30 days). Ignoring because renew was forced!
 + Signing domains...
 + Generating private key...
 + Generating signing request...
 + Requesting challenge for test.example.com...

Deploy Challenge Token
  Add the following TXT record to the zone definition of test.example.com:

    Name : _acme-challenge.test.example.com
    Value: aaaaaaabbbbbbbcccccccdddddddeeeeeeefffffffg

  Press enter to continue...

 + Responding to challenge for test.example.com...

Clean Challenge Token
  You can remove the following TXT record from the zone definition of test.example.com:

    Name : _acme-challenge.test.example.com
    Value: aaaaaaabbbbbbbcccccccdddddddeeeeeeefffffffg

  Press enter to continue...

 + Challenge is valid!
 + Requesting certificate...
 + Checking certificate...
 + Done!
 + Creating fullchain.pem...
 + Using cached chain!

Deploy Certificate
  Timestamp  : 1234567890
  Certificate: ../certs/test.example.com/cert.pem
  Key        : ../certs/test.example.com/privkey.pem
  Full Chain : ../certs/test.example.com/fullchain.pem
  Chain      : ../certs/test.example.com/chain.pem

 + Done!

Exit hook executed
```

## More info

More hooks: https://github.com/lukas2511/dehydrated/wiki/Examples-for-DNS-01-hooks

Dehydrated: https://github.com/lukas2511/dehydrated
