# Flow Foundation Account (Dry Run)

> October 15th, 2021

## Install

```sh
brew install flow-cli
```

## Build

```sh
flow transactions build ./templates/hello.cdc \
  --network mainnet \
  --proposer 0x89c1608db1c451ee \
  --proposer-key-index 0 \
  --authorizer 0x89c1608db1c451ee \
  --payer 0x89c1608db1c451ee \
  -x payload \
  --save ./transactions/dry-run/oct-15-2021/hello1.rlp
```

## Scott Signs

```sh
flow transactions sign ./transactions/dry-run/oct-15-2021/hello1.rlp --signer scott --filter payload --save ./transactions/dry-run/oct-15-2021/hello2.rlp
```

## Jonathan Signs

```sh
flow transactions sign ./transactions/dry-run/oct-15-2021/hello2.rlp --signer jonathan --filter payload --save ./transactions/dry-run/oct-15-2021/hello3.rlp
```


## Somebody Submits

```sh
flow transactions send-signed --network mainnet ./transactions/dry-run/oct-15-2021/hello3.rlp
```
