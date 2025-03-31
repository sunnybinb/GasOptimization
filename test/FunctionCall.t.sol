// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import "forge-std/Test.sol";
import "../src/FunctionCall.sol";

contract FunctionCallTest is Test {
    FunctionCall public functionCall;

    function setUp() public {
        functionCall = new FunctionCall();
    }

    function test_CompareGasUsage() public view {
        uint256[100] memory data;
        for (uint256 i = 0; i < 100; i++) {
            data[i] = i + 1;
        }

        // test public
        uint256 publicGas = gasleft();
        functionCall.publicFunction(data);
        publicGas = publicGas - gasleft();

        // test external
        uint256 externalGas = gasleft();
        functionCall.externalFunction(data);
        externalGas = externalGas - gasleft();

        // compare
        console.log("=== Gas Consumption Comparison ===");
        console.log("Public function gas:", publicGas);
        console.log("External function gas:", externalGas);
        console.log("Gas difference (Public - External):", publicGas - externalGas);
    }
}
