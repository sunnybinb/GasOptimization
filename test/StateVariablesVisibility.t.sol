// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import "forge-std/Test.sol";
import "../src/StateVariablesVisibility.sol";

contract StateVariablesVisibilityTest is Test {
    A public contractA;

    function setUp() public {
        contractA = new A();
    }

    function test_WriteGasComparison() public {
        
        uint256 writePublicGas = gasleft();
        contractA.setA(5);
        writePublicGas = writePublicGas - gasleft();

       
        uint256 writePrivateGas = gasleft();
        contractA.setB(5);
        writePrivateGas = writePrivateGas - gasleft();

       
        console.log("=== Write Gas Consumption ===");
        console.log("Write public variable gas:", writePublicGas);
        console.log("Write private variable gas:", writePrivateGas);
        console.log("Write gas difference:", writePublicGas - writePrivateGas);
    }

    function test_MultipleOperations() public {
        
        uint256 multiWritePublicGas = gasleft();
        for (uint8 i = 0; i < 5; i++) {
            contractA.setA(i);
        }
        multiWritePublicGas = multiWritePublicGas - gasleft();

        uint256 multiWritePrivateGas = gasleft();
        for (uint8 i = 0; i < 5; i++) {
            contractA.setB(i);
        }
        multiWritePrivateGas = multiWritePrivateGas - gasleft();

      
        console.log("=== Multiple Operations Gas Consumption ===");
        console.log("Multiple write public variable gas:", multiWritePublicGas);
        console.log("Multiple write private variable gas:", multiWritePrivateGas);
    }
}
