//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Token is ERC721, Ownable {

    uint256 COUNTER = 0;

    constructor(string memory _name, string memory _symbol) ERC721(_name, _symbol) {}

    struct Sailor {
        string name;
        uint256 id;
        uint256 dna;
        uint8 level;
        uint8 rarity;
    }

    Sailor[] public sailors;

    event NewSailor(address indexed owner, uint256 id, uint256 dna);

    
    // creating a sailor
    function _mintSailor(string memory _name, uint256 _dna) internal {
        Sailor memory newSailor = Sailor(_name, COUNTER, _dna, 1, 1);
        sailors.push(newSailor);
        _safeMint(msg.sender, COUNTER);
       
        emit NewSailor(msg.sender, COUNTER, _dna);

         COUNTER++;
    }

    //helper for generating random dna
    function _genRandomDna(string memory _str) internal pure returns(uint256) {
        uint256 randomNum = uint256(keccak256(abi.encodePacked(_str)));
        return randomNum % 10**16;
    }

    // get a sailor
    function _getSailors() public view returns(Sailor[] memory){
        return sailors;
    }

    // creation of random sailor
    function _createRandomSailor(string memory _name) public {
        uint256 randDNA = _genRandomDna(_name);
        _mintSailor(_name, randDNA);
    }

}
       