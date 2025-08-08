# Aptos Workshop 🚀

This repository is a simple Aptos Move project demonstrating how to build, compile, publish, and interact with a basic smart contract module on the Aptos blockchain.

---

## 📦 Module: `username_registry`

This Move module allows users to:
- ✅ Register a unique username
- 🔍 Query the owner of a username
- ✏️ Update ownership of a username

---

## 📁 Project Structure

```
aptos-workshop/
│
├── Move.toml                    # Project configuration
├── sources/
│   └── username_registry.move   # Main Move module
└── README.md                   
```

---

## 🚀 How to Run Locally

### 1. Initialize the Aptos profile
```bash
aptos init --profile new_profile
```

### 2. Fund the account (Devnet only)
```bash
aptos account fund-with-faucet --profile new_profile
```

### 3. Compile the Move code
```bash
aptos move compile
```

### 4. Publish the module
```bash
aptos move publish --profile new_profile
```

---

## 🔧 Functions

### `initialize(account: &signer)`
Initializes the registry for the signer account.

### `register_username(account: &signer, username: string)`
Registers a unique username for the caller.

### `get_owner(account: address, username: string): address`
Returns the owner of the given username.

### `update_username(account: &signer, username: string, new_owner: address)`
Updates the owner of a given username if the caller is the original owner.

---

## 📸 Screenshots


### Preview


<img width="2880" height="4216" alt="explorer aptoslabs com_txn_0x395c5963ac70db6dc7e7a3131b44b8faafc889a74298978df49a88d2dcfbb7f3_network=devnet" src="https://github.com/user-attachments/assets/88c9bb0b-c403-4726-a4f0-21004f592c8d" />




---



