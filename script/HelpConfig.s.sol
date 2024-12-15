// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.16;
import {Script} from"forge-std/Script.sol";
contract HelpConfig {
    NetworkConfig public ActNetworkConfiguration;
    constructor(){
        if (block.chainid==11155111) {
            GetSepoliaPrice();
        }
        else if(block.chainid==1) {
            GetAnvilPrice();
        }
    }
    // 根据chainID 返回对应的ETH/USD的地址
    struct NetworkConfig {
        address priceAdd;
    }

    //1.sepolia测试网
    function GetSepoliaPrice() public{
        NetworkConfig memory naa = NetworkConfig({priceAdd:0x694AA1769357215DE4FAC081bf1f309aDC325306});
        ActNetworkConfiguration = naa;
    }

    //1.Main网
    function GetAnvilPrice() public{
        ActNetworkConfiguration = NetworkConfig({priceAdd:0x5f4eC3Df9cbd43714FE2740f5E3616155c5b8419});
    }
}