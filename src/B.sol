//SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;

contract B {
    address public owner;
    constructor() {
        owner = msg.sender;
    }
}