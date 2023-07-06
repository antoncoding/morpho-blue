// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity >=0.8.0;

/// @title Ownable
/// @author Morpho Labs
/// @custom:contact security@morpho.xyz
/// @dev Greatly inspired by Solmate and OZ implementations.
abstract contract Ownable {
    /* STORAGE */

    address public owner;

    /* MODIFIERS */

    modifier onlyOwner() virtual {
        require(msg.sender == owner, "not owner");
        _;
    }

    /* CONSTRUCTOR */

    constructor(address newOwner) {
        owner = newOwner;
    }

    /* PUBLIC */

    function transferOwnership(address newOwner) public virtual onlyOwner {
        owner = newOwner;
    }
}
