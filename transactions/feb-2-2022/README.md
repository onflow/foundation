# Transfer FLOW

> February 2nd, 2022

This transaction transfers a total of 4686 FLOW to account 0x07c48471ca70a25c for the purpose of distributing payments to promote, expand education and encourage the adoption of FLOW tokens and the Flow Blockchain and their related infrastructure and ecosystems.

## Build

```sh
flow transactions build ./templates/transferFLOW.cdc \
  --network mainnet \
  --arg UFix64:4686.0 \
  --arg Address:0x07c48471ca70a25c \
  --proposer 0x89c1608db1c451ee \
  --proposer-key-index 0 \
  --authorizer 0x89c1608db1c451ee \
  --payer 0x89c1608db1c451ee \
  -x payload \
  --save ./transactions/feb-2-2022/transfer-flow-feb-2.rlp
```

## Scott Signs

```sh
flow transactions sign ./transactions/feb-2-2022/transfer-flow-feb-2.rlp --signer scott --filter payload --save ./transactions/feb-2-2022/transfer-flow-feb-2-sig-1.rlp
```

## Jonathan Signs

```sh
flow transactions sign ./transactions/feb-2-2022/transfer-flow-feb-2-sig-1.rlp --signer jonathan --filter payload --save ./transactions/feb-2-2022/transfer-flow-feb-2-sig-2.rlp
```

## Somebody Submits

```sh
flow transactions send-signed --network mainnet ./transactions/feb-2-2022/transfer-flow-feb-2-sig-2.rlp
```

Result: https://flowscan.org/transaction/
