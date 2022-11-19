// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import {PiggyBank} from "@src/PiggyBank.sol";
import {USDTestToken} from "./USDTestToken.sol";

contract PiggyBankTest is Test {
    PiggyBank public bank;
    USDTestToken public usdt;
    // Test accounts.
    address ALICE = address(0x01);
    address BOB = address(0x02);

    // Events that are emitted by the contract.
    event Tokensdestroyn(address indexed to, uint256 amount);

    function setUp() public {
        vm.prank(ALICE);
        bank = new PiggyBank();
        usdt = new USDTestToken();
        // assert that the owner is alice.
        assertEq(bank.owner(), ALICE);
        // Give Alice and Bob some USDT.
        usdt.transfer(ALICE, 100);
        usdt.transfer(BOB, 100);
        // Give Alice and Bob some ETH.
        vm.deal(ALICE, 100 ether);
        vm.deal(BOB, 100 ether);
    }

    function testSendingNativeTokenFails() public {
        // transfer some eth from alice to the bank and the caller is alice.
        vm.expectRevert(bytes("This contract does not accept native tokens."));
        vm.prank(ALICE);
        payable(address(bank)).transfer(5 ether);
    }

    function testTransfer() public {
        // transfer from alice to the bank and the caller is alice.
        vm.prank(ALICE);
        usdt.transfer(address(bank), 5);
        // Check the balance of the bank.
        assertEq(usdt.balanceOf(address(bank)), 5);
        // Check the balance of alice.
        assertEq(usdt.balanceOf(ALICE), 95);
    }

    function testDestory() public {
        // transfer from alice to the bank and the caller is alice.
        vm.prank(ALICE);
        usdt.transfer(address(bank), 5);
        // Check the balance of the bank.
        assertEq(usdt.balanceOf(address(bank)), 5);
        // Check the balance of alice.
        assertEq(usdt.balanceOf(ALICE), 95);
        // destroy the bank and the caller is alice.
        vm.prank(ALICE);
        bank.destroy(address(usdt));
        // Check the balance of the bank.
        assertEq(usdt.balanceOf(address(bank)), 0);
        // Check the balance of alice.
        assertEq(usdt.balanceOf(ALICE), 100);
    }

    function testdestroyAsNotOwner() public {
        // transfer from alice to the bank and the caller is alice.
        vm.prank(ALICE);
        usdt.transfer(address(bank), 5);
        // Check the balance of the bank.
        assertEq(usdt.balanceOf(address(bank)), 5);
        // Check the balance of alice.
        assertEq(usdt.balanceOf(ALICE), 95);
        // destroy the bank and the caller is bob.
        vm.expectRevert(bytes("Ownable: caller is not the owner"));
        vm.prank(BOB);
        bank.destroy(address(usdt));
        // Check the balance of the bank.
        assertEq(usdt.balanceOf(address(bank)), 5);
        // Check the balance of alice.
        assertEq(usdt.balanceOf(ALICE), 95);
    }

    function testDestoryEmptyBank() public {
        // destroy the bank and the caller is alice.
        vm.expectRevert(bytes("There is no tokens to withdraw."));
        vm.prank(ALICE);
        bank.destroy(address(usdt));
        // Check the balance of the bank.
        assertEq(usdt.balanceOf(address(bank)), 0);
        // Check the balance of alice.
        assertEq(usdt.balanceOf(ALICE), 100);
    }
}
