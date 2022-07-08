# Add Key

> July 8th, 2022

This transaction adds a new key to the Foundation account, under the control of Stephanie Lemmerman

## Build

```sh
flow transactions build ./templates/addKey.cdc \
  --network mainnet \
  --arg String: \
  --proposer 0x89c1608db1c451ee \
  --proposer-key-index 0 \
  --authorizer 0x89c1608db1c451ee \
  --payer 0x89c1608db1c451ee \
  -x payload \
  --save ./transactions/2022/2022-07-08/add-key-july-08.rlp
```

## Scott Signs

```sh
flow transactions sign ./transactions/2022/2022-07-08/add-key-july-08.rlp --signer scott --filter payload --save ./transactions/2022/2022-07-08/add-key-july-08-sig-1.rlp
```

## Jonathan Signs

```sh
flow transactions sign ./transactions/2022/2022-07-08/add-key-july-08-sig-1.rlp --signer jonathan --filter payload --save ./transactions/2022/2022-07-08/add-key-july-08-sig-2.rlp
```

## Somebody Submits

```sh
flow transactions send-signed --network mainnet ./transactions/2022/2022-07-08/add-key-july-08-sig-2.rlp
```

Result: https://flowscan.org/transaction/
