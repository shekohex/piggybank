// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
using SafeERC20 for IERC20;

/// @title Piggy Bank - A simple smart contract to store ERC20 tokens and withdraw them later.
/// @author Shady Khalifa (@shekohex)
/// @notice You can use this contract to store your ERC20 tokens and withdraw them later.
/// @notice This contract should only store only one type of ERC20 token.
contract PiggyBank is Ownable {
    /// @notice Receive function to cancel any incoming native tokens.
    /// @dev This function will revert any incoming native tokens.
    receive() external payable {
      revert("This contract does not accept native tokens.");
    }
  
    /// @notice Destroy the Piggy bank, allowing you to withdraw the stored ERC20 tokens.
    /// @notice This function can only be called by the owner of the contract.
    /// @param token The address of the ERC20 token to withdraw.
    function destroy(address token) external onlyOwner {
      // Get the balance of the contract.
      uint256 balance = IERC20(token).balanceOf(address(this));
      require(balance > 0, "There is no tokens to withdraw.");
      // Transfer the tokens to the owner.
      IERC20(token).safeTransfer(msg.sender, balance);
      // Destroy the contract.
      selfdestruct(payable(msg.sender));
    }
    
    /// @notice Get the balance of the contract.
    /// @param token The address of the ERC20 token to get the balance of.
    function balanceOf(address token) external view returns (uint256) {
      return IERC20(token).balanceOf(address(this));
    }
}
