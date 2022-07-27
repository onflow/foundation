# Add Key

> July 27th, 2022

This transaction adds a new key to the Foundation account, under the control of Kristin Smith.

## Build

```sh
flow transactions build ./templates/addKey.cdc \
  --network mainnet \
  --arg String:f847b84075fc3ffa297ef1a3116aff18ac9d123d07e46fd170337acdef502432ed6e6749888e112934e669f714108905a87b38d718aac63c63a7a6a4a5057086dd2e9e8603018201f4 \
  --proposer 0x89c1608db1c451ee \
  --proposer-key-index 1 \
  --authorizer 0x89c1608db1c451ee \
  --payer 0x89c1608db1c451ee \
  -x payload \
  --save ./transactions/2022/2022-07-27/add-key-july-27.rlp
```

## Stephanie Signs

```sh
flow transactions sign ./transactions/2022/2022-07-27/add-key-july-27.rlp --signer stephanie --config-path flow-new.json --filter payload --save ./transactions/2022/2022-07-27/add-key-july-27-sig-1.rlp
```

## Jonathan Signs

```sh
flow transactions sign ./transactions/2022/2022-07-27/add-key-july-27-sig-1.rlp --signer jonathan --filter payload --save ./transactions/2022/2022-07-27/add-key-july-27-sig-2.rlp
```

## Somebody Submits

```sh
flow transactions send-signed --network mainnet ./transactions/2022/2022-07-27/add-key-july-27-sig-2.rlp
```

Result: https://flowscan.org/transaction/
