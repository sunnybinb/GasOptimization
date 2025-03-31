// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract A {
    uint256 a;

    function setData(uint256 _data) public {
        a = _data;
    }
}

contract B {
    uint256 a = 1;

    function setData(uint256 _data) public {
        a = _data;
    }
}
