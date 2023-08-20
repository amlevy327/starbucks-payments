// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract Balances is ERC20, ReentrancyGuard  {

  address public immutable PAYMENT_TOKEN;

  mapping(address => uint256) _balance;

  event BalanceIncreased(address indexed owner, uint256 amount);
  event BalanceDecreased(address indexed owner, uint256 amount, string indexed item);

  constructor(
    string memory name_,
    string memory symbol_,
    address paymentToken_
  ) ERC20(name_, symbol_)
  {
    PAYMENT_TOKEN = paymentToken_;
  }

  /**
  ////////////////////////////////////////////////////
  // External Functions 
  ///////////////////////////////////////////////////
  */
  
  function addToBalance(address owner_, uint256 amount_) external nonReentrant {
    IERC20(PAYMENT_TOKEN).transferFrom(owner_, address(this), amount_);
    _balance[owner_] += amount_;
    emit BalanceIncreased(owner_, amount_);
  }

  // TOOD: for prod add access control
  function makePurchase(address owner_, uint256 amount_, string memory item_) external nonReentrant {
    require(_balance[owner_] >= amount_, "LOW_BALANCE");
    _balance[owner_] -= amount_;
    emit BalanceDecreased(owner_, amount_, item_);
  }

  // TOOD: for prod add access control
  function withdraw(address to_) external nonReentrant {
    IERC20(PAYMENT_TOKEN).transferFrom(address(this), to_, IERC20(PAYMENT_TOKEN).balanceOf(address(this)));
  }

  /**
  ////////////////////////////////////////////////////
  // View only functions
  ///////////////////////////////////////////////////
  */

  function getCurrentBalance(address owner_) external view returns (uint256) {
    return _balance[owner_];
  }
}