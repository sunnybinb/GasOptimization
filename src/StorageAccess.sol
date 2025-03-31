// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract StorageAccess {
    uint256 public number = 10;

    function sumInefficient() public view returns (uint256) {
        uint256 total = 0;
        for (uint256 i = 0; i < number; i++) {
            total += number;
        }
        return total;
    }

    function sumEfficient() public view returns (uint256) {
        uint256 total = 0;
        uint256 len = number;
        for (uint256 i = 0; i < len; i++) {
            total += number;
        }
        return total;
    }
}
