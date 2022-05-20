# Transfer FLOW

> May 20th, 2022

This transaction transfers a total of 386928.90724017 FLOW to account 0x07c48471ca70a25c for the purpose of distributing payments to promote, expand education and encourage the adoption of FLOW tokens and the Flow Blockchain and their related infrastructure and ecosystems.

## Build

```sh
flow transactions build ./templates/transferFLOW.cdc \
  --network mainnet \
  --arg UFix64:386928.90724017 \
  --arg Address:0x07c48471ca70a25c \
  --proposer 0x89c1608db1c451ee \
  --proposer-key-index 0 \
  --authorizer 0x89c1608db1c451ee \
  --payer 0x89c1608db1c451ee \
  -x payload \
  --save ./transactions/2022/2022-05-20/transfer-flow-may-20.rlp
```

## Scott Signs

```sh
flow transactions sign ./transactions/2022/2022-05-20/transfer-flow-may-20.rlp --signer scott --filter payload --save ./transactions/2022/2022-05-20/transfer-flow-may-20-sig-1.rlp
```

## Jonathan Signs

```sh
flow transactions sign ./transactions/2022/2022-05-20/transfer-flow-may-20-sig-1.rlp --signer jonathan --filter payload --save ./transactions/2022/2022-05-20/transfer-flow-may-20-sig-2.rlp
```

## Somebody Submits

```sh
flow transactions send-signed --network mainnet ./transactions/2022/2022-05-20/transfer-flow-may-20-sig-2.rlp
```

Result: https://flowscan.org/transaction/04cf660018b4afd791fc643d8473a83cd79d3f2a28061a0c303d48f8d083e29a
