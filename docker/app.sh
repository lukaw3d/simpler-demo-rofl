#!/bin/sh

# Format calldata
MESSAGE="ab dfg dfkogdfk ogk ortz ortzk otzki54 6ki54o0 6540o6 o05kg"
# emitMessage("ab") should encode as 0x2ac0df26000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000026162000000000000000000000000000000000000000000000000000000000000
MESSAGE="${MESSAGE:0:32}" # this bash abi encoding doesn't work correctly for long strings
method="2ac0df26" # keccak256("emitMessage(string)")
stringtype="0000000000000000000000000000000000000000000000000000000000000020"
stringlen=$(printf "%064x" "$(echo -n "${MESSAGE}" | wc -c)")
stringval=$(printf "%s" "$(printf "%-64s" "$(echo -n "${MESSAGE}" | xxd -p | tr -d '\n')" | tr ' ' '0')")
data="${method}${stringtype}${stringlen}${stringval}"

# Submit it to the Sapphire contract Echo.sol on testnet
curl -s \
	--json '{"tx": {"kind": "eth", "data": {"gas_limit": 200000, "to": "'${CONTRACT_ADDRESS#0x}'", "value": 0, "data": "'${data#0x}'"}}}' \
	--unix-socket /run/rofl-appd.sock \
		http://localhost/rofl/v1/tx/sign-submit >/dev/null
