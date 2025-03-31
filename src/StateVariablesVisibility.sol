// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract A {
    uint256 public a;
    uint256 b;

    function setA(uint8 _a) public {
        a = _a;
    }

    function setB(uint256 _b) public {
        b = _b;
    }
}
