// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";

contract JokeToken is ERC20 {

  using SafeMath for uint;
  address public admin;
  uint public maxTotalSupply;

  constructor(
    string memory name,
    string memory symbol,
    uint _maxTokenSupply
    ) ERC20(name, symbol) {
      admin = msg.sender;
      maxTotalSupply = _maxTokenSupply;
    }

  function updateAdmin(address newAdmin) public {
    require(msg.sender == admin, "only admin can update admin");
    admin = newAdmin;
  }

  function mint(address account, uint256 amount) public {
    require(msg.sender == admin, "only admin can mint token");
    uint totalSupply = totalSupply();
    require(
      totalSupply.add(amount) <= maxTotalSupply,
      "cant mint more than max supply"
      );
      _mint(account, amount);
  }
}
