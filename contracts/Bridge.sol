pragma solidity ^ 0.8.17;

import "contracts/interfaces/IFunCoin.sol";

contract Bridge {

    IFunCoin private _funCoin;

    event Locked(uint256 indexed blockNumber, address indexed account, uint256 indexed amount);

    constructor (address funCoin) {
        _funCoin = IFunCoin(funCoin);
    }

    function lock(uint256 amount) external returns (uint256, address, uint256){
        _funCoin.transferFrom(msg.sender, address(this), amount);
        emit Locked(block.number, msg.sender, amount);
        return (block.number, msg.sender, amount);
    }

}