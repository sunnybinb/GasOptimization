// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import "forge-std/Test.sol";
import "../src/StructOrder.sol";

contract StructOrderTest is Test {
    A public unOrderedContract;
    B public orderedContract;

    function setUp() public {
        unOrderedContract = new A();
        orderedContract = new B();
    }

    function test_WriteGas() public {
        // test unOrdered
        uint256 unOrderedWriteGas = gasleft();
        unOrderedContract.setUnOrderedData(1, 2, address(this));
        unOrderedWriteGas = unOrderedWriteGas - gasleft();

        // test ordered
        uint256 orderedWriteGas = gasleft();
        orderedContract.setOrderedData(2, 1, address(this));
        orderedWriteGas = orderedWriteGas - gasleft();

        console.log("UnOrdered write gas:", unOrderedWriteGas);
        console.log("Ordered write gas:", orderedWriteGas);
        console.log("Gas saved in writing:", unOrderedWriteGas - orderedWriteGas);
    }

    function test_ReadGas() public {
        unOrderedContract.setUnOrderedData(1, 2, address(this));
        orderedContract.setOrderedData(2, 1, address(this));

        // test unOrdered
        uint256 unOrderedReadGas = gasleft();
        unOrderedContract.unOrdered();
        unOrderedReadGas = unOrderedReadGas - gasleft();

        // test ordered
        uint256 orderedReadGas = gasleft();
        orderedContract.orderData();
        orderedReadGas = orderedReadGas - gasleft();

        console.log("UnOrdered read gas:", unOrderedReadGas);
        console.log("Ordered read gas:", orderedReadGas);
        console.log("Gas saved in reading:", unOrderedReadGas - orderedReadGas);
    }
}
