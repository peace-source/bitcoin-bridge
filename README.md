# Bitcoin Bridge Smart Contract

A secure and efficient smart contract for bridging Bitcoin to wrapped Bitcoin tokens (wBTC) on the Stacks blockchain.

## Overview

The Bitcoin Bridge Smart Contract enables seamless bridging between Bitcoin and the Stacks blockchain through a wrapped Bitcoin token (wBTC) implementation. It provides a secure, transparent, and efficient way to lock Bitcoin and mint equivalent wrapped tokens while maintaining strict security measures and operational controls.

## Features

- **Secure Bitcoin Bridging**: Lock BTC and mint equivalent wBTC tokens
- **Oracle-based Validation**: Multi-oracle validation system for Bitcoin transactions
- **Whitelist Management**: Controlled access through recipient whitelisting
- **Fee Management**: Configurable bridge fees
- **Emergency Controls**: Pause/unpause functionality for emergency scenarios
- **Deposit Limits**: Configurable maximum deposit amounts
- **Transaction Tracking**: Prevent double-processing of transactions

## Architecture

### Core Components

1. **Bridge Core**

   - Deposit processing
   - Fee calculation
   - Transaction validation

2. **Oracle System**

   - Multiple oracle support
   - Oracle authorization management
   - Transaction validation requirements

3. **Access Control**

   - Bridge owner privileges
   - Oracle management
   - Whitelist management

4. **Token Management**
   - Wrapped Bitcoin (wBTC) minting
   - Balance tracking
   - Total supply management

### Key Functions

#### Public Operations

- `deposit-bitcoin`: Process Bitcoin deposits and mint wBTC
- `pause-bridge`: Emergency pause functionality
- `unpause-bridge`: Resume bridge operations
- `update-bridge-fee`: Modify bridge fee percentage
- `update-max-deposit`: Adjust maximum deposit limit

#### Oracle Management

- `add-oracle`: Add new oracle validators
- `remove-oracle`: Remove existing oracles
- `is-oracle-authorized`: Check oracle authorization status

#### Whitelist Operations

- `add-to-whitelist`: Add addresses to whitelist
- `remove-from-whitelist`: Remove addresses from whitelist

## Security Features

- Transaction double-processing prevention
- Strict input validation
- Oracle-based transaction verification
- Emergency pause mechanism
- Deposit limits
- Recipient whitelisting
- Owner-only administrative functions

## Error Codes

| Code | Description                   |
| ---- | ----------------------------- |
| u1   | Not authorized                |
| u2   | Invalid amount                |
| u3   | Insufficient balance          |
| u4   | Bridge paused                 |
| u5   | Transaction already processed |
| u6   | Oracle validation failed      |
| u7   | Invalid recipient             |
| u8   | Maximum deposit exceeded      |
| u9   | Invalid transaction hash      |

## Getting Started

### Prerequisites

- Stacks blockchain node
- Bitcoin node (for transaction verification)
- Oracle service implementation

### Deployment

1. Deploy the contract to the Stacks blockchain
2. Initialize bridge owner
3. Add initial oracles
4. Configure bridge parameters (fees, limits)
5. Add whitelisted recipients

### Usage Example

```clarity
;; Deposit Bitcoin
(contract-call? .bitcoin-bridge deposit-bitcoin
  "1234567890abcdef1234567890abcdef1234567890abcdef1234567890abcdef"  ;; BTC tx hash
  u100000000  ;; Amount in sats
  'ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM  ;; Recipient
)
```

## Testing

Comprehensive testing should cover:

- Deposit scenarios
- Oracle validation
- Access control
- Error conditions
- Emergency procedures

## Contributing

Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on our code of conduct and the process for submitting pull requests.

## Security

For security concerns, please refer to our [SECURITY.md](SECURITY.md) file.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Contact

For questions and support, please open an issue in the repository.
