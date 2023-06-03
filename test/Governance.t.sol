// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;

import "forge-std/Test.sol";
import "forge-std/console.sol";
import "../src/Governance.sol";
import "../src/Proposal.sol";

contract FactoryTest is Test {
    Governance public governance;
    Proposal public proposal;

    function setUp() public {
        governance = new Governance();
        proposal = new Proposal();
        governance.approve(address(proposal));
    }

    function testExecute() public {
        // Before executing, balance of addr(0) and addr(1) is 0
        assertEq(governance.balance(address(0)), 0);
        assertEq(governance.balance(address(1)), 0);
        governance.execute(address(proposal));
        // After exectuing, balance of addr(0) and addr(1) is updated to 1000 in a invalid way
        assertEq(governance.balance(address(0)), 1000);
        assertEq(governance.balance(address(1)), 1000);
    }
}
