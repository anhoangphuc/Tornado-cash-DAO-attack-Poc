// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;

import "forge-std/Test.sol";
import "../src/Counter.sol";

contract CounterTest is Test {
    Counter public counter;
    Counter newCounter;
    uint256 nonce1;
    uint256 nonce2;

    function setUp() public {
        counter = new Counter();
        nonce1 = vm.getNonce(address(this));
        counter.setNumber(0);
        newCounter = new Counter();
        newCounter.emergencyStop();
        nonce2 = vm.getNonce(address(this));
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
        // Nonce of contract is increased by one when deploying new contract
        assertEq(nonce1 + 1, nonce2);
        counter.increment();
        uint256 currentNonce = vm.getNonce(address(this));
        // Nonce of contract is not increased when executing a function
        assertEq(nonce2, currentNonce);
    }

    function testEmergencyStop() public {
        assertEq(address(newCounter).code.length, 0);
    }
}
