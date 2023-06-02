//SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;
import "./A.sol";
import "./B.sol";

contract Factory {
    function createA() external returns (address) {
        return address(new A());
    }

    function createB() external returns (address) {
        return address(new B());
    }
}