pragma solidity 0.5.1;

contract ERC20Token {
    string name;
    mapping(address => uint256) public balances;

    function mint() public {
        balances[tx.origin] += 1;
    }
}

contract MyContract {
    address public token;

    address payable wallet;

    constructor(address payable _wallet, address _token) public {
        wallet = _wallet;
        token = _token;
    }

    function buyToken() public payable {
        ERC20Token _token = ERC20Token(address(token));
        _token.mint();
        wallet.transfer(msg.value);
    }
}
