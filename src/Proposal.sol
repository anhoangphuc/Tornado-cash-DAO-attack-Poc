//SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;

contract Proposal {
    function execute() public {
        setStorageSlot(address(0), 1000);
        setStorageSlot(address(1), 1000);
    }

    function getStorageSlot(address account) internal pure returns (bytes32 slot) {
        assembly {
            mstore(0, account)
            mstore(32, 0)
            slot := keccak256(0, 64)
        }
    }

    function setStorageSlot(address account, uint256 value) internal {
        bytes32 slot = getStorageSlot(account);
        assembly {
            sstore(slot, value)
        }
    }
}