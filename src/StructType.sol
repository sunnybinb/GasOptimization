// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract A {
    struct Unpacked {
        uint256 x;
        uint256 y;
        uint256 z;
    }

    Unpacked public unpackedData;

    function setUnpackedData(uint256 _x, uint256 _y, uint256 _z) public {
        unpackedData.x = _x;
        unpackedData.y = _y;
        unpackedData.z = _z;
    }
}

contract B {
    struct Packed {
        uint64 x;
        uint64 y;
        uint128 z;
    }

    Packed public packedData;

    function setPackedData(uint64 _x, uint64 _y, uint128 _z) public {
        packedData.x = _x;
        packedData.y = _y;
        packedData.z = _z;
    }
}
