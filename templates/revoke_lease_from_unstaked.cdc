// The withdraw amount and the account from getAccount
// would be the parameters to the transaction

import FungibleToken from 0xf233dcee88fe0abe
import FlowToken from 0x1654653399040a61
import LockedTokens from 0x8d0e87b65159ae63

transaction (amount: UFix64, to: Address) {

    // The Vault resource that holds the tokens that are being transferred
    let sentVault: @FungibleToken.Vault

    prepare(signer: AuthAccount) {
        let tokenManagerRef = signer.borrow<&LockedTokens.LockedTokenManager>(from: LockedTokens.LockedTokenManagerStoragePath)
            ?? panic("Could not borrow reference to LockedTokenManager")

        // Withdraw tokens from the signer's stored vault
        self.sentVault <- tokenManagerRef.nodeStaker?.withdrawUnstakedTokens(amount: amount)!
    }

    execute {

        // Get the recipient's public account object
        let recipient = getAccount(to)

        // Get a reference to the recipient's Receiver
        let receiverRef = recipient.getCapability(/public/flowTokenReceiver)!.borrow<&{FungibleToken.Receiver}>()
			?? panic("Could not borrow receiver reference to the recipient's Vault")

        // Deposit the withdrawn tokens in the recipient's receiver
        receiverRef.deposit(from: <-self.sentVault)
    }
}
 
