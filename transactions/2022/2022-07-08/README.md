# Add Key

> July 8th, 2022

This transaction adds a new key to the Foundation account, under the control of Stephanie Lemmerman

## Build

```sh
flow transactions build ./templates/addKey.cdc \
  --network mainnet \
  --arg String:f847b840ad01d02c78194bd07622c43f57c9f7a21390ade58ef26de0d5b9a35325b7526b30c4a429c324c3c67474919966a3047527cd2a10daf7893542dbd554a13d447002018201f4 \
  --proposer 0x89c1608db1c451ee \
  --proposer-key-index 0 \
  --authorizer 0x89c1608db1c451ee \
  --payer 0x89c1608db1c451ee \
  -x payload \
  --save ./transactions/2022/2022-07-08/add-key-july-08.rlp
```

## Scott Signs

```sh
flow transactions sign ./transactions/2022/2022-07-08/add-key-july-08.rlp --signer scott --filter payload --save ./transactions/2022/2022-07-08/add-key-july-08-sig-1.rlp
```

## Jonathan Signs

```sh
flow transactions sign ./transactions/2022/2022-07-08/add-key-july-08-sig-1.rlp --signer jonathan --filter payload --save ./transactions/2022/2022-07-08/add-key-july-08-sig-2.rlp
```

## Somebody Submits

```sh
flow transactions send-signed --network mainnet ./transactions/2022/2022-07-08/add-key-july-08-sig-2.rlp
```

Result: https://flowscan.org/transaction/
