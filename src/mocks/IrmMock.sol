// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {IIrm} from "../interfaces/IIrm.sol";
import {Id, Market, IBlue} from "../interfaces/IBlue.sol";

import {FixedPointMathLib} from "../libraries/FixedPointMathLib.sol";
import {MarketLib} from "../libraries/MarketLib.sol";

contract IrmMock is IIrm {
    using FixedPointMathLib for uint256;
    using MarketLib for Market;

    IBlue private immutable BLUE;

    constructor(IBlue blue) {
        BLUE = blue;
    }

    function borrowRate(Market memory market) external view returns (uint256) {
        Id id = market.id();
        uint256 utilization = BLUE.totalBorrow(id).divWadDown(BLUE.totalSupply(id));

        // Divide by the number of seconds in a year.
        // This is a very simple model (to refine later) where x% utilization corresponds to x% APR.
        return utilization / 365 days;
    }
}