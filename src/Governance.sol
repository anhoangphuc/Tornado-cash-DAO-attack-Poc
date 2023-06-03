//SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;

contract Governance {
    mapping(address => uint256) public balance;
    mapping(address => bool) public isApproved;
    function execute(address executionAddress) public {
        require(isApproved[executionAddress], "Not approved");
        (bool success,) = executionAddress.delegatecall(abi.encodeWithSignature("execute()"));
        require(success, "Execution failed");
    }

    function approve(address executionAddress) public {
        isApproved[executionAddress] = true;
    }
}