// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract AlickToken is ERC20 {
    constructor() ERC20("AlickToken", "ATKN") {
        _mint(msg.sender, 1000000000000000000000000);
    }
}