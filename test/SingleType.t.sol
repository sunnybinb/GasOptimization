// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import "forge-std/Test.sol";
import "../src/SingleType.sol";

contract GasDataTypeTest is Test {
    A contractA;
    B contractB;

    function setUp() public {
        contractA = new A();
        contractB = new B();
    }

    function testDeploymentGas() public {
        //test A deployment
        uint256 gasStartA = gasleft();
        A newContractA = new A();
        uint256 gasEndA = gasleft();
        uint256 gasUsedA = gasStartA - gasEndA;

        //test B deployment
        uint256 gasStartB = gasleft();
        B newContractB = new B();
        uint256 gasEndB = gasleft();
        uint256 gasUsedB = gasStartB - gasEndB;

        console.log("Contract A deployment gas:", gasUsedA);
        console.log("Contract B deployment gas:", gasUsedB);
    }

    function testReadGas() public view {
        // test A
        uint256 gasStartA = gasleft();
        contractA.a();
        uint256 gasEndA = gasleft();
        uint256 gasUsedA = gasStartA - gasEndA;

        // test B
        uint256 gasStartB = gasleft();
        contractB.a();
        uint256 gasEndB = gasleft();
        uint256 gasUsedB = gasStartB - gasEndB;

        console.log("Contract A read gas:", gasUsedA);
        console.log("Contract B read gas:", gasUsedB);
    }

    function testWriteGas() public {
        // test A
        uint256 gasStartA = gasleft();
        contractA.setA(1);
        uint256 gasEndA = gasleft();
        uint256 gasUsedA = gasStartA - gasEndA;

        // test B
        uint256 gasStartB = gasleft();
        contractB.setA(1);
        uint256 gasEndB = gasleft();
        uint256 gasUsedB = gasStartB - gasEndB;

        console.log("Contract A write gas:", gasUsedA);
        console.log("Contract B write gas:", gasUsedB);
    }
}
