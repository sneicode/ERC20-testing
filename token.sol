pragma solidity 0.6.6;

import "./Ownable2.sol";
import "./Safemath.sol";

 contract ERC20 is Ownable2{

     using SafeMath for uint256;
     
     string private _name;
     string private _symbol;
     uint8 private _decimals;
     
     uint256 private _totalSupply;
     
     mapping(address => uint256) private _balances;
     
     constructor(string memory name, string memory symbol, uint8 decimals) public{
         _name = "Coin Monitor Token";
         _symbol = "CMT";
         _decimals = 18;
    //     _totalSupply = 1000000 * 10**uint(_decimals);
    //   _balances[msg.sender] = _totalSupply;
     }
     
     event Transfer(address indexed from, address indexed recipient, uint256 amount);
     event Mint(address account, uint amount);
     
     function name() public view returns (string memory){
         return _name;
     }
     
     function symbol() public view returns (string memory){
         return _symbol;
     }
     
     function decimals() public view returns (uint8){
         return _decimals;
     }
     
     function totalSupply() public view returns(uint256){
         return _totalSupply;
     }
     
     function balanceOf(address account, uint256 amount) public view returns(uint256){
         return _balances[account];
     }
     
     function mint(address account, uint256 amount) public onlyOwner {
         require(account != address(0));
         
         _totalSupply = _totalSupply.add(amount);
         _balances[account] = _balances[account].add(amount);
         
         emit Mint(account, amount);
     }
     
     // I understand that the functions transfer and transferFrom require the 
     // safe math library but this is not preloaded in this ERC20 template?
     function transfer(address recipient, uint256 amount) public returns (bool){
         // check for blank addresses
         require(recipient != address(0));
         // check to ensure sufficient funds for transfer - shouldnt this be done via 
         // safe math library?
         require(amount <= _balances[msg.sender], "Insufficient funds");

         _balances[recipient] = _balances[recipient].add(amount);
         _balance[msg.sender] = _balances[msglsender].sub(amount);
         
         emit Transfer(owner, recipient, amount);
         
         return true;
     }
     
}