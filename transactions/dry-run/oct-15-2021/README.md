# Flow Foundation Account

## Install

```sh
brew install flow-cli
```

## Build

```sh
flow transactions build hello.cdc \
  --network mainnet \
  --proposer 0x89c1608db1c451ee \
  --proposer-key-index 0 \
  --authorizer 0x89c1608db1c451ee \
  --payer 0x89c1608db1c451ee \
  -x payload \
  --save hello1.rlp
```

## Scott Signs

```sh
flow transactions sign hello1.rlp \
  --signer scott \
  --filter payload \
  --save hello2.rlp
```

## Jonathan Signs

```sh
flow transactions sign hello2.rlp \
  --signer jonathan \
  --filter payload \
  --save hello3.rlp
```


## Somebody Submits

```sh
flow transactions send-signed --network mainnet hello3.rlp
```
