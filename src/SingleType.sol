// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract A {
    uint8 public a = 0;

    function setA(uint8 _a) public {
        a = _a;
    }
}

contract B {
    uint256 public a = 0;

    function setA(uint256 _a) public {
        a = _a;
    }
}
