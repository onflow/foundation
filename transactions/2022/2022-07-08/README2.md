# Remove Key

> July 8th, 2022

This transaction removes a key index 0 to the Foundation account, under the control of Scott Shipman

## Build

```sh
flow transactions build ./templates/removeKey.cdc \
  --network mainnet \
  --arg Int:0 \
  --proposer 0x89c1608db1c451ee \
  --proposer-key-index 1 \
  --authorizer 0x89c1608db1c451ee \
  --payer 0x89c1608db1c451ee \
  -x payload \
  --save ./transactions/2022/2022-07-08/remove-key-july-08.rlp
```

## Stephanie Signs

```sh
flow transactions sign ./transactions/2022/2022-07-08/remove-key-july-08.rlp --signer stephanie --config-path flow-stephanie.json --filter payload --save ./transactions/2022/2022-07-08/remove-key-july-08-sig-1.rlp
```

## Jonathan Signs

```sh
flow transactions sign ./transactions/2022/2022-07-08/remove-key-july-08-sig-1.rlp --signer jonathan --filter payload --save ./transactions/2022/2022-07-08/remove-key-july-08-sig-2.rlp
```

## Somebody Submits

```sh
flow transactions send-signed --network mainnet ./transactions/2022/2022-07-08/remove-key-july-08-sig-2.rlp
```

Result: https://flowscan.org/transaction/b97fa216ea6b9e0ba36bc14df4a71a31b9e55bc513157836aafd7d8c342882f6
