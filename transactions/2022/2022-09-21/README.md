# Transfer FLOW

> September 29th, 2022

This transaction transfers a total of 10500.0 FLOW to account 0x07c48471ca70a25c for the purpose of distributing payments to promote, expand education and encourage the adoption of FLOW tokens and the Flow Blockchain and their related infrastructure and ecosystems.

## Build

```sh
flow transactions build ./templates/transferFLOW.cdc \
  --network mainnet \
  --arg UFix64:10500.0 \
  --arg Address:0x07c48471ca70a25c \
  --proposer 0x89c1608db1c451ee \
  --proposer-key-index 1 \
  --authorizer 0x89c1608db1c451ee \
  --payer 0x89c1608db1c451ee \
  -x payload \
  --save ./transactions/2022/2022-09-21/transfer-flow-sept-21.rlp
```

## Kristin Signs

```sh
flow transactions sign ./transactions/2022/2022-09-21/transfer-flow-sept-21.rlp --signer kristin --config-path flow-new.json --filter payload --save ./transactions/2022/2022-09-21/transfer-flow-sept-21-sig-1.rlp
```

## Jonathan Signs

```sh
flow transactions sign ./transactions/2022/2022-09-21/transfer-flow-sept-21-sig-1.rlp --signer jonathan --filter payload --save ./transactions/2022/2022-09-21/transfer-flow-sept-21-sig-2.rlp
```

## Somebody Submits

```sh
flow transactions send-signed --network mainnet ./transactions/2022/2022-09-21/transfer-flow-sept-21-sig-2.rlp
```

Result: https://flowscan.org/transaction/c123dc05ccfb8dd9828bec69b0232a9712cb54ddae6bddb4a83dc58eac42a63a
