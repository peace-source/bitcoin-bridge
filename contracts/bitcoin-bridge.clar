;; title: Bitcoin Bridge Smart Contract

;; summary: A smart contract for bridging Bitcoin to a wrapped token on the Stacks blockchain.

;; description: This contract allows users to deposit Bitcoin and receive wrapped Bitcoin tokens (wBTC) on the Stacks blockchain.
;; It includes functionalities for managing oracles, pausing the bridge, updating bridge fees, and validating Bitcoin transactions.
;; The contract ensures secure and transparent handling of Bitcoin deposits and withdrawals, with mechanisms for emergency scenarios and oracle-based transaction validation.

;; Constants

;; Error Codes
(define-constant ERR-NOT-AUTHORIZED (err u1))
(define-constant ERR-INVALID-AMOUNT (err u2))
(define-constant ERR-INSUFFICIENT-BALANCE (err u3))
(define-constant ERR-BRIDGE-PAUSED (err u4))
(define-constant ERR-TRANSACTION-ALREADY-PROCESSED (err u5))
(define-constant ERR-ORACLE-VALIDATION-FAILED (err u6))
(define-constant ERR-INVALID-RECIPIENT (err u7))
(define-constant ERR-MAX-DEPOSIT-EXCEEDED (err u8))
(define-constant ERR-INVALID-TX-HASH (err u9))

;; Data Variables

;; Core Configuration
(define-data-var bridge-owner principal tx-sender)
(define-data-var is-bridge-paused bool false)
(define-data-var bridge-fee-percentage uint u10)  ;; 1% default fee
(define-data-var max-deposit-amount uint u10000000)  ;; Maximum deposit limit

;; Bridge State
(define-data-var total-locked-bitcoin uint u0)