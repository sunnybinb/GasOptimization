// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import "forge-std/Test.sol";
import "../src/StorageAccess.sol";

contract StorageAccessTest is Test {
    StorageAccess public storageContract;

    function setUp() public {
        storageContract = new StorageAccess();
    }

    function test_CompareGasUsage() public {
        // test inEfficient
        uint256 inefficientGas = gasleft();
        storageContract.sumInefficient();
        inefficientGas = inefficientGas - gasleft();

        // test efficient
        uint256 efficientGas = gasleft();
        storageContract.sumEfficient();
        efficientGas = efficientGas - gasleft();

        console.log("=== Gas Consumption Comparison  ===");
        console.log("Inefficient method gas:", inefficientGas);
        console.log("Efficient method gas:", efficientGas);
        console.log("Gas saved:", inefficientGas - efficientGas);
    }
}
