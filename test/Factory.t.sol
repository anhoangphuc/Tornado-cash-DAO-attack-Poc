// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;

import "forge-std/Test.sol";
import "forge-std/console.sol";
import "../src/Factory.sol";
import "../src/A.sol";
import "../src/B.sol";

contract FactoryTest is Test {
    Factory public factory1;
    Factory public factory2;
    A public a;
    B public b;
    uint256 oldFactoryNonce;

    function setUp() public {
        factory1 = new Factory{salt: keccak256(abi.encodePacked("1"))}();
        a = factory1.createA();
        oldFactoryNonce = vm.getNonce(address(factory1));
        factory1.stop();
        a.stop();
    }

    function testSelfDestruct() public {
        // Nonce of contract default is 1, after creating contract A, it will be 2
        assertEq(oldFactoryNonce , 2);
        assertEq(address(factory1).code.length, 0);
        assertEq(address(a).code.length, 0);
    }

    function testCreateB() public {
        factory2 = new Factory{salt: keccak256(abi.encodePacked("1"))}();
        assertEq(address(factory2), address(factory1));
        uint256 nonce = vm.getNonce(address(factory2));
        assertEq(nonce, 1);
        b = factory2.createB();
        assertEq(address(a), address(b));
    }
}
