# Demo ROFL App

This is a demo ROFL app that runs in TDX using Podman containers defined in a
`compose.yaml` file.

docker/app.sh posts a message to 0x5d683b980615A7A60B3cFf3DFC338A9985278fF3 when
ROFL app runs.

https://explorer.oasis.io/testnet/sapphire/address/0x5d683b980615A7A60B3cFf3DFC338A9985278fF3
is Echo.sol - it allows anyone to post a message. So you don't need to deploy+verify it yourself.

Do:
```sh
# remove compose.yaml > services.echo.image
docker compose build
docker compose push
# add compose.yaml > services.echo.image

oasis rofl create --network testnet
oasis rofl secret rm MESSAGE
echo -n "msg 1" | oasis rofl secret set MESSAGE -
# message is stored in secrets, but then intentionally expose it
# secret -> rofl app -> encrypted contract call -> unencrypted event emit
oasis rofl build
oasis rofl update
oasis rofl deploy
# Wait 5 min
# See your message at https://explorer.oasis.io/testnet/sapphire/address/0x5d683b980615A7A60B3cFf3DFC338A9985278fF3/events#events
oasis rofl remove
# Get back staked tokens
```


## Documentation

See [the ROFL documentation] for more details about ROFL-specific features
available to ROFL apps and on how to deploy the apps.

[the ROFL documentation]: https://docs.oasis.io/build/rofl
