// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import {PiggyBank} from "@src/PiggyBank.sol";

contract DeployPiggyBank is Script {
    function setUp() public {}

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);
        new PiggyBank();
        vm.stopBroadcast();
    }
}
