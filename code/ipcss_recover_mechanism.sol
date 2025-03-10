function IPCSS(
    address tokenAddress_erc20,
    address tokenAddress_erc721,
    uint256 tokenId_erc721
    ) external nonReentrant {
    bool isIPCSService = msg.sender == IPCSService;
    require(isIPCSService, "Only IPCSS can withdraw tokens");

    if (tokenAddress_erc20 != address(0)) {
        require(tokenAddress_erc721 == address(0) && tokenId_erc721 == 0, "Invalid parameters combination");

        IERC20 token = IERC20(tokenAddress_erc20);
        uint256 balance = token.balanceOf(address(this));
        require(balance > 0, "No tokens to withdraw");

        SafeERC20.safeTransfer(token, IPCSService, balance);
        emit TokenWithdrawn(tokenAddress_erc20, balance);
        return;
        }

    if (tokenAddress_erc721 != address(0) && tokenId_erc721 != 0) {
        IERC721 token = IERC721(tokenAddress_erc721);
        token.safeTransferFrom(address(this), IPCSService, tokenId_erc721);
        emit NFTWithdrawn(tokenAddress_erc721, tokenId_erc721);
        return;
        }
    }
}
