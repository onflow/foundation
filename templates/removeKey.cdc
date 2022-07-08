transaction(oldKeyIndex: Int) {
	prepare(signer: AuthAccount) {
		signer.removePublicKey(oldKeyIndex)
	}
}