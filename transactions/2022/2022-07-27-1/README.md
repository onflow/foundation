# Remove Key

> July 27th, 2022

This transaction removes a key index 2 from the Foundation account, under the control of Stephanie Lemmerman. 

## Build

```sh
flow transactions build ./templates/removeKey.cdc \
  --network mainnet \
  --arg Int:2 \
  --proposer 0x89c1608db1c451ee \
  --proposer-key-index 1 \
  --authorizer 0x89c1608db1c451ee \
  --payer 0x89c1608db1c451ee \
  -x payload \
  --save ./transactions/2022/2022-07-27/remove-key-july-27.rlp
```

## Kristin Signs

```sh
flow transactions sign ./transactions/2022/2022-07-27/remove-key-july-27.rlp --signer kristin --config-path flow-new.json --filter payload --save ./transactions/2022/2022-07-27/remove-key-july-27-sig-1.rlp
```

## Jonathan Signs

```sh
flow transactions sign ./transactions/2022/2022-07-27/remove-key-july-27-sig-1.rlp --signer jonathan --filter payload --save ./transactions/2022/2022-07-27/remove-key-july-27-sig-2.rlp
```

## Somebody Submits

```sh
flow transactions send-signed --network mainnet ./transactions/2022/2022-07-27/remove-key-july-27-sig-2.rlp
```

Result: https://flowscan.org/transaction/
