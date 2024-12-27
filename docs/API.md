# API Documentation

## Public Functions

### Bridge Operations

#### deposit-bitcoin

```clarity
(define-public (deposit-bitcoin
  (btc-tx-hash (string-ascii 64))
  (amount uint)
  (recipient principal)
))
```

Processes a Bitcoin deposit and mints wrapped tokens.

**Parameters:**

- `btc-tx-hash`: Bitcoin transaction hash (64 characters)
- `amount`: Amount in satoshis
- `recipient`: Recipient address

**Returns:**

- `(ok uint)`: Net amount after fees
- `(err uint)`: Error code if failed

### Oracle Management

#### add-oracle

```clarity
(define-public (add-oracle (oracle principal)))
```

Adds an oracle to the authorized list.

**Parameters:**

- `oracle`: Oracle principal address

**Returns:**

- `(ok true)`: Success
- `(err uint)`: Error code if failed

#### remove-oracle

```clarity
(define-public (remove-oracle (oracle principal)))
```

Removes an oracle from the authorized list.

### Bridge Controls

#### pause-bridge

```clarity
(define-public (pause-bridge))
```

Pauses bridge operations.

#### unpause-bridge

```clarity
(define-public (unpause-bridge))
```

Resumes bridge operations.

### Configuration

#### update-bridge-fee

```clarity
(define-public (update-bridge-fee (new-fee uint)))
```

Updates the bridge fee percentage.

#### update-max-deposit

```clarity
(define-public (update-max-deposit (new-max uint)))
```

Updates maximum deposit limit.

## Read-Only Functions

### get-total-locked-bitcoin

```clarity
(define-read-only (get-total-locked-bitcoin))
```

Returns total locked Bitcoin amount.

### get-user-balance

```clarity
(define-read-only (get-user-balance (user principal)))
```

Returns user's wrapped Bitcoin balance.

### is-oracle-authorized

```clarity
(define-read-only (is-oracle-authorized (oracle principal)))
```

Checks if an oracle is authorized.

### is-bridge-owner

```clarity
(define-read-only (is-bridge-owner (sender principal)))
```

Checks if an address is the bridge owner.
