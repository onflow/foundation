# Add Key

> March 13th, 2023

This transaction adds a new key to the Foundation account, under the control of Alex Shih.

## Multi Sig App Method
[Add Key](https://flow-multisig-git-service-account-onflow.vercel.app/mainnet?type=foundation&name=addKey.cdc&param=%5B%7B%22type%22:%22String%22,%22value%22:%22f847b840c9e89b858625076f26dc6e53b413062d792a64355a8a21e432205308f647bda01b1a1c74f6365273226b45935aa0edbce2afdb7f2ebd7463b95eee8becb22bb402018201f4%22%7D%5D&acct=0x89c1608db1c451ee&limit=9999)

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
