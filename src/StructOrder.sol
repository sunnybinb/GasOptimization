// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract A {
    struct UnOrdered {
        uint64 x;
        uint256 y;
        address z;
    }

    UnOrdered public unOrdered;

    function setUnOrderedData(uint64 _x, uint256 _y, address _z) public {
        unOrdered.x = _x;
        unOrdered.y = _y;
        unOrdered.z = _z;
    }
}

contract B {
    struct Ordered {
        uint64 x;
        address y;
        uint256 z;
    }

    Ordered public orderData;

    function setOrderedData(uint256 _z, uint64 _x, address _y) public {
        orderData.z = _z;
        orderData.x = _x;
        orderData.y = _y;
    }
}
