# Transfer FLOW

> May 9th, 2022

This transaction transfers a total of 8500.0 FLOW to account 0x07c48471ca70a25c for the purpose of distributing payments to promote, expand education and encourage the adoption of FLOW tokens and the Flow Blockchain and their related infrastructure and ecosystems.

## Build

```sh
flow transactions build ./templates/transferFLOW.cdc \
  --network mainnet \
  --arg UFix64:8500.0 \
  --arg Address:0x07c48471ca70a25c \
  --proposer 0x89c1608db1c451ee \
  --proposer-key-index 0 \
  --authorizer 0x89c1608db1c451ee \
  --payer 0x89c1608db1c451ee \
  -x payload \
  --save ./transactions/2022/2022-05-09/transfer-flow-may-9.rlp
```

## Scott Signs

```sh
flow transactions sign ./transactions/2022/2022-05-09/transfer-flow-may-9.rlp --signer scott --filter payload --save ./transactions/2022/2022-05-09/transfer-flow-may-9-sig-1.rlp
```

## Jonathan Signs

```sh
flow transactions sign ./transactions/2022/2022-05-09/transfer-flow-may-9-sig-1.rlp --signer jonathan --filter payload --save ./transactions/2022/2022-05-09/transfer-flow-may-9-sig-2.rlp
```

## Somebody Submits

```sh
flow transactions send-signed --network mainnet ./transactions/2022/2022-05-09/transfer-flow-may-9-sig-2.rlp
```

Result: https://flowscan.org/transaction/
