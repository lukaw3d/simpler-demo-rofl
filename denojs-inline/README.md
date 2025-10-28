# Demo ROFL App

This is a demo ROFL app that runs in TDX using Podman containers defined in a
`compose.yaml` file.

compose.yaml > command > deno posts a message to 0x5d683b980615A7A60B3cFf3DFC338A9985278fF3 when
ROFL app runs.

https://explorer.oasis.io/testnet/sapphire/address/0x5d683b980615A7A60B3cFf3DFC338A9985278fF3
is Echo.sol - this contract allows anyone to post a message. So you don't need to deploy+verify it yourself.

Do:
```sh
oasis rofl create --network testnet
oasis rofl secret rm MESSAGE
echo -n "msg 1" | oasis rofl secret set MESSAGE -
# message is stored in secrets, but then intentionally expose it
# secret -> rofl app -> encrypted contract call -> unencrypted event emit
oasis rofl build
oasis rofl update
oasis rofl deploy
# Wait 2 minutes
# See your message at https://explorer.oasis.io/testnet/sapphire/address/0x5d683b980615A7A60B3cFf3DFC338A9985278fF3/events#events
oasis rofl remove
# Get back staked tokens
```

<details>
<summary>Output</summary>

```console
$ oasis rofl create --network testnet
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
     Nonce: 27
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
Round:            12226997
Transaction hash: 3b939f580c91b2c6fed723c7adc2bf821ac45936f88fe1ec82a6885c2132229d
Execution successful.
Created ROFL app: rofl1qqsw0r2skx84km3znyd7wwt6qr9hjqpntyfmy8fu
Run `oasis rofl build` to build your ROFL app.


$ oasis rofl secret rm MESSAGE
Error: secret named 'MESSAGE' does not exist for deployment 'default'


$ echo -n "msg 1" | oasis rofl secret set MESSAGE -
Run `oasis rofl update` to update your ROFL app's on-chain configuration.


$ oasis rofl update
Unlock your account.
? Passphrase:
You are about to sign the following transaction:
Format: plain
Method: rofl.Update
Body:
  {
    "id": "rofl1qqsw0r2skx84km3znyd7wwt6qr9hjqpntyfmy8fu",
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
    "admin": "oasis1qqxn8grn66l7tg0xgyd7qve4wuu3me6zegnm233j",
    "metadata": {
      "net.oasis.rofl.license": "Apache-2.0",
      "net.oasis.rofl.name": "simpler-demo-rofl",
      "net.oasis.rofl.repository": "https://github.com/lukaw3d/simpler-demo-rofl",
      "net.oasis.rofl.version": "0.1.1"
    },
    "secrets": {
      "MESSAGE": "pGJwa1ggm6T8hALhr0dx3pF5JKE+YPaVkbatCs4VJ1NmaAbJAllkbmFtZVe752snVqtNoFpakQ9lIU79buN02cDwAWVub25jZU+sALzDhPpX3vbO3wefY2lldmFsdWVV2yVhJDFCzKUPAC0DM4MTZfpcj7Gd"
    }
  }
Authorized signer(s):
  1. AyRQI2eSfhfmrwvby9lKwWPZO8RickGz9APC9+VmGJaG (secp256k1eth)
     Nonce: 28
Fee:
  Amount: 0.012213 TEST
  Gas limit: 122130
  (gas price: 0.0000001 TEST per gas unit)

Network:  testnet
ParaTime: sapphire
Account:  a
? Sign this transaction? Yes
(In case you are using a hardware-based signer you may need to confirm on device.)
Broadcasting transaction...
Transaction included in block successfully.
Round:            12227010
Transaction hash: 05573ee8cbcf7bbd1bcd46348bd7fea2e015d0f595ba7fb22e65f1f0c8215c87
Execution successful.


$ oasis rofl build
Building a ROFL application...
Deployment: default
Network:    testnet
ParaTime:   sapphire
Debug:      false
App ID:     rofl1qqsw0r2skx84km3znyd7wwt6qr9hjqpntyfmy8fu
Name:       simpler-demo-rofl
Version:    0.1.1
TEE:        tdx
Kind:       container
Building a container-based TDX ROFL application...
Downloading firmware artifact...
  URI: https://github.com/oasisprotocol/oasis-boot/releases/download/v0.5.0/ovmf.tdx.fd#db47100a7d6a0c1f6983be224137c3f8d7cb09b63bb1c7a5ee7829d8e994a42f
  Hash: db47100a7d6a0c1f6983be224137c3f8d7cb09b63bb1c7a5ee7829d8e994a42f
  (using cached artifact)
Downloading kernel artifact...
  URI: https://github.com/oasisprotocol/oasis-boot/releases/download/v0.5.0/stage1.bin#23877530413a661e9187aad2eccfc9660fc4f1a864a1fbad2f6c7d43512071ca
  Hash: 23877530413a661e9187aad2eccfc9660fc4f1a864a1fbad2f6c7d43512071ca
  (using cached artifact)
Downloading stage 2 template artifact...
  URI: https://github.com/oasisprotocol/oasis-boot/releases/download/v0.5.0/stage2-podman.tar.bz2#631349bef06990dd6ae882812a0420f4b35f87f9fe945b274bcfb10fc08c4ea3
  Hash: 631349bef06990dd6ae882812a0420f4b35f87f9fe945b274bcfb10fc08c4ea3
  (using cached artifact)
Downloading rofl-container runtime artifact...
  URI: https://github.com/oasisprotocol/oasis-sdk/releases/download/rofl-containers%2Fv0.5.1/rofl-containers#9afa712b939528d758294bf49181466fc2066bbe507f92777ddc3bce8af6ee37
  Hash: 9afa712b939528d758294bf49181466fc2066bbe507f92777ddc3bce8af6ee37
  (using cached artifact)
Downloading compose.yaml artifact...
  URI: compose.yaml
Validating compose file...
WARN[0000] The "MESSAGE" variable is not set. Defaulting to a blank string.
Preparing stage 2 root filesystem...
Unpacking template...
Adding runtime as init...
Runtime hash: 9afa712b939528d758294bf49181466fc2066bbe507f92777ddc3bce8af6ee37
Adding extra files...
Creating squashfs filesystem...
Creating dm-verity hash tree...
Creating ORC bundle...
ROFL app built and bundle written to 'simpler-demo-rofl.default.orc'.
Computing enclave identity...
Run `oasis rofl update` to update your ROFL app's on-chain configuration.


$ oasis rofl deploy
Error: Local enclave identities DIFFER from on-chain enclave identities! Run `oasis rofl update` first


$ oasis rofl update
Unlock your account.
? Passphrase:
You are about to sign the following transaction:
Format: plain
Method: rofl.Update
Body:
  {
    "id": "rofl1qqsw0r2skx84km3znyd7wwt6qr9hjqpntyfmy8fu",
    "policy": {
      "quotes": {
        "pcs": {
          "tcb_validity_period": 30,
          "min_tcb_evaluation_data_number": 18,
          "tdx": {}
        }
      },
      "enclaves": [
        "b2LhoxqTgzfmeAr7Cwr/z325QwH2fgG55GzZKqffVhAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==",
        "HerMpcNM6O3xrO6ygZRSFCPFsLCMOBo3gIAn5razCwQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=="
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
      "MESSAGE": "pGJwa1ggm6T8hALhr0dx3pF5JKE+YPaVkbatCs4VJ1NmaAbJAllkbmFtZVe752snVqtNoFpakQ9lIU79buN02cDwAWVub25jZU+sALzDhPpX3vbO3wefY2lldmFsdWVV2yVhJDFCzKUPAC0DM4MTZfpcj7Gd"
    }
  }
Authorized signer(s):
  1. AyRQI2eSfhfmrwvby9lKwWPZO8RickGz9APC9+VmGJaG (secp256k1eth)
     Nonce: 29
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
Round:            12227044
Transaction hash: e7901e879df754a29f304efa8e1f338bbc1307d213792a1dddfaae41a8651233
Execution successful.


$ oasis rofl deploy
Using provider: oasis1qp2ens0hsp7gh23wajxa4hpetkdek3swyyulyrmz (oasis1qp2ens0hsp7gh23wajxa4hpetkdek3swyyulyrmz)
Pushing ROFL app to OCI repository 'rofl.sh/b75a5740-63e9-4425-9ae7-521006eb27e4:1750479135'...
No pre-existing machine configured, creating a new one...
Taking offer: playground_short [0000000000000003]
Unlock your account.
? Passphrase:
You are about to sign the following transaction:
Format: plain
Method: roflmarket.InstanceCreate
Body:
  {
    "provider": "oasis1qp2ens0hsp7gh23wajxa4hpetkdek3swyyulyrmz",
    "offer": "0000000000000003",
    "deployment": {
      "app_id": "rofl1qqsw0r2skx84km3znyd7wwt6qr9hjqpntyfmy8fu",
      "manifest_hash": "4f449cda675e9c894a50696b9aaba7e071d1e8c99eb2c411334a7b1d53070934",
      "metadata": {
        "net.oasis.deployment.orc.ref": "rofl.sh/b75a5740-63e9-4425-9ae7-521006eb27e4:1750479135@sha256:fe18364bb8d710074be8ca32439bd60251d10e21ecaebb73a82b6ed9bc8e83e3"
      }
    },
    "term": 1,
    "term_count": 1
  }
Authorized signer(s):
  1. AyRQI2eSfhfmrwvby9lKwWPZO8RickGz9APC9+VmGJaG (secp256k1eth)
     Nonce: 30
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
Round:            12227049
Transaction hash: 66d8aaf693a4345c55c478affb2301d2732b7324066184097be53926eb8f048e
Error: Execution failed with error: module: accounts code: 2 message: accounts: insufficient balance
Tip: You can get TEST tokens at https://faucet.testnet.oasis.io or #dev-central at https://oasis.io/discord.


$ oasis rofl deploy
Using provider: oasis1qp2ens0hsp7gh23wajxa4hpetkdek3swyyulyrmz (oasis1qp2ens0hsp7gh23wajxa4hpetkdek3swyyulyrmz)
Pushing ROFL app to OCI repository 'rofl.sh/b75a5740-63e9-4425-9ae7-521006eb27e4:1750479135'...
No pre-existing machine configured, creating a new one...
Taking offer: playground_short [0000000000000003]
Unlock your account.
? Passphrase:
You are about to sign the following transaction:
Format: plain
Method: roflmarket.InstanceCreate
Body:
  {
    "provider": "oasis1qp2ens0hsp7gh23wajxa4hpetkdek3swyyulyrmz",
    "offer": "0000000000000003",
    "deployment": {
      "app_id": "rofl1qqsw0r2skx84km3znyd7wwt6qr9hjqpntyfmy8fu",
      "manifest_hash": "4f449cda675e9c894a50696b9aaba7e071d1e8c99eb2c411334a7b1d53070934",
      "metadata": {
        "net.oasis.deployment.orc.ref": "rofl.sh/b75a5740-63e9-4425-9ae7-521006eb27e4:1750479135@sha256:fe18364bb8d710074be8ca32439bd60251d10e21ecaebb73a82b6ed9bc8e83e3"
      }
    },
    "term": 1,
    "term_count": 1
  }
Authorized signer(s):
  1. AyRQI2eSfhfmrwvby9lKwWPZO8RickGz9APC9+VmGJaG (secp256k1eth)
     Nonce: 31
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
Round:            12227090
Transaction hash: c646e23d9e9c0ab7dc6adff09d359415c74f6ace0b45e9f12c2267c82678bb79
Execution successful.
Created machine: 00000000000000d0
Deployment into machine scheduled.
Use `oasis rofl machine show` to see status.


$ oasis rofl remove
Unlock your account.
? Passphrase:
You are about to sign the following transaction:
Format: plain
Method: rofl.Remove
Body:
  {
    "id": "rofl1qqsw0r2skx84km3znyd7wwt6qr9hjqpntyfmy8fu"
  }
Authorized signer(s):
  1. AyRQI2eSfhfmrwvby9lKwWPZO8RickGz9APC9+VmGJaG (secp256k1eth)
     Nonce: 32
Fee:
  Amount: 0.0013551 TEST
  Gas limit: 13551
  (gas price: 0.0000001 TEST per gas unit)

Network:  testnet
ParaTime: sapphire
Account:  a
? Sign this transaction? Yes
(In case you are using a hardware-based signer you may need to confirm on device.)
Broadcasting transaction...
Transaction included in block successfully.
Round:            12227094
Transaction hash: 5415cc8f899ad3b5fa47589305b46d1db2e6038ec449751f6b10cce6582c966d
Execution successful.
```

</details>


## Documentation

See [the ROFL documentation] for more details about ROFL-specific features
available to ROFL apps and on how to deploy the apps.

[the ROFL documentation]: https://docs.oasis.io/build/rofl
