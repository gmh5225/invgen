/// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

///  @dev Library for managing
///  https://en.wikipedia.org/wiki/Set_(abstract_data_type)[sets] of primitive
///  types.
///  Sets have the following properties:
///  - Elements are added, removed, and checked for existence in constant time
///  (O(1)).
///  - Elements are enumerated in O(n). No guarantees are made on the ordering.
///  ```
///  contract Example {
///      // Add the library methods
///      using EnumerableSet for EnumerableSet.AddressSet;
///      // Declare a set state variable
///      EnumerableSet.AddressSet private mySet;
///  }
///  ```
///  As of v3.3.0, sets of type `bytes32` (`Bytes32Set`), `address` (`AddressSet`)
///  and `uint256` (`UintSet`) are supported.
library EnumerableSet {
    struct Set {
        bytes32[] _values;
        mapping(bytes32 => uint256) _indexes;
    }

    struct Bytes32Set {
        Set _inner;
    }

    struct AddressSet {
        Set _inner;
    }

    struct UintSet {
        Set _inner;
    }

    ///  @dev Add a value to a set. O(1).
    ///  Returns true if the value was added to the set, that is if it was not
    ///  already present.
    function _add(Set storage set, bytes32 value) private returns (bool) {
        if (!_contains(set, value)) {
            set._values.push(value);
            set._indexes[value] = set._values.length;
            return true;
        } else {
            return false;
        }
    }

    ///  @dev Removes a value from a set. O(1).
    ///  Returns true if the value was removed from the set, that is if it was
    ///  present.
    function _remove(Set storage set, bytes32 value) private returns (bool) {
        uint256 valueIndex = set._indexes[value];
        if (valueIndex != 0) {
            uint256 toDeleteIndex = valueIndex - 1;
            uint256 lastIndex = set._values.length - 1;
            bytes32 lastvalue = set._values[lastIndex];
            set._values[toDeleteIndex] = lastvalue;
            set._indexes[lastvalue] = toDeleteIndex + 1;
            set._values.pop();
            delete set._indexes[value];
            return true;
        } else {
            return false;
        }
    }

    ///  @dev Returns true if the value is in the set. O(1).
    function _contains(Set storage set, bytes32 value) public view returns (bool) {
        return set._indexes[value] != 0;
    }

    ///  @dev Returns the number of values on the set. O(1).
    function _length(Set storage set) public view returns (uint256) {
        return set._values.length;
    }

    ///  @dev Returns the value stored at position `index` in the set. O(1).
    ///  Note that there are no guarantees on the ordering of values inside the
    ///  array, and it may change when more values are added or removed.
    ///  Requirements:
    ///  - `index` must be strictly less than {length}.
    function _at(Set storage set, uint256 index) public view returns (bytes32) {
        require(set._values.length > index, "EnumerableSet: index out of bounds");
        return set._values[index];
    }

    ///  @dev Add a value to a set. O(1).
    ///  Returns true if the value was added to the set, that is if it was not
    ///  already present.
    function add(Bytes32Set storage set, bytes32 value) internal returns (bool) {
        return _add(set._inner, value);
    }

    ///  @dev Removes a value from a set. O(1).
    ///  Returns true if the value was removed from the set, that is if it was
    ///  present.
    function remove(Bytes32Set storage set, bytes32 value) internal returns (bool) {
        return _remove(set._inner, value);
    }

    ///  @dev Returns true if the value is in the set. O(1).
    function contains(Bytes32Set storage set, bytes32 value) public view returns (bool) {
        return _contains(set._inner, value);
    }

    ///  @dev Returns the number of values in the set. O(1).
    function length(Bytes32Set storage set) public view returns (uint256) {
        return _length(set._inner);
    }

    ///  @dev Returns the value stored at position `index` in the set. O(1).
    ///  Note that there are no guarantees on the ordering of values inside the
    ///  array, and it may change when more values are added or removed.
    ///  Requirements:
    ///  - `index` must be strictly less than {length}.
    function at(Bytes32Set storage set, uint256 index) public view returns (bytes32) {
        return _at(set._inner, index);
    }

    ///  @dev Add a value to a set. O(1).
    ///  Returns true if the value was added to the set, that is if it was not
    ///  already present.
    function add(AddressSet storage set, address value) internal returns (bool) {
        return _add(set._inner, bytes32(uint256(uint160(value))));
    }

    ///  @dev Removes a value from a set. O(1).
    ///  Returns true if the value was removed from the set, that is if it was
    ///  present.
    function remove(AddressSet storage set, address value) internal returns (bool) {
        return _remove(set._inner, bytes32(uint256(uint160(value))));
    }

    ///  @dev Returns true if the value is in the set. O(1).
    function contains(AddressSet storage set, address value) public view returns (bool) {
        return _contains(set._inner, bytes32(uint256(uint160(value))));
    }

    ///  @dev Returns the number of values in the set. O(1).
    function length(AddressSet storage set) public view returns (uint256) {
        return _length(set._inner);
    }

    ///  @dev Returns the value stored at position `index` in the set. O(1).
    ///  Note that there are no guarantees on the ordering of values inside the
    ///  array, and it may change when more values are added or removed.
    ///  Requirements:
    ///  - `index` must be strictly less than {length}.
    function at(AddressSet storage set, uint256 index) public view returns (address) {
        return address(uint160(uint256(_at(set._inner, index))));
    }

    ///  @dev Add a value to a set. O(1).
    ///  Returns true if the value was added to the set, that is if it was not
    ///  already present.
    function add(UintSet storage set, uint256 value) internal returns (bool) {
        return _add(set._inner, bytes32(value));
    }

    ///  @dev Removes a value from a set. O(1).
    ///  Returns true if the value was removed from the set, that is if it was
    ///  present.
    function remove(UintSet storage set, uint256 value) internal returns (bool) {
        return _remove(set._inner, bytes32(value));
    }

    ///  @dev Returns true if the value is in the set. O(1).
    function contains(UintSet storage set, uint256 value) public view returns (bool) {
        return _contains(set._inner, bytes32(value));
    }

    ///  @dev Returns the number of values on the set. O(1).
    function length(UintSet storage set) public view returns (uint256) {
        return _length(set._inner);
    }

    ///  @dev Returns the value stored at position `index` in the set. O(1).
    ///  Note that there are no guarantees on the ordering of values inside the
    ///  array, and it may change when more values are added or removed.
    ///  Requirements:
    ///  - `index` must be strictly less than {length}.
    function at(UintSet storage set, uint256 index) public view returns (uint256) {
        return uint256(_at(set._inner, index));
    }
}

///  @dev Collection of functions related to the address type
library Address {
    ///  @dev Returns true if `account` is a contract.
    ///  [IMPORTANT]
    ///  ====
    ///  It is unsafe to assume that an address for which this function returns
    ///  false is an externally-owned account (EOA) and not a contract.
    ///  Among others, `isContract` will return false for the following
    ///  types of addresses:
    ///   - an externally-owned account
    ///   - a contract in construction
    ///   - an address where a contract will be created
    ///   - an address where a contract lived, but was destroyed
    ///  ====
    function isContract(address account) public view returns (bool) {
        uint256 size;
        assembly {
            size := extcodesize(account)
        }
        return size > 0;
    }

    ///  @dev Replacement for Solidity's `transfer`: sends `amount` wei to
    ///  `recipient`, forwarding all available gas and reverting on errors.
    ///  https://eips.ethereum.org/EIPS/eip-1884[EIP1884] increases the gas cost
    ///  of certain opcodes, possibly making contracts go over the 2300 gas limit
    ///  imposed by `transfer`, making them unable to receive funds via
    ///  `transfer`. {sendValue} removes this limitation.
    ///  https://diligence.consensys.net/posts/2019/09/stop-using-soliditys-transfer-now/[Learn more].
    ///  IMPORTANT: because control is transferred to `recipient`, care must be
    ///  taken to not create reentrancy vulnerabilities. Consider using
    ///  {ReentrancyGuard} or the
    ///  https://solidity.readthedocs.io/en/v0.5.11/security-considerations.html#use-the-checks-effects-interactions-pattern[checks-effects-interactions pattern].
    function sendValue(address payable recipient, uint256 amount) internal {
        require(address(this).balance >= amount, "Address: insufficient balance");
        (bool success, ) = recipient.call{value: amount}("");
        require(success, "Address: unable to send value, recipient may have reverted");
    }

    ///  @dev Performs a Solidity function call using a low level `call`. A
    ///  plain`call` is an unsafe replacement for a function call: use this
    ///  function instead.
    ///  If `target` reverts with a revert reason, it is bubbled up by this
    ///  function (like regular Solidity function calls).
    ///  Returns the raw returned data. To convert to the expected return value,
    ///  use https://solidity.readthedocs.io/en/latest/units-and-global-variables.html?highlight=abi.decode#abi-encoding-and-decoding-functions[`abi.decode`].
    ///  Requirements:
    ///  - `target` must be a contract.
    ///  - calling `target` with `data` must not revert.
    ///  _Available since v3.1._
    function functionCall(address target, bytes memory data) internal returns (bytes memory) {
        return functionCall(target, data, "Address: low-level call failed");
    }

    ///  @dev Same as {xref-Address-functionCall-address-bytes-}[`functionCall`], but with
    ///  `errorMessage` as a fallback revert reason when `target` reverts.
    ///  _Available since v3.1._
    function functionCall(address target, bytes memory data, string memory errorMessage) internal returns (bytes memory) {
        return functionCallWithValue(target, data, 0, errorMessage);
    }

    ///  @dev Same as {xref-Address-functionCall-address-bytes-}[`functionCall`],
    ///  but also transferring `value` wei to `target`.
    ///  Requirements:
    ///  - the calling contract must have an ETH balance of at least `value`.
    ///  - the called Solidity function must be `payable`.
    ///  _Available since v3.1._
    function functionCallWithValue(address target, bytes memory data, uint256 value) internal returns (bytes memory) {
        return functionCallWithValue(target, data, value, "Address: low-level call with value failed");
    }

    ///  @dev Same as {xref-Address-functionCallWithValue-address-bytes-uint256-}[`functionCallWithValue`], but
    ///  with `errorMessage` as a fallback revert reason when `target` reverts.
    ///  _Available since v3.1._
    function functionCallWithValue(address target, bytes memory data, uint256 value, string memory errorMessage) internal returns (bytes memory) {
        require(address(this).balance >= value, "Address: insufficient balance for call");
        require(isContract(target), "Address: call to non-contract");
        (bool success, bytes memory returndata) = target.call{value: value}(data);
        return _verifyCallResult(success, returndata, errorMessage);
    }

    ///  @dev Same as {xref-Address-functionCall-address-bytes-}[`functionCall`],
    ///  but performing a static call.
    ///  _Available since v3.3._
    function functionStaticCall(address target, bytes memory data) public view returns (bytes memory) {
        return functionStaticCall(target, data, "Address: low-level static call failed");
    }

    ///  @dev Same as {xref-Address-functionCall-address-bytes-string-}[`functionCall`],
    ///  but performing a static call.
    ///  _Available since v3.3._
    function functionStaticCall(address target, bytes memory data, string memory errorMessage) public view returns (bytes memory) {
        require(isContract(target), "Address: static call to non-contract");
        (bool success, bytes memory returndata) = target.staticcall(data);
        return _verifyCallResult(success, returndata, errorMessage);
    }

    ///  @dev Same as {xref-Address-functionCall-address-bytes-}[`functionCall`],
    ///  but performing a delegate call.
    ///  _Available since v3.4._
    function functionDelegateCall(address target, bytes memory data) internal returns (bytes memory) {
        return functionDelegateCall(target, data, "Address: low-level delegate call failed");
    }

    ///  @dev Same as {xref-Address-functionCall-address-bytes-string-}[`functionCall`],
    ///  but performing a delegate call.
    ///  _Available since v3.4._
    function functionDelegateCall(address target, bytes memory data, string memory errorMessage) internal returns (bytes memory) {
        require(isContract(target), "Address: delegate call to non-contract");
        (bool success, bytes memory returndata) = target.delegatecall(data);
        return _verifyCallResult(success, returndata, errorMessage);
    }

    function _verifyCallResult(bool success, bytes memory returndata, string memory errorMessage) public pure returns (bytes memory) {
        if (success) {
            return returndata;
        } else {
            if (returndata.length > 0) {
                assembly {
                    let returndata_size := mload(returndata)
                    revert(add(32, returndata), returndata_size)
                }
            } else {
                revert(errorMessage);
            }
        }
    }
}

abstract contract Context {
    function _msgSender() virtual public view returns (address payable) {
        return payable(msg.sender);
    }

    function _msgData() virtual public view returns (bytes memory) {
        this;
        return msg.data;
    }
}

abstract contract Signers is Context {
    using EnumerableSet for EnumerableSet.AddressSet;
    using Address for address;

    event SignerAdded(address signer, address sender);

    event SignerRemoved(address signer, address sender);

    EnumerableSet.AddressSet internal signers;

    function _containsSigner(address _signer) virtual public view returns (bool) {
        return signers.contains(_signer);
    }

    function _signersLength() public view returns (uint256) {
        return signers.length();
    }

    function _setupSigner(address _signer) virtual internal {
        _addSigner(_signer);
    }

    function _revokeSigner(address _signer) virtual internal {
        _removeSigner(_signer);
    }

    function _removeSigner(address _signer) private {
        if (signers.remove(_signer)) {
            emit SignerRemoved(_signer, _msgSender());
        }
    }

    function _addSigner(address _signer) private {
        if (signers.add(_signer)) {
            emit SignerAdded(_signer, _msgSender());
        }
    }
}

///  @dev Contract module which provides a basic access control mechanism, where
///  there is an account (an owner) that can be granted exclusive access to
///  specific functions.
///  By default, the owner account will be the one that deploys the contract. This
///  can later be changed with {transferOwnership}.
///  This module is used through inheritance. It will make available the modifier
///  `onlyOwner`, which can be applied to your functions to restrict their use to
///  the owner.
abstract contract Ownable is Context {
    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    address public _owner;

    ///  @dev Throws if called by any account other than the owner.
    modifier onlyOwner() {
        require(owner() == _msgSender(), "Ownable: caller is not the owner");
        _;
    }

    ///  @dev Initializes the contract setting the deployer as the initial owner.
    constructor() {
        address msgSender = _msgSender();
        _owner = msgSender;
        emit OwnershipTransferred(address(0), msgSender);
    }

    ///  @dev Returns the address of the current owner.
    function owner() virtual public view returns (address) {
        return _owner;
    }

    ///  @dev Leaves the contract without owner. It will not be possible to call
    ///  `onlyOwner` functions anymore. Can only be called by the current owner.
    ///  NOTE: Renouncing ownership will leave the contract without an owner,
    ///  thereby removing any functionality that is only available to the owner.
    function renounceOwnership() virtual public onlyOwner() {
        emit OwnershipTransferred(_owner, address(0));
        _owner = address(0);
    }

    ///  @dev Transfers ownership of the contract to a new account (`newOwner`).
    ///  Can only be called by the current owner.
    function transferOwnership(address newOwner) virtual public onlyOwner() {
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        emit OwnershipTransferred(_owner, newOwner);
        _owner = newOwner;
    }
}

///  @dev Wrappers over Solidity's arithmetic operations with added overflow
///  checks.
///  Arithmetic operations in Solidity wrap on overflow. This can easily result
///  in bugs, because programmers usually assume that an overflow raises an
///  error, which is the standard behavior in high level programming languages.
///  `SafeMath` restores this intuition by reverting the transaction when an
///  operation overflows.
///  Using this library instead of the unchecked operations eliminates an entire
///  class of bugs, so it's recommended to use it always.
library SafeMath {
    ///  @dev Returns the addition of two unsigned integers, with an overflow flag.
    ///  _Available since v3.4._
    function tryAdd(uint256 a, uint256 b) public pure returns (bool, uint256) {
        uint256 c = a + b;
        if (c < a) return (false, 0);
        return (true, c);
    }

    ///  @dev Returns the substraction of two unsigned integers, with an overflow flag.
    ///  _Available since v3.4._
    function trySub(uint256 a, uint256 b) public pure returns (bool, uint256) {
        if (b > a) return (false, 0);
        return (true, a - b);
    }

    ///  @dev Returns the multiplication of two unsigned integers, with an overflow flag.
    ///  _Available since v3.4._
    function tryMul(uint256 a, uint256 b) public pure returns (bool, uint256) {
        if (a == 0) return (true, 0);
        uint256 c = a * b;
        if ((c / a) != b) return (false, 0);
        return (true, c);
    }

    ///  @dev Returns the division of two unsigned integers, with a division by zero flag.
    ///  _Available since v3.4._
    function tryDiv(uint256 a, uint256 b) public pure returns (bool, uint256) {
        if (b == 0) return (false, 0);
        return (true, a / b);
    }

    ///  @dev Returns the remainder of dividing two unsigned integers, with a division by zero flag.
    ///  _Available since v3.4._
    function tryMod(uint256 a, uint256 b) public pure returns (bool, uint256) {
        if (b == 0) return (false, 0);
        return (true, a % b);
    }

    ///  @dev Returns the addition of two unsigned integers, reverting on
    ///  overflow.
    ///  Counterpart to Solidity's `+` operator.
    ///  Requirements:
    ///  - Addition cannot overflow.
    function add(uint256 a, uint256 b) public pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");
        return c;
    }

    ///  @dev Returns the subtraction of two unsigned integers, reverting on
    ///  overflow (when the result is negative).
    ///  Counterpart to Solidity's `-` operator.
    ///  Requirements:
    ///  - Subtraction cannot overflow.
    function sub(uint256 a, uint256 b) public pure returns (uint256) {
        require(b <= a, "SafeMath: subtraction overflow");
        return a - b;
    }

    ///  @dev Returns the multiplication of two unsigned integers, reverting on
    ///  overflow.
    ///  Counterpart to Solidity's `*` operator.
    ///  Requirements:
    ///  - Multiplication cannot overflow.
    function mul(uint256 a, uint256 b) public pure returns (uint256) {
        if (a == 0) return 0;
        uint256 c = a * b;
        require((c / a) == b, "SafeMath: multiplication overflow");
        return c;
    }

    ///  @dev Returns the integer division of two unsigned integers, reverting on
    ///  division by zero. The result is rounded towards zero.
    ///  Counterpart to Solidity's `/` operator. Note: this function uses a
    ///  `revert` opcode (which leaves remaining gas untouched) while Solidity
    ///  uses an invalid opcode to revert (consuming all remaining gas).
    ///  Requirements:
    ///  - The divisor cannot be zero.
    function div(uint256 a, uint256 b) public pure returns (uint256) {
        require(b > 0, "SafeMath: division by zero");
        return a / b;
    }

    ///  @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
    ///  reverting when dividing by zero.
    ///  Counterpart to Solidity's `%` operator. This function uses a `revert`
    ///  opcode (which leaves remaining gas untouched) while Solidity uses an
    ///  invalid opcode to revert (consuming all remaining gas).
    ///  Requirements:
    ///  - The divisor cannot be zero.
    function mod(uint256 a, uint256 b) public pure returns (uint256) {
        require(b > 0, "SafeMath: modulo by zero");
        return a % b;
    }

    ///  @dev Returns the subtraction of two unsigned integers, reverting with custom message on
    ///  overflow (when the result is negative).
    ///  CAUTION: This function is deprecated because it requires allocating memory for the error
    ///  message unnecessarily. For custom revert reasons use {trySub}.
    ///  Counterpart to Solidity's `-` operator.
    ///  Requirements:
    ///  - Subtraction cannot overflow.
    function sub(uint256 a, uint256 b, string memory errorMessage) public pure returns (uint256) {
        require(b <= a, errorMessage);
        return a - b;
    }

    ///  @dev Returns the integer division of two unsigned integers, reverting with custom message on
    ///  division by zero. The result is rounded towards zero.
    ///  CAUTION: This function is deprecated because it requires allocating memory for the error
    ///  message unnecessarily. For custom revert reasons use {tryDiv}.
    ///  Counterpart to Solidity's `/` operator. Note: this function uses a
    ///  `revert` opcode (which leaves remaining gas untouched) while Solidity
    ///  uses an invalid opcode to revert (consuming all remaining gas).
    ///  Requirements:
    ///  - The divisor cannot be zero.
    function div(uint256 a, uint256 b, string memory errorMessage) public pure returns (uint256) {
        require(b > 0, errorMessage);
        return a / b;
    }

    ///  @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
    ///  reverting with custom message when dividing by zero.
    ///  CAUTION: This function is deprecated because it requires allocating memory for the error
    ///  message unnecessarily. For custom revert reasons use {tryMod}.
    ///  Counterpart to Solidity's `%` operator. This function uses a `revert`
    ///  opcode (which leaves remaining gas untouched) while Solidity uses an
    ///  invalid opcode to revert (consuming all remaining gas).
    ///  Requirements:
    ///  - The divisor cannot be zero.
    function mod(uint256 a, uint256 b, string memory errorMessage) public pure returns (uint256) {
        require(b > 0, errorMessage);
        return a % b;
    }
}

interface IBEP20 {
    ///  @dev Emitted when `value` tokens are moved from one account (`from`) to
    ///  another (`to`).
    ///  Note that `value` may be zero.
    event Transfer(address indexed from, address indexed to, uint256 value);

    ///  @dev Emitted when the allowance of a `spender` for an `owner` is set by
    ///  a call to {approve}. `value` is the new allowance.
    event Approval(address indexed owner, address indexed spender, uint256 value);

    ///  @dev Returns the amount of tokens in existence.
    function totalSupply() external view returns (uint256);

    ///  @dev Returns the token decimals.
    function decimals() external view returns (uint8);

    ///  @dev Returns the token symbol.
    function symbol() external view returns (string memory);

    ///  @dev Returns the token name.
    function name() external view returns (string memory);

    ///  @dev Returns the bep token owner.
    function getOwner() external view returns (address);

    ///  @dev Returns the amount of tokens owned by `account`.
    function balanceOf(address account) external view returns (uint256);

    ///  @dev Moves `amount` tokens from the caller's account to `recipient`.
    ///  Returns a boolean value indicating whether the operation succeeded.
    ///  Emits a {Transfer} event.
    function transfer(address recipient, uint256 amount) external returns (bool);

    ///  @dev Returns the remaining number of tokens that `spender` will be
    ///  allowed to spend on behalf of `owner` through {transferFrom}. This is
    ///  zero by default.
    ///  This value changes when {approve} or {transferFrom} are called.
    function allowance(address _owner, address spender) external view returns (uint256);

    ///  @dev Sets `amount` as the allowance of `spender` over the caller's tokens.
    ///  Returns a boolean value indicating whether the operation succeeded.
    ///  IMPORTANT: Beware that changing an allowance with this method brings the risk
    ///  that someone may use both the old and the new allowance by unfortunate
    ///  transaction ordering. One possible solution to mitigate this race
    ///  condition is to first reduce the spender's allowance to 0 and set the
    ///  desired value afterwards:
    ///  https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
    ///  Emits an {Approval} event.
    function approve(address spender, uint256 amount) external returns (bool);

    ///  @dev Moves `amount` tokens from `sender` to `recipient` using the
    ///  allowance mechanism. `amount` is then deducted from the caller's
    ///  allowance.
    ///  Returns a boolean value indicating whether the operation succeeded.
    ///  Emits a {Transfer} event.
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);
}

contract BEP20 is Context, IBEP20, Ownable {
    using SafeMath for uint256;

    uint256 public _totalSupply;
    uint8 public _decimals;
    string public _symbol;
    string public _name;
    mapping(address => uint256) public _balances;
    mapping(address => mapping(address => uint256)) public _allowances;

    constructor(string memory _n, string memory _s) {
        _decimals = 18;
        _name = _n;
        _symbol = _s;
    }

    ///  @dev Returns the bep token owner.
    function getOwner() override public view returns (address) {
        return owner();
    }

    ///  @dev Returns the token decimals.
    function decimals() override public view returns (uint8) {
        return _decimals;
    }

    ///  @dev Returns the token symbol.
    function symbol() override public view returns (string memory) {
        return _symbol;
    }

    ///  @dev Returns the token name.
    function name() override public view returns (string memory) {
        return _name;
    }

    ///  @dev See {BEP20-totalSupply}.
    function totalSupply() override public view returns (uint256) {
        return _totalSupply;
    }

    ///  @dev See {BEP20-balanceOf}.
    function balanceOf(address account) override public view returns (uint256) {
        return _balances[account];
    }

    ///  @dev See {BEP20-transfer}.
    ///  Requirements:
    ///  - `recipient` cannot be the zero address.
    ///  - the caller must have a balance of at least `amount`.
    function transfer(address recipient, uint256 amount) override public returns (bool) {
        _transfer(_msgSender(), recipient, amount);
        return true;
    }

    ///  @dev See {BEP20-allowance}.
    function allowance(address owner, address spender) override public view returns (uint256) {
        return _allowances[owner][spender];
    }

    ///  @dev See {BEP20-approve}.
    ///  Requirements:
    ///  - `spender` cannot be the zero address.
    function approve(address spender, uint256 amount) override external returns (bool) {
        _approve(_msgSender(), spender, amount);
        return true;
    }

    ///  @dev See {BEP20-transferFrom}.
    ///  Emits an {Approval} event indicating the updated allowance. This is not
    ///  required by the EIP. See the note at the beginning of {BEP20};
    ///  Requirements:
    ///  - `sender` and `recipient` cannot be the zero address.
    ///  - `sender` must have a balance of at least `amount`.
    ///  - the caller must have allowance for `sender`'s tokens of at least
    ///  `amount`.
    function transferFrom(address sender, address recipient, uint256 amount) override public returns (bool) {
        _transfer(sender, recipient, amount);
        _approve(sender, _msgSender(), _allowances[sender][_msgSender()].sub(amount, "BEP20: transfer amount exceeds allowance"));
        return true;
    }

    ///  @dev Atomically increases the allowance granted to `spender` by the caller.
    ///  This is an alternative to {approve} that can be used as a mitigation for
    ///  problems described in {BEP20-approve}.
    ///  Emits an {Approval} event indicating the updated allowance.
    ///  Requirements:
    ///  - `spender` cannot be the zero address.
    function increaseAllowance(address spender, uint256 addedValue) public returns (bool) {
        _approve(_msgSender(), spender, _allowances[_msgSender()][spender].add(addedValue));
        return true;
    }

    ///  @dev Atomically decreases the allowance granted to `spender` by the caller.
    ///  This is an alternative to {approve} that can be used as a mitigation for
    ///  problems described in {BEP20-approve}.
    ///  Emits an {Approval} event indicating the updated allowance.
    ///  Requirements:
    ///  - `spender` cannot be the zero address.
    ///  - `spender` must have allowance for the caller of at least
    ///  `subtractedValue`.
    function decreaseAllowance(address spender, uint256 subtractedValue) public returns (bool) {
        _approve(_msgSender(), spender, _allowances[_msgSender()][spender].sub(subtractedValue, "BEP20: decreased allowance below zero"));
        return true;
    }

    ///  @dev Moves tokens `amount` from `sender` to `recipient`.
    ///  This is internal function is equivalent to {transfer}, and can be used to
    ///  e.g. implement automatic token fees, slashing mechanisms, etc.
    ///  Emits a {Transfer} event.
    ///  Requirements:
    ///  - `sender` cannot be the zero address.
    ///  - `recipient` cannot be the zero address.
    ///  - `sender` must have a balance of at least `amount`.
    function _transfer(address sender, address recipient, uint256 amount) internal {
        require(sender != address(0), "BEP20: transfer from the zero address");
        require(recipient != address(0), "BEP20: transfer to the zero address");
        _balances[sender] = _balances[sender].sub(amount, "BEP20: transfer amount exceeds balance");
        _balances[recipient] = _balances[recipient].add(amount);
        emit Transfer(sender, recipient, amount);
    }

    /// @dev Creates `amount` tokens and assigns them to `account`, increasing
    ///  the total supply.
    ///  Emits a {Transfer} event with `from` set to the zero address.
    ///  Requirements
    ///  - `to` cannot be the zero address.
    function _mint(address account, uint256 amount) internal {
        require(account != address(0), "BEP20: mint to the zero address");
        _totalSupply = _totalSupply.add(amount);
        _balances[account] = _balances[account].add(amount);
        emit Transfer(address(0), account, amount);
    }

    ///  @dev Destroys `amount` tokens from `account`, reducing the
    ///  total supply.
    ///  Emits a {Transfer} event with `to` set to the zero address.
    ///  Requirements
    ///  - `account` cannot be the zero address.
    ///  - `account` must have at least `amount` tokens.
    function _burn(address account, uint256 amount) internal {
        require(account != address(0), "BEP20: burn from the zero address");
        _balances[account] = _balances[account].sub(amount, "BEP20: burn amount exceeds balance");
        _totalSupply = _totalSupply.sub(amount);
        emit Transfer(account, address(0), amount);
    }

    ///  @dev Sets `amount` as the allowance of `spender` over the `owner`s tokens.
    ///  This is internal function is equivalent to `approve`, and can be used to
    ///  e.g. set automatic allowances for certain subsystems, etc.
    ///  Emits an {Approval} event.
    ///  Requirements:
    ///  - `owner` cannot be the zero address.
    ///  - `spender` cannot be the zero address.
    function _approve(address owner, address spender, uint256 amount) internal {
        require(owner != address(0), "BEP20: approve from the zero address");
        require(spender != address(0), "BEP20: approve to the zero address");
        _allowances[owner][spender] = amount;
        emit Approval(owner, spender, amount);
    }

    ///  @dev Destroys `amount` tokens from `account`.`amount` is then deducted
    ///  from the caller's allowance.
    ///  See {_burn} and {_approve}.
    function _burnFrom(address account, uint256 amount) internal {
        _burn(account, amount);
        _approve(account, _msgSender(), _allowances[account][_msgSender()].sub(amount, "BEP20: burn amount exceeds allowance"));
    }
}

contract BGeoToken is BEP20, Signers {
    using SafeMath for uint256;

    uint8 internal constant bsc = 0;
    mapping(string => bool) public txHashes;

    modifier isSigned(string memory _txHash, uint256 _amount, bytes32[] memory _r, bytes32[] memory _s, uint8[] memory _v) {
        require(checkSignParams(_r, _s, _v), "bad-sign-params");
        bytes32 _hash = keccak256(abi.encodePacked(bsc, msg.sender, _txHash, _amount));
        address[] memory _signers = new address[](_r.length);
        for (uint8 i = 0; i < _r.length; i++) {
            _signers[i] = ecrecover(_hash, _v[i], _r[i], _s[i]);
        }
        require(isSigners(_signers), "bad-signers");
        _;
    }

    constructor(address[] memory _signers) BEP20("Binance GeoDB Coin","BGEO") {
        for (uint i = 0; i < _signers.length; i++) {
            _setupSigner(_signers[i]);
        }
    }

    function isSigners(address[] memory _signers) public view returns (bool) {
        for (uint8 i = 0; i < _signers.length; i++) {
            if (!_containsSigner(_signers[i])) {
                return false;
            }
        }
        return true;
    }

    function checkSignParams(bytes32[] memory _r, bytes32[] memory _s, uint8[] memory _v) public view returns (bool) {
        return (_r.length == _s.length) && (_s.length == _v.length);
    }

    function mint(uint256 _amount, string memory _txHash, address _receiver, bytes32[] memory _r, bytes32[] memory _s, uint8[] memory _v) external isSigned(_txHash,_amount,_r,_s,_v) returns (bool) {
        require(!txHashes[_txHash], "tx-hash-used");
        txHashes[_txHash] = true;
        _mint(_receiver, _amount);
        return true;
    }

    function burn(uint256 _amount) external returns (bool) {
        require(balanceOf(msg.sender) >= _amount, "balance-too-low");
        _burn(msg.sender, _amount);
        return true;
    }

    function revokeSigner(address _signer) external onlyOwner() {
        _revokeSigner(_signer);
    }

    function addSigner(address _signer) external onlyOwner() {
        _setupSigner(_signer);
    }
}

contract ProjectSetup {
    BGeoToken public bGeoToken;

    function setUp() public {
        address[] memory _signers = new address[](3);
        _signers[0] = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
        _signers[1] = 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2;
        _signers[2] = 0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db;
        bGeoToken = new BGeoToken(_signers);
    }
}