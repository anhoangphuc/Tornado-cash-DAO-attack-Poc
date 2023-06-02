// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;

import "forge-std/Test.sol";
import "../src/Counter.sol";

contract CounterTest is Test {
    Counter public counter;

    function setUp() public {
        counter = new Counter();
        counter.setNumber(0);
    }

    function testIncrement() public {
        counter.increment();
        assertEq(counter.number(), 1);
    }

    function testSetNumber(uint256 x) public {
        counter.setNumber(x);
        assertEq(counter.number(), x);
    }

    function testNonceIncrement() public {
        uint256 currentNonce = vm.getNonce(address(this));
        new Counter();
        uint256 newNonce = vm.getNonce(address(this));
        assertEq(currentNonce + 1, newNonce);
    }
}
