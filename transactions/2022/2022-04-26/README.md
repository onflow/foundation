# Transfer FLOW

> April 26th, 2022

This transaction transfers a total of 8585.0 FLOW to account 0x07c48471ca70a25c for the purpose of distributing payments to promote, expand education and encourage the adoption of FLOW tokens and the Flow Blockchain and their related infrastructure and ecosystems.

## Build

```sh
flow transactions build ./templates/transferFLOW.cdc \
  --network mainnet \
  --arg UFix64:8585.0 \
  --arg Address:0x07c48471ca70a25c \
  --proposer 0x89c1608db1c451ee \
  --proposer-key-index 0 \
  --authorizer 0x89c1608db1c451ee \
  --payer 0x89c1608db1c451ee \
  -x payload \
  --save ./transactions/2022/2022-04-26/transfer-flow-apr-26.rlp
```

## Scott Signs

```sh
flow transactions sign ./transactions/2022/2022-04-26/transfer-flow-apr-26.rlp --signer scott --filter payload --save ./transactions/2022/2022-04-26/transfer-flow-apr-26-sig-1.rlp
```

## Jonathan Signs

```sh
flow transactions sign ./transactions/2022/2022-04-26/transfer-flow-apr-26-sig-1.rlp --signer jonathan --filter payload --save ./transactions/2022/2022-04-26/transfer-flow-apr-26-sig-2.rlp
```

## Somebody Submits

```sh
flow transactions send-signed --network mainnet ./transactions/2022/2022-04-26/transfer-flow-apr-26-sig-2.rlp
```

Result: 
