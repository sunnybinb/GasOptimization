// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract FunctionCall {
    uint128 startTime;
    uint128 endTime;

    function setTime(uint256 _startTime, uint256 _endTime) external {}
    // public

    function publicFunction(uint256[100] calldata data) public pure returns (uint256) {
        return data[0];
    }

    // external
    function externalFunction(uint256[100] calldata data) external pure returns (uint256) {
        return data[0];
    }
}
