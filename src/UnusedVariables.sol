// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract UnusedVariables {
    uint256 public data;

    function useDelete() public {
        data = 123; // Example operation
        delete data; // Reset data to its default value
    }

    function skipDelete() public {
        data = 123; // Example operation
    }
}
