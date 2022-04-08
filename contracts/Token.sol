//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Token is ERC721, Ownable {

    uint256 COUNTER = 0;
    constructor(string memory _name, string memory _symbol) ERC721(_name, _symbol) {}

    function mint(address _to) public onlyOwner() {
        _safeMint(_to, COUNTER);
        COUNTER++;
    }

}
       