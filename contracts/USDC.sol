// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract USDC is ERC20, ReentrancyGuard  {

  constructor(
    string memory name_,
    string memory symbol_
  ) ERC20(name_, symbol_)
  {}

  /**
  ////////////////////////////////////////////////////
  // External Functions 
  ///////////////////////////////////////////////////
  */

  function mintTokens(address to_, uint256 amount_) external nonReentrant {
    _mint(to_, amount_);
  }

  /**
  ////////////////////////////////////////////////////
  // View only functions
  ///////////////////////////////////////////////////
  */
}