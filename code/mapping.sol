    mapping(address => bool) private isVerified; 
    mapping(address => uint256) public unlockTimes; 
    mapping(address => uint256) public etherBalances;

    event TimeLockSet(address indexed user, uint256 unlockTime);
    event EtherWithdrawn(address indexed recipient, uint256 amount);
    event EtherReceived(address indexed sender, uint256 amount);
    event AddressVerified(address indexed user);
    event TokenWithdrawn(address indexed token, uint256 amount);
    event NFTWithdrawn(address indexed token, uint256 tokenId);
