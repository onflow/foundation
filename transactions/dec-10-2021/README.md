# Transfer FLOW

> December 10th, 2021

This transaction transfers a total of 60362.0 FLOW to account 0x07c48471ca70a25c for the purpose of distributing payments to [developers who participated in FLIP Fest](https://github.com/onflow/flip-fest/blob/main/winners.md).

## Build

```sh
flow transactions build ./templates/transferFLOW.cdc \
  --network mainnet \
  --arg UFix64:60362.0 \
  --arg Address:0x07c48471ca70a25c \
  --proposer 0x89c1608db1c451ee \
  --proposer-key-index 0 \
  --authorizer 0x89c1608db1c451ee \
  --payer 0x89c1608db1c451ee \
  -x payload \
  --save ./transactions/dec-10-2021/transfer-flow-dec-10.rlp
```

## Scott Signs

```sh
flow transactions sign ./transactions/dec-10-2021/transfer-flow-dec-10.rlp --signer scott --filter payload --save ./transactions/dec-10-2021/transfer-flow-dec-10-sig-1.rlp
```

## Jonathan Signs

```sh
flow transactions sign ./transactions/dec-10-2021/transfer-flow-dec-10-sig-1.rlp --signer jonathan --filter payload --save ./transactions/dec-10-2021/transfer-flow-dec-10-sig-2.rlp
```


## Somebody Submits

```sh
flow transactions send-signed --network mainnet ./transactions/dec-10-2021/transfer-flow-dec-10-sig-2.rlp
```
