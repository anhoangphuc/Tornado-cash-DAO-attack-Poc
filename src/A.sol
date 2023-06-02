//SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;

contract A {
    function stop() public {
        selfdestruct(payable(address(0)));
    }
}