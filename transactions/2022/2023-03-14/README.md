# Add Key

> March 13th, 2023

This transaction adds a new key to the Foundation account, under the control of Alex Shih.

## Multi Sig App Method
[Add Key](https://flow-multisig-git-service-account-onflow.vercel.app/mainnet?type=foundation&name=addKey.cdc&param=%5B%5D&acct=0x89c1608db1c451ee&limit=9999)

## Old CLI Method

### Build

```sh
flow transactions build ./templates/addKey.cdc \
  --network mainnet \
  --arg String: \
  --proposer 0x89c1608db1c451ee \
  --proposer-key-index 1 \
  --authorizer 0x89c1608db1c451ee \
  --payer 0x89c1608db1c451ee \
  -x payload \
  --save ./transactions/2023/2023-03-14/add-key-march-14.rlp
```

### Stephanie Signs

```sh
flow transactions sign ./transactions/2023/2023-03-14/add-key-march-14.rlp --signer stephanie --config-path flow-new.json --filter payload --save ./transactions/2023/2023-03-14/add-key-march-14-sig-1.rlp
```

### Jonathan Signs

```sh
flow transactions sign ./transactions/2023/2023-03-14/add-key-march-14-sig-1.rlp --signer jonathan --filter payload --save ./transactions/2023/2023-03-14/add-key-march-14-sig-2.rlp
```

### Somebody Submits

```sh
flow transactions send-signed --network mainnet ./transactions/2023/2023-03-14/add-key-march-14-sig-2.rlp
```

Result: https://flowscan.org/transaction/
