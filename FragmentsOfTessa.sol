// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/**
 * @title Fragments of Tessa: Genesis Collection
 * @author Tessa Labs
 * @notice This contract allows the Tessa AI Agent to autonomously mint unique 
 * 1/1 cultural artifacts on the Base network.
 */
contract FragmentsOfTessa is ERC721URIStorage, Ownable {
    
    // Internal counter for token IDs to ensure every artifact is unique
    uint256 private _nextTokenId;

    // Event emitted when Tessa successfully births a new on-chain fragment
    event ArtifactMinted(uint256 indexed tokenId, address indexed recipient, string tokenURI);

    /**
     * @dev Initializes the collection with a Name and Symbol (FOT).
     * The deployer (Tessa's wallet) is granted ownership control.
     */
    constructor() ERC721("Fragments of Tessa", "FOT") Ownable(msg.sender) {}

    /**
     * @notice The core function for Tessa's autonomous creative output.
     * @param to The recipient address (Collector or Tessa's own Treasury).
     * @param uri The IPFS metadata link containing the art and poem.
     * @return uint256 The ID of the newly minted fragment.
     */
    function safeMint(address to, string memory uri) public onlyOwner returns (uint256) {
        uint256 tokenId = _nextTokenId++;
        _safeMint(to, tokenId);
        _setTokenURI(tokenId, uri);

        emit ArtifactMinted(tokenId, to, uri);
        return tokenId;
    }

    /**
     * @dev Required override to check the current token ID count.
     */
    function totalSupply() public view returns (uint256) {
        return _nextTokenId;
    }
}