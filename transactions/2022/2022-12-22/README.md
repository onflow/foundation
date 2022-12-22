# Transfer FLOW

> December 22nd, 2022

This transaction transfers a total of 750000.0 FLOW to account 0xd5234abb66587ac5 for the purpose of distributing payments to promote, expand education and encourage the adoption of FLOW tokens and the Flow Blockchain and their related infrastructure and ecosystems.

## Build

```sh
flow transactions build ./templates/transferFLOW.cdc \
  --network mainnet \
  --arg UFix64:750000.0 \
  --arg Address:0xd5234abb66587ac5 \
  --proposer 0x89c1608db1c451ee \
  --proposer-key-index 1 \
  --authorizer 0x89c1608db1c451ee \
  --payer 0x89c1608db1c451ee \
  -x payload \
  --save ./transactions/2022/2022-12-22/transfer-flow-dec-22.rlp
```

## Kristin Signs

```sh
flow transactions sign ./transactions/2022/2022-12-22/transfer-flow-dec-22.rlp --signer kristin --config-path flow-new.json --filter payload --save ./transactions/2022/2022-12-22/transfer-flow-dec-22-sig-1.rlp
```

## Jonathan Signs

```sh0
flow transactions sign ./transactions/2022/2022-12-22/transfer-flow-dec-22-sig-1.rlp --signer jonathan --filter payload --save ./transactions/2022/2022-12-22/transfer-flow-dec-22-sig-2.rlp
```

## Somebody Submits

```sh
flow transactions send-signed --network mainnet ./transactions/2022/2022-12-22/transfer-flow-dec-22-sig-2.rlp
```

Result: https://flowscan.org/transaction/
