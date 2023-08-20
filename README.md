# starbucks-payments

## Mumbai testnet smart contracts
- Balances: [0x85D26b86ff28dDb03eDDD6b6067bf073aDf5B51c](https://mumbai.polygonscan.com/address/0x85D26b86ff28dDb03eDDD6b6067bf073aDf5B51c)
- USDC: [0x9C87330d50673C8C15dbfe18b093872631a5EdcA](https://mumbai.polygonscan.com/address/0x9C87330d50673C8C15dbfe18b093872631a5EdcA)

### How to interact through PolygonScan
1. Obtain Mumbai MATIC. [FAUCET](https://faucet.polygon.technology/).
2. Mint USDC using #4 mintTokens. Inputs: to_ = your address, amount_ = 1000000000000000000000000. [WRITE CONTRACT](https://mumbai.polygonscan.com/address/0x9C87330d50673C8C15dbfe18b093872631a5EdcA#writeContract).
3. Approve Balances contract to transfer USDC using #1 approve. Inputs: spender = 0x85D26b86ff28dDb03eDDD6b6067bf073aDf5B51c, amount = 1000000000000000000000000. [WRITE CONTRACT](https://mumbai.polygonscan.com/address/0x9C87330d50673C8C15dbfe18b093872631a5EdcA#writeContract).
4. Transfer USDC to contract using #1 addToBalance. Inputs: to_ = your address, amount_ = 1000000000000000000000000. [WRITE CONTRACT](https://mumbai.polygonscan.com/address/0x85D26b86ff28dDb03eDDD6b6067bf073aDf5B51c#writeContract).
5. Make purchase using #5 makePurchase. Inputs = owner_ = your address, amount_ = 1000000000000000000, item_ = "IcedCoffee". [WRITE CONTRACT](https://mumbai.polygonscan.com/address/0x85D26b86ff28dDb03eDDD6b6067bf073aDf5B51c#writeContract).