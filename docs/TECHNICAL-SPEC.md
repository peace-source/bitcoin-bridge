# Technical Specification

## Contract Architecture

### Core Components

1. **Token Management**
   ```clarity
   (define-fungible-token wrapped-bitcoin)
   ```
   - Implements the wrapped Bitcoin token
   - Minting controlled by deposit process
   - Balance tracking per user

2. **State Management**
   ```clarity
   (define-data-var bridge-owner principal tx-sender)
   (define-data-var is-bridge-paused bool false)
   (define-data-var bridge-fee-percentage uint u10)
   (define-data-var max-deposit-amount uint u10000000)
   ```
   - Configurable parameters
   - Emergency controls
   - Fee management

3. **Storage Maps**
   ```clarity
   (define-map authorized-oracles principal bool)
   (define-map processed-transactions { tx-hash: (string-ascii 64) } bool)
   (define-map recipient-whitelist principal bool)
   (define-map user-balances { user: principal } { amount: uint })
   ```
   - Oracle management
   - Transaction tracking
   - Access control
   - Balance records

### Core Functions

1. **Deposit Processing**
   ```clarity
   (define-public (deposit-bitcoin 
     (btc-tx-hash (string-ascii 64))
     (amount uint)
     (recipient principal)
   ))
   ```
   - Validates transaction hash
   - Checks deposit limits
   - Calculates fees
   - Mints wrapped tokens

2. **Oracle Management**
   ```clarity
   (define-public (add-oracle (oracle principal)))
   (define-public (remove-oracle (oracle principal)))
   ```
   - Oracle authorization
   - Access control

3. **Bridge Controls**
   ```clarity
   (define-public (pause-bridge))
   (define-public (unpause-bridge))
   ```
   - Emergency controls
   - Safety mechanisms

### Error Handling

| Code | Constant | Description |
|------|----------|-------------|
| u1 | ERR-NOT-AUTHORIZED | Access control violation |
| u2 | ERR-INVALID-AMOUNT | Amount validation failed |
| u3 | ERR-INSUFFICIENT-BALANCE | Insufficient funds |
| u4 | ERR-BRIDGE-PAUSED | Bridge is paused |
| u5 | ERR-TRANSACTION-ALREADY-PROCESSED | Duplicate transaction |
| u6 | ERR-ORACLE-VALIDATION-FAILED | Oracle validation error |
| u7 | ERR-INVALID-RECIPIENT | Invalid recipient address |
| u8 | ERR-MAX-DEPOSIT-EXCEEDED | Deposit limit exceeded |
| u9 | ERR-INVALID-TX-HASH | Invalid transaction hash |

## Implementation Details

### Transaction Validation
```clarity
(define-private (validate-bitcoin-transaction 
  (btc-tx-hash (string-ascii 64))
  (amount uint)
))
```
- Verifies transaction hash format
- Checks amount validity
- Confirms oracle authorization

### Fee Calculation
- Default fee: 1% (10 basis points)
- Fee calculation: `(amount * fee_percentage) / 1000`
- Net amount: `amount - fee`

### Security Measures
1. Input Validation
   - Transaction hash format
   - Amount ranges
   - Principal addresses

2. Access Controls
   - Owner-only functions
   - Oracle authorization
   - Whitelist validation

3. Safety Mechanisms
   - Bridge pause functionality
   - Deposit limits
   - Transaction tracking

## Integration Guide

### Oracle Integration
1. Deploy oracle service
2. Register oracle with bridge
3. Implement validation logic
4. Monitor transactions

### Client Integration
1. Connect to Stacks network
2. Monitor Bitcoin transactions
3. Call deposit function
4. Track wrapped token balance

### Example Usage
```clarity
;; Deposit Bitcoin
(contract-call? .bitcoin-bridge deposit-bitcoin
  "1234567890abcdef1234567890abcdef1234567890abcdef1234567890abcdef"
  u100000000
  'ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM
)