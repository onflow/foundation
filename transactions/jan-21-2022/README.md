# Transfer FLOW

> January 21st, 2022

This transaction transfers a total of 210,305.68 FLOW to account 0x07c48471ca70a25c for the purpose of distributing payments to promote, expand education and encourage the adoption of FLOW tokens and the Flow Blockchain and their related infrastructure and ecosystems.

## Build

```sh
flow transactions build ./templates/transferFLOW.cdc \
  --network mainnet \
  --arg UFix64:210305.68 \
  --arg Address:0x07c48471ca70a25c \
  --proposer 0x89c1608db1c451ee \
  --proposer-key-index 0 \
  --authorizer 0x89c1608db1c451ee \
  --payer 0x89c1608db1c451ee \
  -x payload \
  --save ./transactions/jan-21-2022/transfer-flow-jan-21.rlp
```

## Scott Signs

```sh
flow transactions sign ./transactions/jan-21-2022/transfer-flow-jan-21.rlp --signer scott --filter payload --save ./transactions/jan-21-2022/transfer-flow-jan-21-sig-1.rlp
```

## Jonathan Signs

```sh
flow transactions sign ./transactions/jan-21-2022/transfer-flow-jan-21-sig-1.rlp --signer jonathan --filter payload --save ./transactions/jan-21-2022/transfer-flow-jan-21-sig-2.rlp
```

## Somebody Submits

```sh
flow transactions send-signed --network mainnet ./transactions/jan-21-2022/transfer-flow-jan-21-sig-2.rlp
```

Result: https://flowscan.org/transaction/8931a89c2ee73b10e0606a297e0a1461c155888bb7f3769f571634bb1b046f39
