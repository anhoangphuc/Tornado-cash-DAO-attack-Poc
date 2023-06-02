// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;

import "forge-std/console.sol";

contract Counter {
    uint256 public number;

    function setNumber(uint256 newNumber) public {
        number = newNumber;
    }

    function increment() public {
        number++;
    }

    function emergencyStop() public {
        selfdestruct(payable(address(0)));
    }
}
