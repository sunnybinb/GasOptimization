// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import "forge-std/Test.sol";
import "../src/StructType.sol";

contract StructTypeTest is Test {
    A public unpackedContract;
    B public packedContract;

    function setUp() public {
        unpackedContract = new A();
        packedContract = new B();
    }

    function test_WriteGas() public {
        // test unPacked
        uint256 unpackedWriteGas = gasleft();
        unpackedContract.setUnpackedData(1, 2, 3);
        unpackedWriteGas = unpackedWriteGas - gasleft();

        // test packed
        uint256 packedWriteGas = gasleft();
        packedContract.setPackedData(1, 2, 3);
        packedWriteGas = packedWriteGas - gasleft();

        console.log("Unpacked write gas:", unpackedWriteGas);
        console.log("Packed write gas:", packedWriteGas);
        console.log("Gas saved in writing:", unpackedWriteGas - packedWriteGas);
    }

    function test_ReadGas() public {
        unpackedContract.setUnpackedData(1, 2, 3);
        packedContract.setPackedData(1, 2, 3);

        // test unPacked
        uint256 unpackedReadGas = gasleft();
        unpackedContract.unpackedData();
        unpackedReadGas = unpackedReadGas - gasleft();

        // test packed
        uint256 packedReadGas = gasleft();
        packedContract.packedData();
        packedReadGas = packedReadGas - gasleft();

        console.log("Unpacked read gas:", unpackedReadGas);
        console.log("Packed read gas:", packedReadGas);
        console.log("Gas saved in reading:", unpackedReadGas - packedReadGas);
    }
}
