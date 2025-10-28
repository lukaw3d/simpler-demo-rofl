# Demo ROFL App

This is a demo ROFL app that runs in TDX using Podman containers defined in a
`compose.yaml` file.

compose.yaml > command > deno server > posts onchain message to 0x5d683b980615A7A60B3cFf3DFC338A9985278fF3 when
ROFL proxy URL is opened.

https://explorer.oasis.io/testnet/sapphire/address/0x5d683b980615A7A60B3cFf3DFC338A9985278fF3
is Echo.sol - this contract allows anyone to post a message. So you don't need to deploy+verify it yourself.

Do:
```sh
oasis rofl create --network testnet
oasis rofl secret rm MESSAGE
echo -n "msg 1" | oasis rofl secret set MESSAGE -
# message is stored in secrets, but then intentionally expose it
# secret -> rofl app -> URL opened -> encrypted contract call -> unencrypted event emit
oasis rofl build
oasis rofl update
oasis rofl deploy
# Wait 2 minutes
oasis machine show
# See ROFL Proxy: Ports from compose file. In my case https://p8000.m933.opf-testnet-rofl-25.rofl.app
# Open https://p8000.m933.opf-testnet-rofl-25.rofl.app/attempt and wait 20 seconds
# See "msg 1http://p8000.m933.opf-testnet-rofl-25.rofl.app/attempt" message at https://explorer.oasis.io/testnet/sapphire/address/0x5d683b980615A7A60B3cFf3DFC338A9985278fF3/events#events
# (ignore all the spam URL messages from internet scanning bots)
oasis rofl remove
# Get back staked tokens
```

<details>
<summary>Output (click to expand)</summary>

```console
$ [+981.17s] $ docker compose up
WARN[0000] The "MESSAGE" variable is not set. Defaulting to a blank string.
[+] Running 1/1
 ✔ Container denojs-inline-echo-1  Recreated                                                                                          0.2s
Attaching to echo-1
echo-1  | Download https://registry.npmjs.org/viem
echo-1  | Download https://registry.npmjs.org/@noble%2fcurves
echo-1  | Download https://registry.npmjs.org/@noble%2fhashes
echo-1  | Download https://registry.npmjs.org/@scure%2fbip32
echo-1  | Download https://registry.npmjs.org/@scure%2fbip39
echo-1  | Download https://registry.npmjs.org/abitype
echo-1  | Download https://registry.npmjs.org/isows
echo-1  | Download https://registry.npmjs.org/ox
echo-1  | Download https://registry.npmjs.org/typescript
echo-1  | Download https://registry.npmjs.org/ws
echo-1  | Download https://registry.npmjs.org/@scure%2fbase
echo-1  | Download https://registry.npmjs.org/zod
echo-1  | Download https://registry.npmjs.org/@adraffy%2fens-normalize
echo-1  | Download https://registry.npmjs.org/@noble%2fciphers
echo-1  | Download https://registry.npmjs.org/eventemitter3
echo-1  | Download https://registry.npmjs.org/bufferutil
echo-1  | Download https://registry.npmjs.org/utf-8-validate
echo-1  | Download https://registry.npmjs.org/viem/-/viem-2.38.4.tgz
echo-1  | Download https://registry.npmjs.org/@scure/bip39/-/bip39-1.6.0.tgz
echo-1  | Download https://registry.npmjs.org/@scure/bip32/-/bip32-1.7.0.tgz
echo-1  | Download https://registry.npmjs.org/ox/-/ox-0.9.6.tgz
echo-1  | Download https://registry.npmjs.org/@noble/curves/-/curves-1.9.1.tgz
echo-1  | Download https://registry.npmjs.org/abitype/-/abitype-1.1.0.tgz
echo-1  | Download https://registry.npmjs.org/ws/-/ws-8.18.3.tgz
echo-1  | Download https://registry.npmjs.org/isows/-/isows-1.0.7.tgz
echo-1  | Download https://registry.npmjs.org/@noble/hashes/-/hashes-1.8.0.tgz
echo-1  | Download https://registry.npmjs.org/@scure/base/-/base-1.2.6.tgz
echo-1  | Download https://registry.npmjs.org/@noble/ciphers/-/ciphers-1.3.0.tgz
echo-1  | Download https://registry.npmjs.org/eventemitter3/-/eventemitter3-5.0.1.tgz
echo-1  | Download https://registry.npmjs.org/@adraffy/ens-normalize/-/ens-normalize-1.11.1.tgz
echo-1  | Listening on http://0.0.0.0:8000/ (http://localhost:8000/)
echo-1  | {
echo-1  |   calldata: "0x2ac0df2600000000000000000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000016687474703a2f2f6c6f63616c686f73743a383030302f00000000000000000000"
echo-1  | }
echo-1  | {
echo-1  |   calldata: "0x2ac0df2600000000000000000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000021687474703a2f2f6c6f63616c686f73743a383030302f66617669636f6e2e69636f00000000000000000000000000000000000000000000000000000000000000"
echo-1  | }
Gracefully stopping... (press Ctrl+C again to force)
[+] Stopping 1/1
 ✔ Container denojs-inline-echo-1  Stopped                                                                                            0.3s
# open http://localhost:8000/abcd
$ [+12.24s] $ oasis rofl create --network testnet
Unlock your account.
? Passphrase:
You are about to sign the following transaction:
Format: plain
Method: rofl.Create
Body:
  {
    "policy": {
      "quotes": {
        "pcs": {
          "tcb_validity_period": 30,
          "min_tcb_evaluation_data_number": 18,
          "tdx": {}
        }
      },
      "enclaves": [],
      "endorsements": [
        {
          "any": {}
        }
      ],
      "fees": 2,
      "max_expiration": 3
    },
    "scheme": 1,
    "metadata": {
      "net.oasis.rofl.license": "Apache-2.0",
      "net.oasis.rofl.name": "simpler-demo-rofl",
      "net.oasis.rofl.repository": "https://github.com/lukaw3d/simpler-demo-rofl",
      "net.oasis.rofl.version": "0.1.1"
    }
  }
Authorized signer(s):
  1. AyRQI2eSfhfmrwvby9lKwWPZO8RickGz9APC9+VmGJaG (secp256k1eth)
     Nonce: 84
Fee:
  Amount: 0.0121912 TEST
  Gas limit: 121912
  (gas price: 0.0000001 TEST per gas unit)

Network:  testnet
ParaTime: sapphire
Account:  a
? Sign this transaction? Yes
(In case you are using a hardware-based signer you may need to confirm on device.)
Broadcasting transaction...
Transaction included in block successfully.
Round:            14119750
Transaction hash: bb707e2498d6391b3af41e78a0e0c704037436a2eebd95e4ed76938c71063890
Execution successful.
Created ROFL app: rofl1qptr7radc5yyw3ph58s4ff0wz3957hr47qlqmqfj
Run `oasis rofl build` to build your ROFL app.
$ [+8.79s] $ echo -n "msg 1" | oasis rofl secret set MESSAGE -
Run `oasis rofl update` to update your ROFL app's on-chain configuration.
$ [+.24s] $ oasis rofl build
Building a ROFL application...
Deployment: default
Network:    testnet
ParaTime:   sapphire
Debug:      false
App ID:     rofl1qptr7radc5yyw3ph58s4ff0wz3957hr47qlqmqfj
Name:       simpler-demo-rofl
Version:    0.1.1
TEE:        tdx
Kind:       container
Building a container-based TDX ROFL application...
Downloading firmware artifact...
  URI: https://github.com/oasisprotocol/oasis-boot/releases/download/v0.6.2/ovmf.tdx.fd#db47100a7d6a0c1f6983be224137c3f8d7cb09b63bb1c7a5ee7829d8e994a42f
  Hash: db47100a7d6a0c1f6983be224137c3f8d7cb09b63bb1c7a5ee7829d8e994a42f
  (using cached artifact)
Downloading kernel artifact...
  URI: https://github.com/oasisprotocol/oasis-boot/releases/download/v0.6.2/stage1.bin#e5d4d654ca1fa2c388bf64b23fc6e67815893fc7cb8b7cfee253d87963f54973
  Hash: e5d4d654ca1fa2c388bf64b23fc6e67815893fc7cb8b7cfee253d87963f54973
  (using cached artifact)
Downloading stage 2 template artifact...
  URI: https://github.com/oasisprotocol/oasis-boot/releases/download/v0.6.2/stage2-podman.tar.bz2#b2ea2a0ca769b6b2d64e3f0c577ee9c08f0bb81a6e33ed5b15b2a7e50ef9a09f
  Hash: b2ea2a0ca769b6b2d64e3f0c577ee9c08f0bb81a6e33ed5b15b2a7e50ef9a09f
  (using cached artifact)
Downloading rofl-container runtime artifact...
  URI: https://github.com/oasisprotocol/oasis-sdk/releases/download/rofl-containers%2Fv0.8.0/rofl-containers#08eb5bbe5df26af276d9a72e9fd7353b3a90b7d27e1cf33e276a82dfd551eec6
  Hash: 08eb5bbe5df26af276d9a72e9fd7353b3a90b7d27e1cf33e276a82dfd551eec6
  (using cached artifact)
Downloading compose.yaml artifact...
  URI: compose.yaml
Validating compose file...
Preparing stage 2 root filesystem...
Unpacking template...
Adding runtime as init...
Runtime hash: 08eb5bbe5df26af276d9a72e9fd7353b3a90b7d27e1cf33e276a82dfd551eec6
Adding extra files...
Creating squashfs filesystem...
Creating dm-verity hash tree...
Creating ORC bundle...
ROFL app built and bundle written to 'simpler-demo-rofl.default.orc'.
Computing enclave identity...
Run `oasis rofl update` to update your ROFL app's on-chain configuration.
$ [+18.36s] $ oasis rofl update
Unlock your account.
? Passphrase:
You are about to sign the following transaction:
Format: plain
Method: rofl.Update
Body:
  {
    "id": "rofl1qptr7radc5yyw3ph58s4ff0wz3957hr47qlqmqfj",
    "policy": {
      "quotes": {
        "pcs": {
          "tcb_validity_period": 30,
          "min_tcb_evaluation_data_number": 18,
          "tdx": {}
        }
      },
      "enclaves": [
        "ehYky9+8dHLqYrMX0qkubYLORtL2ShxzZUipGRtDu1sAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==",
        "APS1+RexZjlqr/+fhu6Y0wKMjf435RbguLj0STB3vyEAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=="
      ],
      "endorsements": [
        {
          "any": {}
        }
      ],
      "fees": 2,
      "max_expiration": 3
    },
    "admin": "oasis1qqxn8grn66l7tg0xgyd7qve4wuu3me6zegnm233j",
    "metadata": {
      "net.oasis.rofl.license": "Apache-2.0",
      "net.oasis.rofl.name": "simpler-demo-rofl",
      "net.oasis.rofl.repository": "https://github.com/lukaw3d/simpler-demo-rofl",
      "net.oasis.rofl.version": "0.1.1"
    },
    "secrets": {
      "MESSAGE": "pGJwa1ggLnFAa28I5oGUfdcDSyx7WZPHylsy/oKJ3MoWP+lce0hkbmFtZVcRU8JimgwVKCVU5/IfBCNQhgOay9od7WVub25jZU/KZqzgHYtN5qwvIec/6tNldmFsdWVVI8nI9vV4+ARLJM7d5gpngLsUzw6h"
    }
  }
Authorized signer(s):
  1. AyRQI2eSfhfmrwvby9lKwWPZO8RickGz9APC9+VmGJaG (secp256k1eth)
     Nonce: 85
Fee:
  Amount: 0.0122346 TEST
  Gas limit: 122346
  (gas price: 0.0000001 TEST per gas unit)

Network:  testnet
ParaTime: sapphire
Account:  a
? Sign this transaction? Yes
(In case you are using a hardware-based signer you may need to confirm on device.)
Broadcasting transaction...
Transaction included in block successfully.
Round:            14119757
Transaction hash: 13081a54c919e03c2c6fef55275c4709274b62cb76ef1f8f01ea15e0ca1e18a2
Execution successful.
$ [+9.11s] $ oasis rofl deploy
Downloading compose.yaml artifact...
  URI: compose.yaml
Using provider: oasis1qp2ens0hsp7gh23wajxa4hpetkdek3swyyulyrmz (oasis1qp2ens0hsp7gh23wajxa4hpetkdek3swyyulyrmz)
Unlock your account.
? Passphrase:
Pushing ROFL app to OCI repository 'rofl.sh/102c812e-b570-4626-9592-2b4783079372:1761628787'...
Pushing... 100.00% [#################################################] 84.65 MiB
No pre-existing machine configured, creating a new one...
Taking offer:
- playground_short [0000000000000003]
  TEE: tdx | Memory: 4096 MiB | vCPUs: 2 | Storage: 19.53 GiB
  Note: ⚠️ Testnet ROFLs only. Do not use in production! ⚠️
  Description:
    Demo machine suitable for oracles, AI agents and light-weight web apps.
    If you are running a local LLM, make sure it fits main memory (e.g.
    gemma3:1b, deepseek-r1:1.5b)!
  Price: 5.0 TEST/hour
Selected per-hour pricing term, total price is 5.0 TEST.
WARNING: Machine rental is non-refundable. You will not get a refund for the already paid term if you cancel.
You are about to sign the following transaction:
Format: plain
Method: roflmarket.InstanceCreate
Body:
  {
    "provider": "oasis1qp2ens0hsp7gh23wajxa4hpetkdek3swyyulyrmz",
    "offer": "0000000000000003",
    "deployment": {
      "app_id": "rofl1qptr7radc5yyw3ph58s4ff0wz3957hr47qlqmqfj",
      "manifest_hash": "b78492f830ce91c009c9d7fa5caac0e42de4c310b89f38db13bbbdc5c71a12b3",
      "metadata": {
        "net.oasis.deployment.orc.ref": "rofl.sh/102c812e-b570-4626-9592-2b4783079372:1761628787@sha256:2c3fec6a28dd357e34ec81d3cfc339c6a6e309e3dfd30fe750dc1b8b9e1da2d7"
      }
    },
    "term": 1,
    "term_count": 1
  }
Authorized signer(s):
  1. AyRQI2eSfhfmrwvby9lKwWPZO8RickGz9APC9+VmGJaG (secp256k1eth)
     Nonce: 86
Fee:
  Amount: 0.0121927 TEST
  Gas limit: 121927
  (gas price: 0.0000001 TEST per gas unit)

Network:  testnet
ParaTime: sapphire
Account:  a
? Sign this transaction? Yes
(In case you are using a hardware-based signer you may need to confirm on device.)
Broadcasting transaction...
Transaction included in block successfully.
Round:            14119782
Transaction hash: 752f37d7a53b5eb704950909baa8c40a3eb1edb9d65d5334356d004483604dd3
Execution successful.
Created machine: 00000000000003a5
Deployment into machine scheduled.
This machine expires on 2025-10-28 07:21:28 +0100 CET. Use `oasis rofl machine top-up` to extend it.
Use `oasis rofl machine show` to check status.
$ [+114.72s] $ oasis rofl machine show
Downloading compose.yaml artifact...
  URI: compose.yaml
Name:       default
Provider:   oasis1qp2ens0hsp7gh23wajxa4hpetkdek3swyyulyrmz
ID:         00000000000003a5
Offer:      0000000000000003
Status:     created
Creator:    oasis1qqxn8grn66l7tg0xgyd7qve4wuu3me6zegnm233j
Admin:      oasis1qqxn8grn66l7tg0xgyd7qve4wuu3me6zegnm233j
Node ID:    <none>
Created at: 2025-10-28 06:21:28 +0100 CET
Updated at: 2025-10-28 06:21:28 +0100 CET
Paid until: 2025-10-28 07:21:28 +0100 CET
Resources:
  TEE:     Intel TDX
  Memory:  4096 MiB
  vCPUs:   2
  Storage: 20000 MiB
Deployment:
  App ID: rofl1qptr7radc5yyw3ph58s4ff0wz3957hr47qlqmqfj
  Metadata:
    net.oasis.deployment.orc.ref: rofl.sh/102c812e-b570-4626-9592-2b4783079372:1761628787@sha256:2c3fec6a28dd357e34ec81d3cfc339c6a6e309e3dfd30fe750dc1b8b9e1da2d7
Commands:
  <no queued commands>
$ [+.32s] $ oasis rofl machine show
Downloading compose.yaml artifact...
  URI: compose.yaml
Name:       default
Provider:   oasis1qp2ens0hsp7gh23wajxa4hpetkdek3swyyulyrmz
ID:         00000000000003a5
Offer:      0000000000000003
Status:     accepted
Creator:    oasis1qqxn8grn66l7tg0xgyd7qve4wuu3me6zegnm233j
Admin:      oasis1qqxn8grn66l7tg0xgyd7qve4wuu3me6zegnm233j
Node ID:    1owPK3eT21k0ajRG7VfHRgp4JPXobCQtzuglz6ZSJis=
Created at: 2025-10-28 06:21:28 +0100 CET
Updated at: 2025-10-28 06:22:02 +0100 CET
Paid until: 2025-10-28 07:21:28 +0100 CET
Proxy:
  Domain: m933.opf-testnet-rofl-25.rofl.app
  Ports from compose file:
    8000 (echo): https://p8000.m933.opf-testnet-rofl-25.rofl.app
Metadata:
  net.oasis.scheduler.rak: C5ORSi6S/NdrgXrPL1vJiVLztmxrw/ThOJFHACdfxfw=
Resources:
  TEE:     Intel TDX
  Memory:  4096 MiB
  vCPUs:   2
  Storage: 20000 MiB
Deployment:
  App ID: rofl1qptr7radc5yyw3ph58s4ff0wz3957hr47qlqmqfj
  Metadata:
    net.oasis.deployment.orc.ref: rofl.sh/102c812e-b570-4626-9592-2b4783079372:1761628787@sha256:2c3fec6a28dd357e34ec81d3cfc339c6a6e309e3dfd30fe750dc1b8b9e1da2d7
Commands:
  <no queued commands>

# open https://p8000.m933.opf-testnet-rofl-25.rofl.app/attempt
# see "msg 1http://p8000.m933.opf-testnet-rofl-25.rofl.app/attempt" in https://explorer.dev.oasis.io/testnet/sapphire/address/0x5d683b980615A7A60B3cFf3DFC338A9985278fF3/events#events
```

</details>


## Documentation

See [the ROFL documentation] for more details about ROFL-specific features
available to ROFL apps and on how to deploy the apps.

[the ROFL documentation]: https://docs.oasis.io/build/rofl
