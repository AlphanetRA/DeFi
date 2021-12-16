// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/utils/Address.sol";
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract BobFarmToken is ERC20 {

    using Address for address;
    using SafeERC20 for IERC20;

    // BobToken
    IERC20 public token;

    constructor(address _token) ERC20("BobFarmToken", "BFRM") {
        token = IERC20(_token);
    }

    function balance() public view returns (uint256) {
        return token.balanceOf(address(this));
    }

    function deposit(uint256 _amount) public {
        require(_amount > 0, "amount cannot be 0");

        // Transfer BobToken to smart contract
        token.safeTransferFrom(msg.sender, address(this), _amount);

        // Mint BobFarmToken to msg sender
        _mint(msg.sender, _amount);
    }

    function withraw(uint256 _amount) public {
        // Burn BobFarmTokens from msg sender
        _burn(msg.sender, _amount);

        // Transfer BobTokens from this smart contract to msg sender
        token.safeTransfer(msg.sender, _amount);
    }
}