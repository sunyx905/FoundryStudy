// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.18;
import{Test,console} from "forge-std/Test.sol";
import{FundMe} from"../src/FundMe.sol";
import {HelpConfig} from "../script/HelpConfig.s.sol";
import{DeployFundMe} from"../script/DeployFundMe.s.sol";
contract FundMeTesting is Test {
    FundMe fundme;
    //makeaddr 输入一个名字 返回一个假地址
    address USER = makeAddr("frank");
    function setUp() external {
        DeployFundMe deploy = new DeployFundMe();
        fundme = deploy.run();
        deal(USER,1 ether);  //deal 给测试地址添加资金
    }

    // function testGetVersion() public view{
    //     uint256 num =  fundme.getVersion();
    //     assertEq(num,4);
    //     console.log(num);


    function testFund() public{
        vm.expectRevert();
        fundme.fund{value:0.1 ether}();
    }
}