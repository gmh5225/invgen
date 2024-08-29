/// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

///  @dev This is a base contract to aid in writing upgradeable contracts, or any kind of contract that will be deployed
///  behind a proxy. Since proxied contracts do not make use of a constructor, it's common to move constructor logic to an
///  external initializer function, usually called `initialize`. It then becomes necessary to protect this initializer
///  function so it can only be called once. The {initializer} modifier provided by this contract will have this effect.
///  The initialization functions use a version number. Once a version number is used, it is consumed and cannot be
///  reused. This mechanism prevents re-execution of each "step" but allows the creation of new initialization steps in
///  case an upgrade adds a module that needs to be initialized.
///  For example:
///  [.hljs-theme-light.nopadding]
///  ```
///  contract MyToken is ERC20Upgradeable {
///      function initialize() initializer public {
///          __ERC20_init("MyToken", "MTK");
///      }
///  }
///  contract MyTokenV2 is MyToken, ERC20PermitUpgradeable {
///      function initializeV2() reinitializer(2) public {
///          __ERC20Permit_init("MyToken");
///      }
///  }
///  ```
///  TIP: To avoid leaving the proxy in an uninitialized state, the initializer function should be called as early as
///  possible by providing the encoded function call as the `_data` argument to {ERC1967Proxy-constructor}.
///  CAUTION: When used with inheritance, manual care must be taken to not invoke a parent initializer twice, or to ensure
///  that all initializers are idempotent. This is not verified automatically as constructors are by Solidity.
///  [CAUTION]
///  ====
///  Avoid leaving a contract uninitialized.
///  An uninitialized contract can be taken over by an attacker. This applies to both a proxy and its implementation
///  contract, which may impact the proxy. To prevent the implementation contract from being used, you should invoke
///  the {_disableInitializers} function in the constructor to automatically lock it when it is deployed:
///  [.hljs-theme-light.nopadding]
///  ```
///  /// @custom:oz-upgrades-unsafe-allow constructor
///  constructor() {
///      _disableInitializers();
///  }
///  ```
///  ====
abstract contract Initializable {
    ///  @dev Triggered when the contract has been initialized or reinitialized.
    event Initialized(uint8 version);

    ///  @dev Indicates that the contract has been initialized.
    ///  @custom:oz-retyped-from bool
    uint8 public _initialized;
    ///  @dev Indicates that the contract is in the process of being initialized.
    bool public _initializing;

    ///  @dev A modifier that defines a protected initializer function that can be invoked at most once. In its scope,
    ///  `onlyInitializing` functions can be used to initialize parent contracts. Equivalent to `reinitializer(1)`.
    modifier initializer() {
        bool isTopLevelCall = _setInitializedVersion(1);
        if (isTopLevelCall) {
            _initializing = true;
        }
        _;
        if (isTopLevelCall) {
            _initializing = false;
            emit Initialized(1);
        }
    }

    ///  @dev A modifier that defines a protected reinitializer function that can be invoked at most once, and only if the
    ///  contract hasn't been initialized to a greater version before. In its scope, `onlyInitializing` functions can be
    ///  used to initialize parent contracts.
    ///  `initializer` is equivalent to `reinitializer(1)`, so a reinitializer may be used after the original
    ///  initialization step. This is essential to configure modules that are added through upgrades and that require
    ///  initialization.
    ///  Note that versions can jump in increments greater than 1; this implies that if multiple reinitializers coexist in
    ///  a contract, executing them in the right order is up to the developer or operator.
    modifier reinitializer(uint8 version) {
        bool isTopLevelCall = _setInitializedVersion(version);
        if (isTopLevelCall) {
            _initializing = true;
        }
        _;
        if (isTopLevelCall) {
            _initializing = false;
            emit Initialized(version);
        }
    }

    ///  @dev Modifier to protect an initialization function so that it can only be invoked by functions with the
    ///  {initializer} and {reinitializer} modifiers, directly or indirectly.
    modifier onlyInitializing() {
        require(_initializing, "Initializable: contract is not initializing");
        _;
    }

    ///  @dev Locks the contract, preventing any future reinitialization. This cannot be part of an initializer call.
    ///  Calling this in the constructor of a contract will prevent that contract from being initialized or reinitialized
    ///  to any version. It is recommended to use this to lock implementation contracts that are designed to be called
    ///  through proxies.
    function _disableInitializers() virtual internal {
        _setInitializedVersion(type(uint8).max);
    }

    function _setInitializedVersion(uint8 version) private returns (bool) {
        if (_initializing) {
            require((version == 1) && (!AddressUpgradeable.isContract(address(this))), "Initializable: contract is already initialized");
            return false;
        } else {
            require(_initialized < version, "Initializable: contract is already initialized");
            _initialized = version;
            return true;
        }
    }
}

abstract contract ContextUpgradeable is Initializable {
    function __Context_init() internal onlyInitializing() {}

    function __Context_init_unchained() internal onlyInitializing() {}

    function _msgSender() virtual public view returns (address) {
        return msg.sender;
    }

    function _msgData() virtual public view returns (bytes calldata) {
        return msg.data;
    }
}

///  @dev Contract module that helps prevent reentrant calls to a function.
///  Inheriting from `ReentrancyGuard` will make the {nonReentrant} modifier
///  available, which can be applied to functions to make sure there are no nested
///  (reentrant) calls to them.
///  Note that because there is a single `nonReentrant` guard, functions marked as
///  `nonReentrant` may not call one another. This can be worked around by making
///  those functions `private`, and then adding `external` `nonReentrant` entry
///  points to them.
///  TIP: If you would like to learn more about reentrancy and alternative ways
///  to protect against it, check out our blog post
///  https://blog.openzeppelin.com/reentrancy-after-istanbul/[Reentrancy After Istanbul].
abstract contract ReentrancyGuardUpgradeable is Initializable {
    uint256 public constant _NOT_ENTERED = 1;
    uint256 public constant _ENTERED = 2;
    uint256 public _status;

    ///  @dev Prevents a contract from calling itself, directly or indirectly.
    ///  Calling a `nonReentrant` function from another `nonReentrant`
    ///  function is not supported. It is possible to prevent this from happening
    ///  by making the `nonReentrant` function external, and making it call a
    ///  `private` function that does the actual work.
    modifier nonReentrant() {
        require(_status != _ENTERED, "ReentrancyGuard: reentrant call");
        _status = _ENTERED;
        _;
        _status = _NOT_ENTERED;
    }

    function __ReentrancyGuard_init() internal onlyInitializing() {
        __ReentrancyGuard_init_unchained();
    }

    function __ReentrancyGuard_init_unchained() internal onlyInitializing() {
        _status = _NOT_ENTERED;
    }
}

interface IPancakePair {
    event Approval(address indexed owner, address indexed spender, uint value);

    event Transfer(address indexed from, address indexed to, uint value);

    event Mint(address indexed sender, uint amount0, uint amount1);

    event Burn(address indexed sender, uint amount0, uint amount1, address indexed to);

    event Swap(address indexed sender, uint amount0In, uint amount1In, uint amount0Out, uint amount1Out, address indexed to);

    event Sync(uint112 reserve0, uint112 reserve1);

    function name() external pure returns (string memory);

    function symbol() external pure returns (string memory);

    function decimals() external pure returns (uint8);

    function totalSupply() external view returns (uint);

    function balanceOf(address owner) external view returns (uint);

    function allowance(address owner, address spender) external view returns (uint);

    function approve(address spender, uint value) external returns (bool);

    function transfer(address to, uint value) external returns (bool);

    function transferFrom(address from, address to, uint value) external returns (bool);

    function DOMAIN_SEPARATOR() external view returns (bytes32);

    function PERMIT_TYPEHASH() external pure returns (bytes32);

    function nonces(address owner) external view returns (uint);

    function permit(address owner, address spender, uint value, uint deadline, uint8 v, bytes32 r, bytes32 s) external;

    function MINIMUM_LIQUIDITY() external pure returns (uint);

    function factory() external view returns (address);

    function token0() external view returns (address);

    function token1() external view returns (address);

    function getReserves() external view returns (uint112 reserve0, uint112 reserve1, uint32 blockTimestampLast);

    function price0CumulativeLast() external view returns (uint);

    function price1CumulativeLast() external view returns (uint);

    function kLast() external view returns (uint);

    function mint(address to) external returns (uint liquidity);

    function burn(address to) external returns (uint amount0, uint amount1);

    function swap(uint amount0Out, uint amount1Out, address to, bytes calldata data) external;

    function skim(address to) external;

    function sync() external;

    function initialize(address, address) external;
}

interface IPancakeFactory {
    event PairCreated(address indexed token0, address indexed token1, address pair, uint);

    function feeTo() external view returns (address);

    function feeToSetter() external view returns (address);

    function getPair(address tokenA, address tokenB) external view returns (address pair);

    function allPairs(uint) external view returns (address pair);

    function allPairsLength() external view returns (uint);

    function createPair(address tokenA, address tokenB) external returns (address pair);

    function setFeeTo(address) external;

    function setFeeToSetter(address) external;
}

library DateTime {
    uint256 internal constant SECONDS_PER_DAY = (24 * 60) * 60;
    uint256 internal constant SECONDS_PER_HOUR = 60 * 60;
    uint256 internal constant SECONDS_PER_MINUTE = 60;
    int256 internal constant OFFSET19700101 = 2440588;
    uint256 internal constant DOW_MON = 1;
    uint256 internal constant DOW_TUE = 2;
    uint256 internal constant DOW_WED = 3;
    uint256 internal constant DOW_THU = 4;
    uint256 internal constant DOW_FRI = 5;
    uint256 internal constant DOW_SAT = 6;
    uint256 internal constant DOW_SUN = 7;

    function _daysFromDate(uint256 year, uint256 month, uint256 day) public pure returns (uint256 _days) {
        require(year >= 1970);
        int256 _year = int256(year);
        int256 _month = int256(month);
        int256 _day = int256(day);
        int256 __days = ((((_day - 32075) + ((1461 * ((_year + 4800) + ((_month - 14) / 12))) / 4)) + ((367 * ((_month - 2) - (((_month - 14) / 12) * 12))) / 12)) - ((3 * (((_year + 4900) + ((_month - 14) / 12)) / 100)) / 4)) - OFFSET19700101;
        _days = uint256(__days);
    }

    function _daysToDate(uint256 _days) public pure returns (uint256 year, uint256 month, uint256 day) {
        int256 __days = int256(_days);
        int256 L = (__days + 68569) + OFFSET19700101;
        int256 N = (4 * L) / 146097;
        L = L - (((146097 * N) + 3) / 4);
        int256 _year = (4000 * (L + 1)) / 1461001;
        L = (L - ((1461 * _year) / 4)) + 31;
        int256 _month = (80 * L) / 2447;
        int256 _day = L - ((2447 * _month) / 80);
        L = _month / 11;
        _month = (_month + 2) - (12 * L);
        _year = ((100 * (N - 49)) + _year) + L;
        year = uint256(_year);
        month = uint256(_month);
        day = uint256(_day);
    }

    function timestampFromDate(uint256 year, uint256 month, uint256 day) public pure returns (uint256 timestamp) {
        timestamp = _daysFromDate(year, month, day) * SECONDS_PER_DAY;
    }

    function timestampFromDateTime(uint256 year, uint256 month, uint256 day, uint256 hour, uint256 minute, uint256 second) public pure returns (uint256 timestamp) {
        timestamp = (((_daysFromDate(year, month, day) * SECONDS_PER_DAY) + (hour * SECONDS_PER_HOUR)) + (minute * SECONDS_PER_MINUTE)) + second;
    }

    function timestampToDate(uint256 timestamp) public pure returns (uint256 year, uint256 month, uint256 day) {
        (year, month, day) = _daysToDate(timestamp / SECONDS_PER_DAY);
    }

    function timestampToDateTime(uint256 timestamp) public pure returns (uint256 year, uint256 month, uint256 day, uint256 hour, uint256 minute, uint256 second) {
        (year, month, day) = _daysToDate(timestamp / SECONDS_PER_DAY);
        uint256 secs = timestamp % SECONDS_PER_DAY;
        hour = secs / SECONDS_PER_HOUR;
        secs = secs % SECONDS_PER_HOUR;
        minute = secs / SECONDS_PER_MINUTE;
        second = secs % SECONDS_PER_MINUTE;
    }

    function isValidDate(uint256 year, uint256 month, uint256 day) public pure returns (bool valid) {
        if (((year >= 1970) && (month > 0)) && (month <= 12)) {
            uint256 daysInMonth = _getDaysInMonth(year, month);
            if ((day > 0) && (day <= daysInMonth)) {
                valid = true;
            }
        }
    }

    function isValidDateTime(uint256 year, uint256 month, uint256 day, uint256 hour, uint256 minute, uint256 second) public pure returns (bool valid) {
        if (isValidDate(year, month, day)) {
            if (((hour < 24) && (minute < 60)) && (second < 60)) {
                valid = true;
            }
        }
    }

    function isLeapYear(uint256 timestamp) public pure returns (bool leapYear) {
        (uint256 year, , ) = _daysToDate(timestamp / SECONDS_PER_DAY);
        leapYear = _isLeapYear(year);
    }

    function _isLeapYear(uint256 year) public pure returns (bool leapYear) {
        leapYear = (((year % 4) == 0) && ((year % 100) != 0)) || ((year % 400) == 0);
    }

    function isWeekDay(uint256 timestamp) public pure returns (bool weekDay) {
        weekDay = getDayOfWeek(timestamp) <= DOW_FRI;
    }

    function isWeekEnd(uint256 timestamp) public pure returns (bool weekEnd) {
        weekEnd = getDayOfWeek(timestamp) >= DOW_SAT;
    }

    function getDaysInMonth(uint256 timestamp) public pure returns (uint256 daysInMonth) {
        (uint256 year, uint256 month, ) = _daysToDate(timestamp / SECONDS_PER_DAY);
        daysInMonth = _getDaysInMonth(year, month);
    }

    function _getDaysInMonth(uint256 year, uint256 month) public pure returns (uint256 daysInMonth) {
        if (((((((month == 1) || (month == 3)) || (month == 5)) || (month == 7)) || (month == 8)) || (month == 10)) || (month == 12)) {
            daysInMonth = 31;
        } else if (month != 2) {
            daysInMonth = 30;
        } else {
            daysInMonth = _isLeapYear(year) ? 29 : 28;
        }
    }

    function getDayOfWeek(uint256 timestamp) public pure returns (uint256 dayOfWeek) {
        uint256 _days = timestamp / SECONDS_PER_DAY;
        dayOfWeek = ((_days + 3) % 7) + 1;
    }

    function getYear(uint256 timestamp) public pure returns (uint256 year) {
        (year, , ) = _daysToDate(timestamp / SECONDS_PER_DAY);
    }

    function getMonth(uint256 timestamp) public pure returns (uint256 month) {
        (, month, ) = _daysToDate(timestamp / SECONDS_PER_DAY);
    }

    function getDay(uint256 timestamp) public pure returns (uint256 day) {
        (, , day) = _daysToDate(timestamp / SECONDS_PER_DAY);
    }

    function getHour(uint256 timestamp) public pure returns (uint256 hour) {
        uint256 secs = timestamp % SECONDS_PER_DAY;
        hour = secs / SECONDS_PER_HOUR;
    }

    function getMinute(uint256 timestamp) public pure returns (uint256 minute) {
        uint256 secs = timestamp % SECONDS_PER_HOUR;
        minute = secs / SECONDS_PER_MINUTE;
    }

    function getSecond(uint256 timestamp) public pure returns (uint256 second) {
        second = timestamp % SECONDS_PER_MINUTE;
    }

    function addYears(uint256 timestamp, uint256 _years) public pure returns (uint256 newTimestamp) {
        (uint256 year, uint256 month, uint256 day) = _daysToDate(timestamp / SECONDS_PER_DAY);
        year += _years;
        uint256 daysInMonth = _getDaysInMonth(year, month);
        if (day > daysInMonth) {
            day = daysInMonth;
        }
        newTimestamp = (_daysFromDate(year, month, day) * SECONDS_PER_DAY) + (timestamp % SECONDS_PER_DAY);
        require(newTimestamp >= timestamp);
    }

    function addMonths(uint256 timestamp, uint256 _months) public pure returns (uint256 newTimestamp) {
        (uint256 year, uint256 month, uint256 day) = _daysToDate(timestamp / SECONDS_PER_DAY);
        month += _months;
        year += (month - 1) / 12;
        month = ((month - 1) % 12) + 1;
        uint256 daysInMonth = _getDaysInMonth(year, month);
        if (day > daysInMonth) {
            day = daysInMonth;
        }
        newTimestamp = (_daysFromDate(year, month, day) * SECONDS_PER_DAY) + (timestamp % SECONDS_PER_DAY);
        require(newTimestamp >= timestamp);
    }

    function addDays(uint256 timestamp, uint256 _days) public pure returns (uint256 newTimestamp) {
        newTimestamp = timestamp + (_days * SECONDS_PER_DAY);
        require(newTimestamp >= timestamp);
    }

    function addHours(uint256 timestamp, uint256 _hours) public pure returns (uint256 newTimestamp) {
        newTimestamp = timestamp + (_hours * SECONDS_PER_HOUR);
        require(newTimestamp >= timestamp);
    }

    function addMinutes(uint256 timestamp, uint256 _minutes) public pure returns (uint256 newTimestamp) {
        newTimestamp = timestamp + (_minutes * SECONDS_PER_MINUTE);
        require(newTimestamp >= timestamp);
    }

    function addSeconds(uint256 timestamp, uint256 _seconds) public pure returns (uint256 newTimestamp) {
        newTimestamp = timestamp + _seconds;
        require(newTimestamp >= timestamp);
    }

    function subYears(uint256 timestamp, uint256 _years) public pure returns (uint256 newTimestamp) {
        (uint256 year, uint256 month, uint256 day) = _daysToDate(timestamp / SECONDS_PER_DAY);
        year -= _years;
        uint256 daysInMonth = _getDaysInMonth(year, month);
        if (day > daysInMonth) {
            day = daysInMonth;
        }
        newTimestamp = (_daysFromDate(year, month, day) * SECONDS_PER_DAY) + (timestamp % SECONDS_PER_DAY);
        require(newTimestamp <= timestamp);
    }

    function subMonths(uint256 timestamp, uint256 _months) public pure returns (uint256 newTimestamp) {
        (uint256 year, uint256 month, uint256 day) = _daysToDate(timestamp / SECONDS_PER_DAY);
        uint256 yearMonth = ((year * 12) + (month - 1)) - _months;
        year = yearMonth / 12;
        month = (yearMonth % 12) + 1;
        uint256 daysInMonth = _getDaysInMonth(year, month);
        if (day > daysInMonth) {
            day = daysInMonth;
        }
        newTimestamp = (_daysFromDate(year, month, day) * SECONDS_PER_DAY) + (timestamp % SECONDS_PER_DAY);
        require(newTimestamp <= timestamp);
    }

    function subDays(uint256 timestamp, uint256 _days) public pure returns (uint256 newTimestamp) {
        newTimestamp = timestamp - (_days * SECONDS_PER_DAY);
        require(newTimestamp <= timestamp);
    }

    function subHours(uint256 timestamp, uint256 _hours) public pure returns (uint256 newTimestamp) {
        newTimestamp = timestamp - (_hours * SECONDS_PER_HOUR);
        require(newTimestamp <= timestamp);
    }

    function subMinutes(uint256 timestamp, uint256 _minutes) public pure returns (uint256 newTimestamp) {
        newTimestamp = timestamp - (_minutes * SECONDS_PER_MINUTE);
        require(newTimestamp <= timestamp);
    }

    function subSeconds(uint256 timestamp, uint256 _seconds) public pure returns (uint256 newTimestamp) {
        newTimestamp = timestamp - _seconds;
        require(newTimestamp <= timestamp);
    }

    function diffYears(uint256 fromTimestamp, uint256 toTimestamp) public pure returns (uint256 _years) {
        require(fromTimestamp <= toTimestamp);
        (uint256 fromYear, , ) = _daysToDate(fromTimestamp / SECONDS_PER_DAY);
        (uint256 toYear, , ) = _daysToDate(toTimestamp / SECONDS_PER_DAY);
        _years = toYear - fromYear;
    }

    function diffMonths(uint256 fromTimestamp, uint256 toTimestamp) public pure returns (uint256 _months) {
        require(fromTimestamp <= toTimestamp);
        (uint256 fromYear, uint256 fromMonth, ) = _daysToDate(fromTimestamp / SECONDS_PER_DAY);
        (uint256 toYear, uint256 toMonth, ) = _daysToDate(toTimestamp / SECONDS_PER_DAY);
        _months = (((toYear * 12) + toMonth) - (fromYear * 12)) - fromMonth;
    }

    function diffDays(uint256 fromTimestamp, uint256 toTimestamp) public pure returns (uint256 _days) {
        require(fromTimestamp <= toTimestamp);
        _days = (toTimestamp - fromTimestamp) / SECONDS_PER_DAY;
    }

    function diffHours(uint256 fromTimestamp, uint256 toTimestamp) public pure returns (uint256 _hours) {
        require(fromTimestamp <= toTimestamp);
        _hours = (toTimestamp - fromTimestamp) / SECONDS_PER_HOUR;
    }

    function diffMinutes(uint256 fromTimestamp, uint256 toTimestamp) public pure returns (uint256 _minutes) {
        require(fromTimestamp <= toTimestamp);
        _minutes = (toTimestamp - fromTimestamp) / SECONDS_PER_MINUTE;
    }

    function diffSeconds(uint256 fromTimestamp, uint256 toTimestamp) public pure returns (uint256 _seconds) {
        require(fromTimestamp <= toTimestamp);
        _seconds = toTimestamp - fromTimestamp;
    }
}

///  @dev Interface of the ERC20 standard as defined in the EIP.
interface IERC20Upgradeable {
    ///  @dev Emitted when `value` tokens are moved from one account (`from`) to
    ///  another (`to`).
    ///  Note that `value` may be zero.
    event Transfer(address indexed from, address indexed to, uint256 value);

    ///  @dev Emitted when the allowance of a `spender` for an `owner` is set by
    ///  a call to {approve}. `value` is the new allowance.
    event Approval(address indexed owner, address indexed spender, uint256 value);

    ///  @dev Returns the amount of tokens in existence.
    function totalSupply() external view returns (uint256);

    ///  @dev Returns the amount of tokens owned by `account`.
    function balanceOf(address account) external view returns (uint256);

    ///  @dev Moves `amount` tokens from the caller's account to `to`.
    ///  Returns a boolean value indicating whether the operation succeeded.
    ///  Emits a {Transfer} event.
    function transfer(address to, uint256 amount) external returns (bool);

    ///  @dev Returns the remaining number of tokens that `spender` will be
    ///  allowed to spend on behalf of `owner` through {transferFrom}. This is
    ///  zero by default.
    ///  This value changes when {approve} or {transferFrom} are called.
    function allowance(address owner, address spender) external view returns (uint256);

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

    ///  @dev Moves `amount` tokens from `from` to `to` using the
    ///  allowance mechanism. `amount` is then deducted from the caller's
    ///  allowance.
    ///  Returns a boolean value indicating whether the operation succeeded.
    ///  Emits a {Transfer} event.
    function transferFrom(address from, address to, uint256 amount) external returns (bool);
}

///  @dev Collection of functions related to the address type
library AddressUpgradeable {
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
    ///  [IMPORTANT]
    ///  ====
    ///  You shouldn't rely on `isContract` to protect against flash loan attacks!
    ///  Preventing calls from contracts is highly discouraged. It breaks composability, breaks support for smart wallets
    ///  like Gnosis Safe, and does not provide security since it can be circumvented by calling from a contract
    ///  constructor.
    ///  ====
    function isContract(address account) public view returns (bool) {
        return account.code.length > 0;
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
    ///  plain `call` is an unsafe replacement for a function call: use this
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
        return verifyCallResult(success, returndata, errorMessage);
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
        return verifyCallResult(success, returndata, errorMessage);
    }

    ///  @dev Tool to verifies that a low level call was successful, and revert if it wasn't, either by bubbling the
    ///  revert reason using the provided one.
    ///  _Available since v4.3._
    function verifyCallResult(bool success, bytes memory returndata, string memory errorMessage) public pure returns (bytes memory) {
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

interface IPancakeRouter01 {
    function factory() external pure returns (address);

    function WETH() external pure returns (address);

    function addLiquidity(address tokenA, address tokenB, uint256 amountADesired, uint256 amountBDesired, uint256 amountAMin, uint256 amountBMin, address to, uint256 deadline) external returns (uint256 amountA, uint256 amountB, uint256 liquidity);

    function addLiquidityETH(address token, uint256 amountTokenDesired, uint256 amountTokenMin, uint256 amountETHMin, address to, uint256 deadline) external payable returns (uint256 amountToken, uint256 amountETH, uint256 liquidity);

    function removeLiquidity(address tokenA, address tokenB, uint256 liquidity, uint256 amountAMin, uint256 amountBMin, address to, uint256 deadline) external returns (uint256 amountA, uint256 amountB);

    function removeLiquidityETH(address token, uint256 liquidity, uint256 amountTokenMin, uint256 amountETHMin, address to, uint256 deadline) external returns (uint256 amountToken, uint256 amountETH);

    function removeLiquidityWithPermit(address tokenA, address tokenB, uint256 liquidity, uint256 amountAMin, uint256 amountBMin, address to, uint256 deadline, bool approveMax, uint8 v, bytes32 r, bytes32 s) external returns (uint256 amountA, uint256 amountB);

    function removeLiquidityETHWithPermit(address token, uint256 liquidity, uint256 amountTokenMin, uint256 amountETHMin, address to, uint256 deadline, bool approveMax, uint8 v, bytes32 r, bytes32 s) external returns (uint256 amountToken, uint256 amountETH);

    function swapExactTokensForTokens(uint256 amountIn, uint256 amountOutMin, address[] calldata path, address to, uint256 deadline) external returns (uint256[] memory amounts);

    function swapTokensForExactTokens(uint256 amountOut, uint256 amountInMax, address[] calldata path, address to, uint256 deadline) external returns (uint256[] memory amounts);

    function swapExactETHForTokens(uint256 amountOutMin, address[] calldata path, address to, uint256 deadline) external payable returns (uint256[] memory amounts);

    function swapTokensForExactETH(uint256 amountOut, uint256 amountInMax, address[] calldata path, address to, uint256 deadline) external returns (uint256[] memory amounts);

    function swapExactTokensForETH(uint256 amountIn, uint256 amountOutMin, address[] calldata path, address to, uint256 deadline) external returns (uint256[] memory amounts);

    function swapETHForExactTokens(uint256 amountOut, address[] calldata path, address to, uint256 deadline) external payable returns (uint256[] memory amounts);

    function quote(uint256 amountA, uint256 reserveA, uint256 reserveB) external pure returns (uint256 amountB);

    function getAmountOut(uint256 amountIn, uint256 reserveIn, uint256 reserveOut) external pure returns (uint256 amountOut);

    function getAmountIn(uint256 amountOut, uint256 reserveIn, uint256 reserveOut) external pure returns (uint256 amountIn);

    function getAmountsOut(uint256 amountIn, address[] calldata path) external view returns (uint256[] memory amounts);

    function getAmountsIn(uint256 amountOut, address[] calldata path) external view returns (uint256[] memory amounts);
}

///  @title SafeERC20
///  @dev Wrappers around ERC20 operations that throw on failure (when the token
///  contract returns false). Tokens that return no value (and instead revert or
///  throw on failure) are also supported, non-reverting calls are assumed to be
///  successful.
///  To use this library you can add a `using SafeERC20 for IERC20;` statement to your contract,
///  which allows you to call the safe operations as `token.safeTransfer(...)`, etc.
library SafeERC20Upgradeable {
    using AddressUpgradeable for address;

    function safeTransfer(IERC20Upgradeable token, address to, uint256 value) internal {
        _callOptionalReturn(token, abi.encodeWithSelector(token.transfer.selector, to, value));
    }

    function safeTransferFrom(IERC20Upgradeable token, address from, address to, uint256 value) internal {
        _callOptionalReturn(token, abi.encodeWithSelector(token.transferFrom.selector, from, to, value));
    }

    ///  @dev Deprecated. This function has issues similar to the ones found in
    ///  {IERC20-approve}, and its usage is discouraged.
    ///  Whenever possible, use {safeIncreaseAllowance} and
    ///  {safeDecreaseAllowance} instead.
    function safeApprove(IERC20Upgradeable token, address spender, uint256 value) internal {
        require((value == 0) || (token.allowance(address(this), spender) == 0), "SafeERC20: approve from non-zero to non-zero allowance");
        _callOptionalReturn(token, abi.encodeWithSelector(token.approve.selector, spender, value));
    }

    function safeIncreaseAllowance(IERC20Upgradeable token, address spender, uint256 value) internal {
        uint256 newAllowance = token.allowance(address(this), spender) + value;
        _callOptionalReturn(token, abi.encodeWithSelector(token.approve.selector, spender, newAllowance));
    }

    function safeDecreaseAllowance(IERC20Upgradeable token, address spender, uint256 value) internal {
        unchecked {
            uint256 oldAllowance = token.allowance(address(this), spender);
            require(oldAllowance >= value, "SafeERC20: decreased allowance below zero");
            uint256 newAllowance = oldAllowance - value;
            _callOptionalReturn(token, abi.encodeWithSelector(token.approve.selector, spender, newAllowance));
        }
    }

    ///  @dev Imitates a Solidity high-level call (i.e. a regular function call to a contract), relaxing the requirement
    ///  on the return value: the return value is optional (but if data is returned, it must not be false).
    ///  @param token The token targeted by the call.
    ///  @param data The call data (encoded using abi.encode or one of its variants).
    function _callOptionalReturn(IERC20Upgradeable token, bytes memory data) private {
        bytes memory returndata = address(token).functionCall(data, "SafeERC20: low-level call failed");
        if (returndata.length > 0) {
            require(abi.decode(returndata, (bool)), "SafeERC20: ERC20 operation did not succeed");
        }
    }
}

interface IWETH {
    event Deposit(address indexed dst, uint256 wad);

    event Withdrawal(address indexed src, uint256 wad);

    function deposit() external payable;

    function withdraw(uint256 wad) external;

    function transfer(address dst, uint256 wad) external;

    function balanceOf(address dst) external view returns (uint256);
}

interface IGymMLM {
    function isOnGymMLM(address) external view returns (bool);

    function addGymMLM(address, uint256) external;

    function distributeRewards(uint256, address, address, uint32) external;

    function updateInvestment(address _user, uint256 _newInvestment) external;

    function investment(address _user) external view returns (uint256);

    function getPendingRewards(address, uint32) external view returns (uint256);
}

interface IPancakeRouter02 is IPancakeRouter01 {
    function swapExactTokensForTokensSupportingFeeOnTransferTokens(uint256 amountIn, uint256 amountOutMin, address[] calldata path, address to, uint256 deadline) external;

    function swapExactETHForTokensSupportingFeeOnTransferTokens(uint256 amountOutMin, address[] calldata path, address to, uint256 deadline) external payable;

    function swapExactTokensForETHSupportingFeeOnTransferTokens(uint256 amountIn, uint256 amountOutMin, address[] calldata path, address to, uint256 deadline) external;
}

interface IERC20Burnable is IERC20Upgradeable {
    function burn(uint256 _amount) external;

    function burnFrom(address _account, uint256 _amount) external;
}

///  @dev Contract module which provides a basic access control mechanism, where
///  there is an account (an owner) that can be granted exclusive access to
///  specific functions.
///  By default, the owner account will be the one that deploys the contract. This
///  can later be changed with {transferOwnership}.
///  This module is used through inheritance. It will make available the modifier
///  `onlyOwner`, which can be applied to your functions to restrict their use to
///  the owner.
abstract contract OwnableUpgradeable is Initializable, ContextUpgradeable {
    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    address public _owner;

    ///  @dev Throws if called by any account other than the owner.
    modifier onlyOwner() {
        require(owner() == _msgSender(), "Ownable: caller is not the owner");
        _;
    }

    ///  @dev Initializes the contract setting the deployer as the initial owner.
    function __Ownable_init() internal onlyInitializing() {
        __Ownable_init_unchained();
    }

    function __Ownable_init_unchained() internal onlyInitializing() {
        _transferOwnership(_msgSender());
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
        _transferOwnership(address(0));
    }

    ///  @dev Transfers ownership of the contract to a new account (`newOwner`).
    ///  Can only be called by the current owner.
    function transferOwnership(address newOwner) virtual public onlyOwner() {
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        _transferOwnership(newOwner);
    }

    ///  @dev Transfers ownership of the contract to a new account (`newOwner`).
    ///  Internal function without access restriction.
    function _transferOwnership(address newOwner) virtual internal {
        address oldOwner = _owner;
        _owner = newOwner;
        emit OwnershipTransferred(oldOwner, newOwner);
    }
}

///  @notice GymSinglePool contract:
///  - Users can:
///    # Deposit GYMNET
///    # Withdraw assets
contract GymSinglePool is OwnableUpgradeable, ReentrancyGuardUpgradeable {
    using SafeERC20Upgradeable for IERC20Upgradeable;

    event Initialized(address indexed executor, uint256 at);

    event Deposit(address indexed user, uint256 amount, uint indexed period);

    event Withdraw(address indexed user, uint256 amount, uint indexed period);

    event RewardPaid(address indexed token, address indexed user, uint256 amount);

    event ClaimUserReward(address indexed user, uint256 amount);

    struct UserInfo {
        uint256 totalDepositTokens;
        uint256 totalDepositDollarValue;
        uint256 level;
        uint256 depositId;
        uint256 totalClaimt;
    }

    struct UserDeposits {
        uint256 depositTokens;
        uint256 depositDollarValue;
        uint256 stakePeriod;
        uint256 depositTimestamp;
        uint256 withdrawalTimestamp;
        uint256 rewardsGained;
        uint256 rewardsClaimt;
        uint256 rewardDebt;
        bool is_finished;
    }

    struct PoolInfo {
        uint256 lastRewardBlock;
        uint256 accRewardPerShare;
        uint256 rewardPerBlock;
    }

    /// Startblock number
    uint256 public startBlock;
    uint256 public withdrawFee;
    address public relationship;
    /// Treasury address where will be sent all unused assets
    address public treasuryAddress;
    /// Info of pool.
    PoolInfo public poolInfo;
    /// Info of each user that staked tokens.
    mapping(address => UserInfo) public userInfo;
    /// accepts user address and id of element to select - returns information about selected staking by id
    mapping(address => UserDeposits[]) public user_deposits;
    uint256 public lastChangeBlock;
    /// GYMNET token contract address
    address public tokenAddress;
    /// address of pancake Router
    address public pancakeRouterAddress;
    /// WBNB and BUSD Token Pair address, element 0 = Address of WBNB Token, element 1= Address of GYMNET 
    address[] public wbnbAndUSDTTokenArray;
    /// GYMNET and WBNB Token Pair address, element 0 = Address of GYMNET, element 1 = Address of WBNB Token, 
    address[] public GymWBNBPair;
    /// Level Qualifications for the pool
    uint256[16] public levels;
    /// Locking Periods 
    uint256[6] public months;
    /// Amount of Total GYMNET Locked in the pool
    uint256 public totalGymnetLocked;
    /// Amount of GYMNET all users has claimt over time.
    uint256 public totalClaimtInPool;
    /// Percent that will be sent to MLM Contract for comission distribution
    uint256 public RELATIONSHIP_REWARD;
    /// 6% comissions
    uint256 public poolRewardsAmount;
    address public holderRewardContractAddress;
    address public runnerScriptAddress;
    uint256 public totalBurntInSinglePool;
    bool public isPoolActive;
    bool public isInMigrationToVTwo;
    uint256 public totalGymnetUnlocked;
    uint256 public unlockedTimestampQualification;
    address public vaultContractAddress;
    address public farmingContractAddress;

    modifier onlyRunnerScript() {
        require((msg.sender == runnerScriptAddress) || (msg.sender == owner()), "Only Runner Script");
        _;
    }

    modifier onlyBank() {
        require(msg.sender == vaultContractAddress, "GymFarming:: Only bank");
        _;
    }

    receive() external payable {}

    fallback() external payable {}

    ///  @notice Deposit in given pool
    ///  @param _depositAmount: Amount of want token that user wants to deposit
    function depositFromOtherContract(uint256 _depositAmount, uint8 _periodId, bool isUnlocked, address _from) external {
        require(isPoolActive, "Contract is not running yet");
        _autoDeposit(_depositAmount, _periodId, isUnlocked, _from);
    }

    /// Should approve allowance before initiating
    /// accepts depositAmount in WEI
    /// periodID - id of months array accordingly
    function _autoDeposit(uint256 _depositAmount, uint8 _periodId, bool _isUnlocked, address _from) private {
        UserInfo storage user = userInfo[_from];
        IERC20Upgradeable token = IERC20Upgradeable(tokenAddress);
        PoolInfo storage pool = poolInfo;
        token.approve(address(this), _depositAmount);
        updatePool();
        uint256 period = months[_periodId];
        uint256 lockTimesamp = DateTime.addMonths(block.timestamp, months[_periodId]);
        uint256 burnTokensAmount = 0;
        uint256 amountToDeposit = _depositAmount - burnTokensAmount;
        uint256 UsdValueOfGym = ((amountToDeposit * getPrice()) / 1e18) / 1e18;
        user.totalDepositTokens += amountToDeposit;
        user.totalDepositDollarValue += UsdValueOfGym;
        totalGymnetLocked += amountToDeposit;
        if (_isUnlocked) {
            totalGymnetUnlocked += amountToDeposit;
            period = 0;
            lockTimesamp = DateTime.addSeconds(block.timestamp, months[_periodId]);
        }
        uint256 rewardDebt = (amountToDeposit * (pool.accRewardPerShare)) / (1e18);
        UserDeposits memory depositDetails = UserDeposits({depositTokens: amountToDeposit, depositDollarValue: UsdValueOfGym, stakePeriod: period, depositTimestamp: block.timestamp, withdrawalTimestamp: lockTimesamp, rewardsGained: 0, is_finished: false, rewardsClaimt: 0, rewardDebt: rewardDebt});
        user_deposits[_from].push(depositDetails);
        user.depositId = user_deposits[_from].length;
        emit Deposit(_from, amountToDeposit, _periodId);
    }

    ///  Returns the latest price
    function getPrice() public view returns (uint) {
        uint256[] memory gymPriceInUSD = IPancakeRouter02(pancakeRouterAddress).getAmountsOut(1000000000000000000, GymWBNBPair);
        uint256[] memory BNBPriceInUSD = IPancakeRouter02(pancakeRouterAddress).getAmountsOut(1, wbnbAndUSDTTokenArray);
        return gymPriceInUSD[1] * BNBPriceInUSD[1];
    }

    ///  @notice Update reward variables of the given pool to be up-to-date.
    function updatePool() public {
        PoolInfo storage pool = poolInfo;
        if (block.number <= pool.lastRewardBlock) {
            return;
        }
        uint256 sharesTotal = totalGymnetLocked - totalGymnetUnlocked;
        if (sharesTotal == 0) {
            pool.lastRewardBlock = block.number;
            return;
        }
        uint256 multiplier = block.number - pool.lastRewardBlock;
        if (multiplier <= 0) {
            return;
        }
        uint256 _rewardPerBlock = pool.rewardPerBlock;
        uint256 _reward = (multiplier * _rewardPerBlock);
        pool.accRewardPerShare = pool.accRewardPerShare + ((_reward * 1e18) / sharesTotal);
        pool.lastRewardBlock = block.number;
    }
}