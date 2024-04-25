import LockedTokens from 0x8d0e87b65159ae63

transaction(targetAccount: Address, delta: UFix64) {

    prepare(admin: AuthAccount) {

        let adminRef = admin.borrow<&LockedTokens.TokenAdminCollection>(from: LockedTokens.LockedTokenAdminCollectionStoragePath)
            ?? panic("Could not borrow a reference to the admin collection")

        let tokenManagerRef = adminRef.getAccount(address: targetAccount)!.borrow()
            ?? panic("Could not borrow a reference to the user's token manager")

        tokenManagerRef.increaseUnlockLimit(delta: delta)
    }
}
