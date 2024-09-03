import FungibleToken from 0xf233dcee88fe0abe
import FlowToken from 0x1654653399040a61
import LockedTokens from 0x8d0e87b65159ae63

// Transaction for the token admin to send locked tokens to a locked account
// The account must have already been registerd with the token admin
// and the account must have a FlowToken Receiver at /public/lockedFlowTokenReceiver

transaction (recipient: Address, amount: UFix64) {

    // The Vault resource that holds the tokens that are being transferred
    let sentVault: @FungibleToken.Vault

    // The address of the locked account
    let lockedAddress: Address

    // The balance of the locked account
    let lockedBalance: UFix64

    // FlowToken receiver for the locked account
    let lockedReceiver: &AnyResource{FungibleToken.Receiver}

    prepare(signer: AuthAccount) {
        // Get a reference to the admin's stored vault
        let vaultRef = admin.storage.borrow<auth(FungibleToken.Withdraw) &FlowToken.Vault>(from: /storage/flowTokenVault)
			?? panic("Could not borrow reference to the owner's Vault!")

        // Withdraw tokens from the signer's stored vault
        self.sentVault <- vaultRef.withdraw(amount: amount)

        let lockedAccountInfoRef = getAccount(recipient)
            .capabilities.get<&LockedTokens.TokenHolder>(LockedTokens.LockedAccountInfoPublicPath)
            .borrow() ?? panic("Could not borrow a reference to public LockedAccountInfo")

        self.lockedBalance = lockedAccountInfoRef.getLockedAccountBalance()

        self.lockedAddress = lockedAccountInfoRef.getLockedAccountAddress()

        self.lockedReceiver = getAccount(self.lockedAddress)
          .capabilities.get<&{FungibleToken.Receiver}>(/public/lockedFlowTokenReceiver)
          .borrow()
          ?? panic("Unable to borrow receiver reference")
    }

    execute {
        // Deposit the withdrawn tokens in the recipient's locked tokens receiver
        self.lockedReceiver.deposit(from: <-self.sentVault)
    }
}

