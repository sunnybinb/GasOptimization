// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import "forge-std/Test.sol";
import "../src/UnusedVariables.sol";

contract UnusedVariablesTest is Test {
    UnusedVariables public unusedVars;

    function setUp() public {
        unusedVars = new UnusedVariables();
    }

    function test_CompareDeleteGas() public {
        uint256 deleteGas = gasleft();
        unusedVars.useDelete();
        deleteGas = deleteGas - gasleft();

        uint256 skipDeleteGas = gasleft();
        unusedVars.skipDelete();
        skipDeleteGas = skipDeleteGas - gasleft();

        console.log("=== Gas Consumption Comparison ===");
        console.log("Using delete gas:", deleteGas);
        console.log("Skip delete gas:", skipDeleteGas);
    }
}
