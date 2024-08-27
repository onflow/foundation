package sporking

import (
	"context"
	"fmt"

	sdk "github.com/onflow/flow-go-sdk"
	"github.com/onflow/flow-go-sdk/crypto"

	"github.com/dapperlabs/flow-mgmt/pkg/cloudkms"
)

func MainnetIncrementAccountKey() cloudkms.Key {
	return cloudkms.Key{
		ProjectID:  "dl-flow-admin",
		LocationID: "global",
		KeyRingID:  "increment-mainnet",
		KeyID:      "increment-mainnet-key",
		KeyVersion: "1",
	}
}

func MainnetIncrementAccountKey2() cloudkms.Key {
	return cloudkms.Key{
		ProjectID:  "dl-flow-admin",
		LocationID: "global",
		KeyRingID:  "increment-mainnet",
		KeyID:      "increment-mainnet-key-2",
		KeyVersion: "1",
	}
}

func CloudKMSSigner(serviceAccountAddress sdk.Address, kmsKey cloudkms.Key) (*cloudkms.Signer, error) {
	ctx := context.Background()
	serviceAccountSigner, err := cloudkms.NewSigner(
		ctx,
		serviceAccountAddress,
		kmsKey,
		crypto.SHA2_256,
	)

	if err != nil {
		return nil, fmt.Errorf("could not create signer: %w", err)
	}
	return serviceAccountSigner, nil
}
