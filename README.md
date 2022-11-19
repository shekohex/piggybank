<h1 align="center">Piggy Bank 🐷💰</h1>

<div align="center">
  <strong>A simple Smart contract to start saving some ERC20 Tokens for rainy days!</strong>
 </div>
<br />

Piggy Bank is a smart contract written in Solidity and is meant to be used as a simple way to save some ERC20 tokens for rainy days. The idea is super simple, you deploy the contract and then you can start sending the tokens you want to save to the contract address, as you would send them to normal wallet address, when you need these tokens you can withdraw them from the contract at any time.

## Usage Scenario 📖

Let's say you want to buy a new phone, and you want to save some money for it, you can deploy the contract and start sending some tokens to it, and when you reach the amount you want to save, you can withdraw them from the contract and buy your new phone.

## How to deploy the contract? 🤔

1. Install [Foundry](https://getfoundry.sh/)
2. Clone this repository
3. Copy `.env.example` to `.env` and fill the variables you need.
4. Start a Dry Run of the contract deployment simulation with

```
foundry script DeployPiggyBank --rpc-url <NETWORK> -vvv
```

where network is the network you want to deploy the contract to, for example `foundry script DeployPiggyBank --rpc-url goerli -vvv` will deploy the contract to the Goerli testnet.

5. If you are happy with the simulation, you can deploy the contract to the network with

```
foundry script DeployPiggyBank --rpc-url <NETWORK> --broadcast --verify -vvv
```

5. Done! 🎉

## How to use it? 🤔

Once deployed, you can interact with the contract using the Explorer like [Etherscan](https://etherscan.io/) or [Polygonscan](https://polygonscan.com/), or you can use the [Foundry Cast CLI](https://book.getfoundry.sh/cast/) to interact with the contract.

## Development 🛠

1. Install [Foundry](https://getfoundry.sh/)
2. Clone this repository
3. Copy `.env.example` to `.env` and fill the variables you need.
4. Install `solc` compiler with just running `yarn`.
5. Run `forge test` to run the tests.
6. Start hacking! 🚀

## Contributing

Want to join us? take a look at some of these issues:

- [Issues labeled "good first issue"][good-first-issue]
- [Issues labeled "help wanted"][help-wanted]

[good-first-issue]: https://github.com/shekohex/piggybank/labels/good%20first%20issue
[help-wanted]: https://github.com/shekohex/piggybank/labels/help%20wanted
