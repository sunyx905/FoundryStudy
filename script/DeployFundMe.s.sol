//SPDX-License-Identifier:MIT
pragma solidity ^0.8.16;
import {Script} from "forge-std/Script.sol";
import {FundMe} from "../src/FundMe.sol";
import {HelpConfig} from "../script/HelpConfig.s.sol";
contract DeployFundMe is Script{
    function run() public returns(FundMe){
        HelpConfig helpConfig = new HelpConfig();
        (address price) = helpConfig.ActNetworkConfiguration();
        // start 之前不会消费真实的gas
        vm.startBroadcast();
        FundMe fundme = new FundMe(price);
        vm.stopBroadcast();
        return fundme;
    }
}