pragma solidity^0.4.25;

import "./lib/openzeppelin-solidity/contracts/token/ERC20/ERC20.sol";
import "./lib/openzeppelin-solidity/contracts/lifecycle/Pausable.sol";
import "./lib/openzeppelin-solidity/contracts/ownership/Ownable.sol";

contract SendReward is Ownable, Pausable {

    ERC20 public coin;
    uint public constant limit = 10;
    
    function setCoinAddress(ERC20 _coinAddress) public onlyOwner() {
        coin = _coinAddress;
    }
    
    function sendCoin(
        uint128 amount,
        address wallet,
        address[limit] addresses
    ) public onlyOwner() {
        for (uint i=0; i<limit; i++) {
            if (addresses[i] != 0x0) {
                coin.transferFrom(wallet, addresses[i], amount);
            }
        }
    }
}