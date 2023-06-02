//SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;
import "./A.sol";
import "./B.sol";

contract Factory {
    function createA() external returns (A) {
        return new A();
    }

    function createB() external returns (B) {
        return new B();
    }

    function stop() public {
        selfdestruct(payable(address(0)));
    }
}