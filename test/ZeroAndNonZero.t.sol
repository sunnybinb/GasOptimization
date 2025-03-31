// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import "forge-std/Test.sol";
import "../src/ZeroAndNonZero.sol";

contract ZeroAndNonZeroTest is Test {
    A public zeroContract;
    B public nonZeroContract;

    function setUp() public {
        zeroContract = new A();
        nonZeroContract = new B();
    }

    function test_CompareAllScenarios() public {
        // case1  zero to non zero
        uint256 zeroToNonZeroGas = gasleft();
        zeroContract.setData(100);
        zeroToNonZeroGas = zeroToNonZeroGas - gasleft();

        // case2 non zero to non zero
        uint256 nonZeroToNonZeroGas = gasleft();
        nonZeroContract.setData(100);
        nonZeroToNonZeroGas = nonZeroToNonZeroGas - gasleft();

        // case3 nonzero to zero
        uint256 nonZeroToZeroGas = gasleft();
        nonZeroContract.setData(0);
        nonZeroToZeroGas = nonZeroToZeroGas - gasleft();

        console.log("=== Gas Consumption Comparison ===");
        console.log("0 -> non-0:", zeroToNonZeroGas);
        console.log("non-0 -> non-0:", nonZeroToNonZeroGas);
        console.log("non-0 -> 0:", nonZeroToZeroGas);
    }
}
