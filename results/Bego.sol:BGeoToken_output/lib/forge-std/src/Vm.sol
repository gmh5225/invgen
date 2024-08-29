/// SPDX-License-Identifier: MIT OR Apache-2.0
pragma solidity >=0.6.2<0.9.0;
pragma experimental ABIEncoderV2;

/// The `VmSafe` interface does not allow manipulation of the EVM state or other actions that may
///  result in Script simulations differing from on-chain execution. It is recommended to only use
///  these cheats in scripts.
interface VmSafe {
    /// A modification applied to either `msg.sender` or `tx.origin`. Returned by `readCallers`.
    enum CallerMode {
        None,
        Broadcast,
        RecurrentBroadcast,
        Prank,
        RecurrentPrank
    }

    /// The kind of account access that occurred.
    enum AccountAccessKind {
        Call,
        DelegateCall,
        CallCode,
        StaticCall,
        Create,
        SelfDestruct,
        Resume,
        Balance,
        Extcodesize,
        Extcodehash,
        Extcodecopy
    }

    /// An Ethereum log. Returned by `getRecordedLogs`.
    struct Log {
        bytes32[] topics;
        bytes data;
        address emitter;
    }

    /// An RPC URL and its alias. Returned by `rpcUrlStructs`.
    struct Rpc {
        string key;
        string url;
    }

    /// An RPC log object. Returned by `eth_getLogs`.
    struct EthGetLogs {
        address emitter;
        bytes32[] topics;
        bytes data;
        bytes32 blockHash;
        uint64 blockNumber;
        bytes32 transactionHash;
        uint64 transactionIndex;
        uint256 logIndex;
        bool removed;
    }

    /// A single entry in a directory listing. Returned by `readDir`.
    struct DirEntry {
        string errorMessage;
        string path;
        uint64 depth;
        bool isDir;
        bool isSymlink;
    }

    /// Metadata information about a file.
    ///  This structure is returned from the `fsMetadata` function and represents known
    ///  metadata about a file such as its permissions, size, modification
    ///  times, etc.
    struct FsMetadata {
        bool isDir;
        bool isSymlink;
        uint256 length;
        bool readOnly;
        uint256 modified;
        uint256 accessed;
        uint256 created;
    }

    /// A wallet with a public and private key.
    struct Wallet {
        address addr;
        uint256 publicKeyX;
        uint256 publicKeyY;
        uint256 privateKey;
    }

    /// The result of a `tryFfi` call.
    struct FfiResult {
        int32 exitCode;
        bytes stdout;
        bytes stderr;
    }

    /// Information on the chain and fork.
    struct ChainInfo {
        uint256 forkId;
        uint256 chainId;
    }

    /// The result of a `stopAndReturnStateDiff` call.
    struct AccountAccess {
        ChainInfo chainInfo;
        AccountAccessKind kind;
        address account;
        address accessor;
        bool initialized;
        uint256 oldBalance;
        uint256 newBalance;
        bytes deployedCode;
        uint256 value;
        bytes data;
        bool reverted;
        StorageAccess[] storageAccesses;
        uint64 depth;
    }

    /// The storage accessed during an `AccountAccess`.
    struct StorageAccess {
        address account;
        bytes32 slot;
        bool isWrite;
        bytes32 previousValue;
        bytes32 newValue;
        bool reverted;
    }

    /// Gets the environment variable `name` and parses it as `address`.
    ///  Reverts if the variable was not found or could not be parsed.
    function envAddress(string calldata name) external view returns (address value);

    /// Gets the environment variable `name` and parses it as an array of `address`, delimited by `delim`.
    ///  Reverts if the variable was not found or could not be parsed.
    function envAddress(string calldata name, string calldata delim) external view returns (address[] memory value);

    /// Gets the environment variable `name` and parses it as `bool`.
    ///  Reverts if the variable was not found or could not be parsed.
    function envBool(string calldata name) external view returns (bool value);

    /// Gets the environment variable `name` and parses it as an array of `bool`, delimited by `delim`.
    ///  Reverts if the variable was not found or could not be parsed.
    function envBool(string calldata name, string calldata delim) external view returns (bool[] memory value);

    /// Gets the environment variable `name` and parses it as `bytes32`.
    ///  Reverts if the variable was not found or could not be parsed.
    function envBytes32(string calldata name) external view returns (bytes32 value);

    /// Gets the environment variable `name` and parses it as an array of `bytes32`, delimited by `delim`.
    ///  Reverts if the variable was not found or could not be parsed.
    function envBytes32(string calldata name, string calldata delim) external view returns (bytes32[] memory value);

    /// Gets the environment variable `name` and parses it as `bytes`.
    ///  Reverts if the variable was not found or could not be parsed.
    function envBytes(string calldata name) external view returns (bytes memory value);

    /// Gets the environment variable `name` and parses it as an array of `bytes`, delimited by `delim`.
    ///  Reverts if the variable was not found or could not be parsed.
    function envBytes(string calldata name, string calldata delim) external view returns (bytes[] memory value);

    /// Gets the environment variable `name` and parses it as `int256`.
    ///  Reverts if the variable was not found or could not be parsed.
    function envInt(string calldata name) external view returns (int256 value);

    /// Gets the environment variable `name` and parses it as an array of `int256`, delimited by `delim`.
    ///  Reverts if the variable was not found or could not be parsed.
    function envInt(string calldata name, string calldata delim) external view returns (int256[] memory value);

    /// Gets the environment variable `name` and parses it as `bool`.
    ///  Reverts if the variable could not be parsed.
    ///  Returns `defaultValue` if the variable was not found.
    function envOr(string calldata name, bool defaultValue) external view returns (bool value);

    /// Gets the environment variable `name` and parses it as `uint256`.
    ///  Reverts if the variable could not be parsed.
    ///  Returns `defaultValue` if the variable was not found.
    function envOr(string calldata name, uint256 defaultValue) external view returns (uint256 value);

    /// Gets the environment variable `name` and parses it as an array of `address`, delimited by `delim`.
    ///  Reverts if the variable could not be parsed.
    ///  Returns `defaultValue` if the variable was not found.
    function envOr(string calldata name, string calldata delim, address[] calldata defaultValue) external view returns (address[] memory value);

    /// Gets the environment variable `name` and parses it as an array of `bytes32`, delimited by `delim`.
    ///  Reverts if the variable could not be parsed.
    ///  Returns `defaultValue` if the variable was not found.
    function envOr(string calldata name, string calldata delim, bytes32[] calldata defaultValue) external view returns (bytes32[] memory value);

    /// Gets the environment variable `name` and parses it as an array of `string`, delimited by `delim`.
    ///  Reverts if the variable could not be parsed.
    ///  Returns `defaultValue` if the variable was not found.
    function envOr(string calldata name, string calldata delim, string[] calldata defaultValue) external view returns (string[] memory value);

    /// Gets the environment variable `name` and parses it as an array of `bytes`, delimited by `delim`.
    ///  Reverts if the variable could not be parsed.
    ///  Returns `defaultValue` if the variable was not found.
    function envOr(string calldata name, string calldata delim, bytes[] calldata defaultValue) external view returns (bytes[] memory value);

    /// Gets the environment variable `name` and parses it as `int256`.
    ///  Reverts if the variable could not be parsed.
    ///  Returns `defaultValue` if the variable was not found.
    function envOr(string calldata name, int256 defaultValue) external view returns (int256 value);

    /// Gets the environment variable `name` and parses it as `address`.
    ///  Reverts if the variable could not be parsed.
    ///  Returns `defaultValue` if the variable was not found.
    function envOr(string calldata name, address defaultValue) external view returns (address value);

    /// Gets the environment variable `name` and parses it as `bytes32`.
    ///  Reverts if the variable could not be parsed.
    ///  Returns `defaultValue` if the variable was not found.
    function envOr(string calldata name, bytes32 defaultValue) external view returns (bytes32 value);

    /// Gets the environment variable `name` and parses it as `string`.
    ///  Reverts if the variable could not be parsed.
    ///  Returns `defaultValue` if the variable was not found.
    function envOr(string calldata name, string calldata defaultValue) external view returns (string memory value);

    /// Gets the environment variable `name` and parses it as `bytes`.
    ///  Reverts if the variable could not be parsed.
    ///  Returns `defaultValue` if the variable was not found.
    function envOr(string calldata name, bytes calldata defaultValue) external view returns (bytes memory value);

    /// Gets the environment variable `name` and parses it as an array of `bool`, delimited by `delim`.
    ///  Reverts if the variable could not be parsed.
    ///  Returns `defaultValue` if the variable was not found.
    function envOr(string calldata name, string calldata delim, bool[] calldata defaultValue) external view returns (bool[] memory value);

    /// Gets the environment variable `name` and parses it as an array of `uint256`, delimited by `delim`.
    ///  Reverts if the variable could not be parsed.
    ///  Returns `defaultValue` if the variable was not found.
    function envOr(string calldata name, string calldata delim, uint256[] calldata defaultValue) external view returns (uint256[] memory value);

    /// Gets the environment variable `name` and parses it as an array of `int256`, delimited by `delim`.
    ///  Reverts if the variable could not be parsed.
    ///  Returns `defaultValue` if the variable was not found.
    function envOr(string calldata name, string calldata delim, int256[] calldata defaultValue) external view returns (int256[] memory value);

    /// Gets the environment variable `name` and parses it as `string`.
    ///  Reverts if the variable was not found or could not be parsed.
    function envString(string calldata name) external view returns (string memory value);

    /// Gets the environment variable `name` and parses it as an array of `string`, delimited by `delim`.
    ///  Reverts if the variable was not found or could not be parsed.
    function envString(string calldata name, string calldata delim) external view returns (string[] memory value);

    /// Gets the environment variable `name` and parses it as `uint256`.
    ///  Reverts if the variable was not found or could not be parsed.
    function envUint(string calldata name) external view returns (uint256 value);

    /// Gets the environment variable `name` and parses it as an array of `uint256`, delimited by `delim`.
    ///  Reverts if the variable was not found or could not be parsed.
    function envUint(string calldata name, string calldata delim) external view returns (uint256[] memory value);

    /// Sets environment variables.
    function setEnv(string calldata name, string calldata value) external;

    /// Gets all accessed reads and write slot from a `vm.record` session, for a given address.
    function accesses(address target) external returns (bytes32[] memory readSlots, bytes32[] memory writeSlots);

    /// Gets the address for a given private key.
    function addr(uint256 privateKey) external pure returns (address keyAddr);

    /// Gets all the logs according to specified filter.
    function eth_getLogs(uint256 fromBlock, uint256 toBlock, address target, bytes32[] calldata topics) external returns (EthGetLogs[] memory logs);

    /// Gets the current `block.number`.
    ///  You should use this instead of `block.number` if you use `vm.roll`, as `block.number` is assumed to be constant across a transaction,
    ///  and as a result will get optimized out by the compiler.
    ///  See https://github.com/foundry-rs/foundry/issues/6180
    function getBlockNumber() external view returns (uint256 height);

    /// Gets the current `block.timestamp`.
    ///  You should use this instead of `block.timestamp` if you use `vm.warp`, as `block.timestamp` is assumed to be constant across a transaction,
    ///  and as a result will get optimized out by the compiler.
    ///  See https://github.com/foundry-rs/foundry/issues/6180
    function getBlockTimestamp() external view returns (uint256 timestamp);

    /// Gets the map key and parent of a mapping at a given slot, for a given address.
    function getMappingKeyAndParentOf(address target, bytes32 elementSlot) external returns (bool found, bytes32 key, bytes32 parent);

    /// Gets the number of elements in the mapping at the given slot, for a given address.
    function getMappingLength(address target, bytes32 mappingSlot) external returns (uint256 length);

    /// Gets the elements at index idx of the mapping at the given slot, for a given address. The
    ///  index must be less than the length of the mapping (i.e. the number of keys in the mapping).
    function getMappingSlotAt(address target, bytes32 mappingSlot, uint256 idx) external returns (bytes32 value);

    /// Gets the nonce of an account.
    function getNonce(address account) external view returns (uint64 nonce);

    /// Gets all the recorded logs.
    function getRecordedLogs() external returns (Log[] memory logs);

    /// Loads a storage slot from an address.
    function load(address target, bytes32 slot) external view returns (bytes32 data);

    /// Pauses gas metering (i.e. gas usage is not counted). Noop if already paused.
    function pauseGasMetering() external;

    /// Records all storage reads and writes.
    function record() external;

    /// Record all the transaction logs.
    function recordLogs() external;

    /// Resumes gas metering (i.e. gas usage is counted again). Noop if already on.
    function resumeGasMetering() external;

    /// Performs an Ethereum JSON-RPC request to the current fork URL.
    function rpc(string calldata method, string calldata params) external returns (bytes memory data);

    /// Signs `digest` with `privateKey` using the secp256r1 curve.
    function signP256(uint256 privateKey, bytes32 digest) external pure returns (bytes32 r, bytes32 s);

    /// Signs `digest` with `privateKey` using the secp256k1 curve.
    function sign(uint256 privateKey, bytes32 digest) external pure returns (uint8 v, bytes32 r, bytes32 s);

    /// Starts recording all map SSTOREs for later retrieval.
    function startMappingRecording() external;

    /// Record all account accesses as part of CREATE, CALL or SELFDESTRUCT opcodes in order,
    ///  along with the context of the calls
    function startStateDiffRecording() external;

    /// Returns an ordered array of all account accesses from a `vm.startStateDiffRecording` session.
    function stopAndReturnStateDiff() external returns (AccountAccess[] memory accountAccesses);

    /// Stops recording all map SSTOREs for later retrieval and clears the recorded data.
    function stopMappingRecording() external;

    /// Closes file for reading, resetting the offset and allowing to read it from beginning with readLine.
    ///  `path` is relative to the project root.
    function closeFile(string calldata path) external;

    /// Copies the contents of one file to another. This function will **overwrite** the contents of `to`.
    ///  On success, the total number of bytes copied is returned and it is equal to the length of the `to` file as reported by `metadata`.
    ///  Both `from` and `to` are relative to the project root.
    function copyFile(string calldata from, string calldata to) external returns (uint64 copied);

    /// Creates a new, empty directory at the provided path.
    ///  This cheatcode will revert in the following situations, but is not limited to just these cases:
    ///  - User lacks permissions to modify `path`.
    ///  - A parent of the given path doesn't exist and `recursive` is false.
    ///  - `path` already exists and `recursive` is false.
    ///  `path` is relative to the project root.
    function createDir(string calldata path, bool recursive) external;

    /// Returns true if the given path points to an existing entity, else returns false.
    function exists(string calldata path) external returns (bool result);

    /// Performs a foreign function call via the terminal.
    function ffi(string[] calldata commandInput) external returns (bytes memory result);

    /// Given a path, query the file system to get information about a file, directory, etc.
    function fsMetadata(string calldata path) external view returns (FsMetadata memory metadata);

    /// Gets the creation bytecode from an artifact file. Takes in the relative path to the json file.
    function getCode(string calldata artifactPath) external view returns (bytes memory creationBytecode);

    /// Gets the deployed bytecode from an artifact file. Takes in the relative path to the json file.
    function getDeployedCode(string calldata artifactPath) external view returns (bytes memory runtimeBytecode);

    /// Returns true if the path exists on disk and is pointing at a directory, else returns false.
    function isDir(string calldata path) external returns (bool result);

    /// Returns true if the path exists on disk and is pointing at a regular file, else returns false.
    function isFile(string calldata path) external returns (bool result);

    /// Get the path of the current project root.
    function projectRoot() external view returns (string memory path);

    /// Reads the directory at the given path recursively, up to `maxDepth`.
    ///  `maxDepth` defaults to 1, meaning only the direct children of the given directory will be returned.
    ///  Follows symbolic links if `followLinks` is true.
    function readDir(string calldata path) external view returns (DirEntry[] memory entries);

    /// See `readDir(string)`.
    function readDir(string calldata path, uint64 maxDepth) external view returns (DirEntry[] memory entries);

    /// See `readDir(string)`.
    function readDir(string calldata path, uint64 maxDepth, bool followLinks) external view returns (DirEntry[] memory entries);

    /// Reads the entire content of file to string. `path` is relative to the project root.
    function readFile(string calldata path) external view returns (string memory data);

    /// Reads the entire content of file as binary. `path` is relative to the project root.
    function readFileBinary(string calldata path) external view returns (bytes memory data);

    /// Reads next line of file to string.
    function readLine(string calldata path) external view returns (string memory line);

    /// Reads a symbolic link, returning the path that the link points to.
    ///  This cheatcode will revert in the following situations, but is not limited to just these cases:
    ///  - `path` is not a symbolic link.
    ///  - `path` does not exist.
    function readLink(string calldata linkPath) external view returns (string memory targetPath);

    /// Removes a directory at the provided path.
    ///  This cheatcode will revert in the following situations, but is not limited to just these cases:
    ///  - `path` doesn't exist.
    ///  - `path` isn't a directory.
    ///  - User lacks permissions to modify `path`.
    ///  - The directory is not empty and `recursive` is false.
    ///  `path` is relative to the project root.
    function removeDir(string calldata path, bool recursive) external;

    /// Removes a file from the filesystem.
    ///  This cheatcode will revert in the following situations, but is not limited to just these cases:
    ///  - `path` points to a directory.
    ///  - The file doesn't exist.
    ///  - The user lacks permissions to remove the file.
    ///  `path` is relative to the project root.
    function removeFile(string calldata path) external;

    /// Performs a foreign function call via terminal and returns the exit code, stdout, and stderr.
    function tryFfi(string[] calldata commandInput) external returns (FfiResult memory result);

    /// Returns the time since unix epoch in milliseconds.
    function unixTime() external returns (uint256 milliseconds);

    /// Writes data to file, creating a file if it does not exist, and entirely replacing its contents if it does.
    ///  `path` is relative to the project root.
    function writeFile(string calldata path, string calldata data) external;

    /// Writes binary data to a file, creating a file if it does not exist, and entirely replacing its contents if it does.
    ///  `path` is relative to the project root.
    function writeFileBinary(string calldata path, bytes calldata data) external;

    /// Writes line to file, creating a file if it does not exist.
    ///  `path` is relative to the project root.
    function writeLine(string calldata path, string calldata data) external;

    /// Checks if `key` exists in a JSON object
    ///  `keyExists` is being deprecated in favor of `keyExistsJson`. It will be removed in future versions.
    function keyExists(string calldata json, string calldata key) external view returns (bool);

    /// Checks if `key` exists in a JSON object.
    function keyExistsJson(string calldata json, string calldata key) external view returns (bool);

    /// Parses a string of JSON data at `key` and coerces it to `address`.
    function parseJsonAddress(string calldata json, string calldata key) external pure returns (address);

    /// Parses a string of JSON data at `key` and coerces it to `address[]`.
    function parseJsonAddressArray(string calldata json, string calldata key) external pure returns (address[] memory);

    /// Parses a string of JSON data at `key` and coerces it to `bool`.
    function parseJsonBool(string calldata json, string calldata key) external pure returns (bool);

    /// Parses a string of JSON data at `key` and coerces it to `bool[]`.
    function parseJsonBoolArray(string calldata json, string calldata key) external pure returns (bool[] memory);

    /// Parses a string of JSON data at `key` and coerces it to `bytes`.
    function parseJsonBytes(string calldata json, string calldata key) external pure returns (bytes memory);

    /// Parses a string of JSON data at `key` and coerces it to `bytes32`.
    function parseJsonBytes32(string calldata json, string calldata key) external pure returns (bytes32);

    /// Parses a string of JSON data at `key` and coerces it to `bytes32[]`.
    function parseJsonBytes32Array(string calldata json, string calldata key) external pure returns (bytes32[] memory);

    /// Parses a string of JSON data at `key` and coerces it to `bytes[]`.
    function parseJsonBytesArray(string calldata json, string calldata key) external pure returns (bytes[] memory);

    /// Parses a string of JSON data at `key` and coerces it to `int256`.
    function parseJsonInt(string calldata json, string calldata key) external pure returns (int256);

    /// Parses a string of JSON data at `key` and coerces it to `int256[]`.
    function parseJsonIntArray(string calldata json, string calldata key) external pure returns (int256[] memory);

    /// Returns an array of all the keys in a JSON object.
    function parseJsonKeys(string calldata json, string calldata key) external pure returns (string[] memory keys);

    /// Parses a string of JSON data at `key` and coerces it to `string`.
    function parseJsonString(string calldata json, string calldata key) external pure returns (string memory);

    /// Parses a string of JSON data at `key` and coerces it to `string[]`.
    function parseJsonStringArray(string calldata json, string calldata key) external pure returns (string[] memory);

    /// Parses a string of JSON data at `key` and coerces it to `uint256`.
    function parseJsonUint(string calldata json, string calldata key) external pure returns (uint256);

    /// Parses a string of JSON data at `key` and coerces it to `uint256[]`.
    function parseJsonUintArray(string calldata json, string calldata key) external pure returns (uint256[] memory);

    /// ABI-encodes a JSON object.
    function parseJson(string calldata json) external pure returns (bytes memory abiEncodedData);

    /// ABI-encodes a JSON object at `key`.
    function parseJson(string calldata json, string calldata key) external pure returns (bytes memory abiEncodedData);

    /// See `serializeJson`.
    function serializeAddress(string calldata objectKey, string calldata valueKey, address value) external returns (string memory json);

    /// See `serializeJson`.
    function serializeAddress(string calldata objectKey, string calldata valueKey, address[] calldata values) external returns (string memory json);

    /// See `serializeJson`.
    function serializeBool(string calldata objectKey, string calldata valueKey, bool value) external returns (string memory json);

    /// See `serializeJson`.
    function serializeBool(string calldata objectKey, string calldata valueKey, bool[] calldata values) external returns (string memory json);

    /// See `serializeJson`.
    function serializeBytes32(string calldata objectKey, string calldata valueKey, bytes32 value) external returns (string memory json);

    /// See `serializeJson`.
    function serializeBytes32(string calldata objectKey, string calldata valueKey, bytes32[] calldata values) external returns (string memory json);

    /// See `serializeJson`.
    function serializeBytes(string calldata objectKey, string calldata valueKey, bytes calldata value) external returns (string memory json);

    /// See `serializeJson`.
    function serializeBytes(string calldata objectKey, string calldata valueKey, bytes[] calldata values) external returns (string memory json);

    /// See `serializeJson`.
    function serializeInt(string calldata objectKey, string calldata valueKey, int256 value) external returns (string memory json);

    /// See `serializeJson`.
    function serializeInt(string calldata objectKey, string calldata valueKey, int256[] calldata values) external returns (string memory json);

    /// Serializes a key and value to a JSON object stored in-memory that can be later written to a file.
    ///  Returns the stringified version of the specific JSON file up to that moment.
    function serializeJson(string calldata objectKey, string calldata value) external returns (string memory json);

    /// See `serializeJson`.
    function serializeString(string calldata objectKey, string calldata valueKey, string calldata value) external returns (string memory json);

    /// See `serializeJson`.
    function serializeString(string calldata objectKey, string calldata valueKey, string[] calldata values) external returns (string memory json);

    /// See `serializeJson`.
    function serializeUint(string calldata objectKey, string calldata valueKey, uint256 value) external returns (string memory json);

    /// See `serializeJson`.
    function serializeUint(string calldata objectKey, string calldata valueKey, uint256[] calldata values) external returns (string memory json);

    /// Write a serialized JSON object to a file. If the file exists, it will be overwritten.
    function writeJson(string calldata json, string calldata path) external;

    /// Write a serialized JSON object to an **existing** JSON file, replacing a value with key = <value_key.>
    ///  This is useful to replace a specific value of a JSON file, without having to parse the entire thing.
    function writeJson(string calldata json, string calldata path, string calldata valueKey) external;

    /// Using the address that calls the test contract, has the next call (at this call depth only)
    ///  create a transaction that can later be signed and sent onchain.
    function broadcast() external;

    /// Has the next call (at this call depth only) create a transaction with the address provided
    ///  as the sender that can later be signed and sent onchain.
    function broadcast(address signer) external;

    /// Has the next call (at this call depth only) create a transaction with the private key
    ///  provided as the sender that can later be signed and sent onchain.
    function broadcast(uint256 privateKey) external;

    /// Using the address that calls the test contract, has all subsequent calls
    ///  (at this call depth only) create transactions that can later be signed and sent onchain.
    function startBroadcast() external;

    /// Has all subsequent calls (at this call depth only) create transactions with the address
    ///  provided that can later be signed and sent onchain.
    function startBroadcast(address signer) external;

    /// Has all subsequent calls (at this call depth only) create transactions with the private key
    ///  provided that can later be signed and sent onchain.
    function startBroadcast(uint256 privateKey) external;

    /// Stops collecting onchain transactions.
    function stopBroadcast() external;

    /// Parses the given `string` into an `address`.
    function parseAddress(string calldata stringifiedValue) external pure returns (address parsedValue);

    /// Parses the given `string` into a `bool`.
    function parseBool(string calldata stringifiedValue) external pure returns (bool parsedValue);

    /// Parses the given `string` into `bytes`.
    function parseBytes(string calldata stringifiedValue) external pure returns (bytes memory parsedValue);

    /// Parses the given `string` into a `bytes32`.
    function parseBytes32(string calldata stringifiedValue) external pure returns (bytes32 parsedValue);

    /// Parses the given `string` into a `int256`.
    function parseInt(string calldata stringifiedValue) external pure returns (int256 parsedValue);

    /// Parses the given `string` into a `uint256`.
    function parseUint(string calldata stringifiedValue) external pure returns (uint256 parsedValue);

    /// Replaces occurrences of `from` in the given `string` with `to`.
    function replace(string calldata input, string calldata from, string calldata to) external pure returns (string memory output);

    /// Splits the given `string` into an array of strings divided by the `delimiter`.
    function split(string calldata input, string calldata delimiter) external pure returns (string[] memory outputs);

    /// Converts the given `string` value to Lowercase.
    function toLowercase(string calldata input) external pure returns (string memory output);

    /// Converts the given value to a `string`.
    function toString(address value) external pure returns (string memory stringifiedValue);

    /// Converts the given value to a `string`.
    function toString(bytes calldata value) external pure returns (string memory stringifiedValue);

    /// Converts the given value to a `string`.
    function toString(bytes32 value) external pure returns (string memory stringifiedValue);

    /// Converts the given value to a `string`.
    function toString(bool value) external pure returns (string memory stringifiedValue);

    /// Converts the given value to a `string`.
    function toString(uint256 value) external pure returns (string memory stringifiedValue);

    /// Converts the given value to a `string`.
    function toString(int256 value) external pure returns (string memory stringifiedValue);

    /// Converts the given `string` value to Uppercase.
    function toUppercase(string calldata input) external pure returns (string memory output);

    /// Trims leading and trailing whitespace from the given `string` value.
    function trim(string calldata input) external pure returns (string memory output);

    /// Compares two `uint256` values. Expects difference to be less than or equal to `maxDelta`.
    ///  Formats values with decimals in failure message.
    function assertApproxEqAbsDecimal(uint256 left, uint256 right, uint256 maxDelta, uint256 decimals) external pure;

    /// Compares two `uint256` values. Expects difference to be less than or equal to `maxDelta`.
    ///  Formats values with decimals in failure message. Includes error message into revert string on failure.
    function assertApproxEqAbsDecimal(uint256 left, uint256 right, uint256 maxDelta, uint256 decimals, string calldata error) external pure;

    /// Compares two `int256` values. Expects difference to be less than or equal to `maxDelta`.
    ///  Formats values with decimals in failure message.
    function assertApproxEqAbsDecimal(int256 left, int256 right, uint256 maxDelta, uint256 decimals) external pure;

    /// Compares two `int256` values. Expects difference to be less than or equal to `maxDelta`.
    ///  Formats values with decimals in failure message. Includes error message into revert string on failure.
    function assertApproxEqAbsDecimal(int256 left, int256 right, uint256 maxDelta, uint256 decimals, string calldata error) external pure;

    /// Compares two `uint256` values. Expects difference to be less than or equal to `maxDelta`.
    function assertApproxEqAbs(uint256 left, uint256 right, uint256 maxDelta) external pure;

    /// Compares two `uint256` values. Expects difference to be less than or equal to `maxDelta`.
    ///  Includes error message into revert string on failure.
    function assertApproxEqAbs(uint256 left, uint256 right, uint256 maxDelta, string calldata error) external pure;

    /// Compares two `int256` values. Expects difference to be less than or equal to `maxDelta`.
    function assertApproxEqAbs(int256 left, int256 right, uint256 maxDelta) external pure;

    /// Compares two `int256` values. Expects difference to be less than or equal to `maxDelta`.
    ///  Includes error message into revert string on failure.
    function assertApproxEqAbs(int256 left, int256 right, uint256 maxDelta, string calldata error) external pure;

    /// Compares two `uint256` values. Expects relative difference in percents to be less than or equal to `maxPercentDelta`.
    ///  `maxPercentDelta` is an 18 decimal fixed point number, where 1e18 == 100%
    ///  Formats values with decimals in failure message.
    function assertApproxEqRelDecimal(uint256 left, uint256 right, uint256 maxPercentDelta, uint256 decimals) external pure;

    /// Compares two `uint256` values. Expects relative difference in percents to be less than or equal to `maxPercentDelta`.
    ///  `maxPercentDelta` is an 18 decimal fixed point number, where 1e18 == 100%
    ///  Formats values with decimals in failure message. Includes error message into revert string on failure.
    function assertApproxEqRelDecimal(uint256 left, uint256 right, uint256 maxPercentDelta, uint256 decimals, string calldata error) external pure;

    /// Compares two `int256` values. Expects relative difference in percents to be less than or equal to `maxPercentDelta`.
    ///  `maxPercentDelta` is an 18 decimal fixed point number, where 1e18 == 100%
    ///  Formats values with decimals in failure message.
    function assertApproxEqRelDecimal(int256 left, int256 right, uint256 maxPercentDelta, uint256 decimals) external pure;

    /// Compares two `int256` values. Expects relative difference in percents to be less than or equal to `maxPercentDelta`.
    ///  `maxPercentDelta` is an 18 decimal fixed point number, where 1e18 == 100%
    ///  Formats values with decimals in failure message. Includes error message into revert string on failure.
    function assertApproxEqRelDecimal(int256 left, int256 right, uint256 maxPercentDelta, uint256 decimals, string calldata error) external pure;

    /// Compares two `uint256` values. Expects relative difference in percents to be less than or equal to `maxPercentDelta`.
    ///  `maxPercentDelta` is an 18 decimal fixed point number, where 1e18 == 100%
    function assertApproxEqRel(uint256 left, uint256 right, uint256 maxPercentDelta) external pure;

    /// Compares two `uint256` values. Expects relative difference in percents to be less than or equal to `maxPercentDelta`.
    ///  `maxPercentDelta` is an 18 decimal fixed point number, where 1e18 == 100%
    ///  Includes error message into revert string on failure.
    function assertApproxEqRel(uint256 left, uint256 right, uint256 maxPercentDelta, string calldata error) external pure;

    /// Compares two `int256` values. Expects relative difference in percents to be less than or equal to `maxPercentDelta`.
    ///  `maxPercentDelta` is an 18 decimal fixed point number, where 1e18 == 100%
    function assertApproxEqRel(int256 left, int256 right, uint256 maxPercentDelta) external pure;

    /// Compares two `int256` values. Expects relative difference in percents to be less than or equal to `maxPercentDelta`.
    ///  `maxPercentDelta` is an 18 decimal fixed point number, where 1e18 == 100%
    ///  Includes error message into revert string on failure.
    function assertApproxEqRel(int256 left, int256 right, uint256 maxPercentDelta, string calldata error) external pure;

    /// Asserts that two `uint256` values are equal, formatting them with decimals in failure message.
    function assertEqDecimal(uint256 left, uint256 right, uint256 decimals) external pure;

    /// Asserts that two `uint256` values are equal, formatting them with decimals in failure message.
    ///  Includes error message into revert string on failure.
    function assertEqDecimal(uint256 left, uint256 right, uint256 decimals, string calldata error) external pure;

    /// Asserts that two `int256` values are equal, formatting them with decimals in failure message.
    function assertEqDecimal(int256 left, int256 right, uint256 decimals) external pure;

    /// Asserts that two `int256` values are equal, formatting them with decimals in failure message.
    ///  Includes error message into revert string on failure.
    function assertEqDecimal(int256 left, int256 right, uint256 decimals, string calldata error) external pure;

    /// Asserts that two `bool` values are equal.
    function assertEq(bool left, bool right) external pure;

    /// Asserts that two `bool` values are equal and includes error message into revert string on failure.
    function assertEq(bool left, bool right, string calldata error) external pure;

    /// Asserts that two `string` values are equal.
    function assertEq(string calldata left, string calldata right) external pure;

    /// Asserts that two `string` values are equal and includes error message into revert string on failure.
    function assertEq(string calldata left, string calldata right, string calldata error) external pure;

    /// Asserts that two `bytes` values are equal.
    function assertEq(bytes calldata left, bytes calldata right) external pure;

    /// Asserts that two `bytes` values are equal and includes error message into revert string on failure.
    function assertEq(bytes calldata left, bytes calldata right, string calldata error) external pure;

    /// Asserts that two arrays of `bool` values are equal.
    function assertEq(bool[] calldata left, bool[] calldata right) external pure;

    /// Asserts that two arrays of `bool` values are equal and includes error message into revert string on failure.
    function assertEq(bool[] calldata left, bool[] calldata right, string calldata error) external pure;

    /// Asserts that two arrays of `uint256 values are equal.
    function assertEq(uint256[] calldata left, uint256[] calldata right) external pure;

    /// Asserts that two arrays of `uint256` values are equal and includes error message into revert string on failure.
    function assertEq(uint256[] calldata left, uint256[] calldata right, string calldata error) external pure;

    /// Asserts that two arrays of `int256` values are equal.
    function assertEq(int256[] calldata left, int256[] calldata right) external pure;

    /// Asserts that two arrays of `int256` values are equal and includes error message into revert string on failure.
    function assertEq(int256[] calldata left, int256[] calldata right, string calldata error) external pure;

    /// Asserts that two `uint256` values are equal.
    function assertEq(uint256 left, uint256 right) external pure;

    /// Asserts that two arrays of `address` values are equal.
    function assertEq(address[] calldata left, address[] calldata right) external pure;

    /// Asserts that two arrays of `address` values are equal and includes error message into revert string on failure.
    function assertEq(address[] calldata left, address[] calldata right, string calldata error) external pure;

    /// Asserts that two arrays of `bytes32` values are equal.
    function assertEq(bytes32[] calldata left, bytes32[] calldata right) external pure;

    /// Asserts that two arrays of `bytes32` values are equal and includes error message into revert string on failure.
    function assertEq(bytes32[] calldata left, bytes32[] calldata right, string calldata error) external pure;

    /// Asserts that two arrays of `string` values are equal.
    function assertEq(string[] calldata left, string[] calldata right) external pure;

    /// Asserts that two arrays of `string` values are equal and includes error message into revert string on failure.
    function assertEq(string[] calldata left, string[] calldata right, string calldata error) external pure;

    /// Asserts that two arrays of `bytes` values are equal.
    function assertEq(bytes[] calldata left, bytes[] calldata right) external pure;

    /// Asserts that two arrays of `bytes` values are equal and includes error message into revert string on failure.
    function assertEq(bytes[] calldata left, bytes[] calldata right, string calldata error) external pure;

    /// Asserts that two `uint256` values are equal and includes error message into revert string on failure.
    function assertEq(uint256 left, uint256 right, string calldata error) external pure;

    /// Asserts that two `int256` values are equal.
    function assertEq(int256 left, int256 right) external pure;

    /// Asserts that two `int256` values are equal and includes error message into revert string on failure.
    function assertEq(int256 left, int256 right, string calldata error) external pure;

    /// Asserts that two `address` values are equal.
    function assertEq(address left, address right) external pure;

    /// Asserts that two `address` values are equal and includes error message into revert string on failure.
    function assertEq(address left, address right, string calldata error) external pure;

    /// Asserts that two `bytes32` values are equal.
    function assertEq(bytes32 left, bytes32 right) external pure;

    /// Asserts that two `bytes32` values are equal and includes error message into revert string on failure.
    function assertEq(bytes32 left, bytes32 right, string calldata error) external pure;

    /// Asserts that the given condition is false.
    function assertFalse(bool condition) external pure;

    /// Asserts that the given condition is false and includes error message into revert string on failure.
    function assertFalse(bool condition, string calldata error) external pure;

    /// Compares two `uint256` values. Expects first value to be greater than or equal to second.
    ///  Formats values with decimals in failure message.
    function assertGeDecimal(uint256 left, uint256 right, uint256 decimals) external pure;

    /// Compares two `uint256` values. Expects first value to be greater than or equal to second.
    ///  Formats values with decimals in failure message. Includes error message into revert string on failure.
    function assertGeDecimal(uint256 left, uint256 right, uint256 decimals, string calldata error) external pure;

    /// Compares two `int256` values. Expects first value to be greater than or equal to second.
    ///  Formats values with decimals in failure message.
    function assertGeDecimal(int256 left, int256 right, uint256 decimals) external pure;

    /// Compares two `int256` values. Expects first value to be greater than or equal to second.
    ///  Formats values with decimals in failure message. Includes error message into revert string on failure.
    function assertGeDecimal(int256 left, int256 right, uint256 decimals, string calldata error) external pure;

    /// Compares two `uint256` values. Expects first value to be greater than or equal to second.
    function assertGe(uint256 left, uint256 right) external pure;

    /// Compares two `uint256` values. Expects first value to be greater than or equal to second.
    ///  Includes error message into revert string on failure.
    function assertGe(uint256 left, uint256 right, string calldata error) external pure;

    /// Compares two `int256` values. Expects first value to be greater than or equal to second.
    function assertGe(int256 left, int256 right) external pure;

    /// Compares two `int256` values. Expects first value to be greater than or equal to second.
    ///  Includes error message into revert string on failure.
    function assertGe(int256 left, int256 right, string calldata error) external pure;

    /// Compares two `uint256` values. Expects first value to be greater than second.
    ///  Formats values with decimals in failure message.
    function assertGtDecimal(uint256 left, uint256 right, uint256 decimals) external pure;

    /// Compares two `uint256` values. Expects first value to be greater than second.
    ///  Formats values with decimals in failure message. Includes error message into revert string on failure.
    function assertGtDecimal(uint256 left, uint256 right, uint256 decimals, string calldata error) external pure;

    /// Compares two `int256` values. Expects first value to be greater than second.
    ///  Formats values with decimals in failure message.
    function assertGtDecimal(int256 left, int256 right, uint256 decimals) external pure;

    /// Compares two `int256` values. Expects first value to be greater than second.
    ///  Formats values with decimals in failure message. Includes error message into revert string on failure.
    function assertGtDecimal(int256 left, int256 right, uint256 decimals, string calldata error) external pure;

    /// Compares two `uint256` values. Expects first value to be greater than second.
    function assertGt(uint256 left, uint256 right) external pure;

    /// Compares two `uint256` values. Expects first value to be greater than second.
    ///  Includes error message into revert string on failure.
    function assertGt(uint256 left, uint256 right, string calldata error) external pure;

    /// Compares two `int256` values. Expects first value to be greater than second.
    function assertGt(int256 left, int256 right) external pure;

    /// Compares two `int256` values. Expects first value to be greater than second.
    ///  Includes error message into revert string on failure.
    function assertGt(int256 left, int256 right, string calldata error) external pure;

    /// Compares two `uint256` values. Expects first value to be less than or equal to second.
    ///  Formats values with decimals in failure message.
    function assertLeDecimal(uint256 left, uint256 right, uint256 decimals) external pure;

    /// Compares two `uint256` values. Expects first value to be less than or equal to second.
    ///  Formats values with decimals in failure message. Includes error message into revert string on failure.
    function assertLeDecimal(uint256 left, uint256 right, uint256 decimals, string calldata error) external pure;

    /// Compares two `int256` values. Expects first value to be less than or equal to second.
    ///  Formats values with decimals in failure message.
    function assertLeDecimal(int256 left, int256 right, uint256 decimals) external pure;

    /// Compares two `int256` values. Expects first value to be less than or equal to second.
    ///  Formats values with decimals in failure message. Includes error message into revert string on failure.
    function assertLeDecimal(int256 left, int256 right, uint256 decimals, string calldata error) external pure;

    /// Compares two `uint256` values. Expects first value to be less than or equal to second.
    function assertLe(uint256 left, uint256 right) external pure;

    /// Compares two `uint256` values. Expects first value to be less than or equal to second.
    ///  Includes error message into revert string on failure.
    function assertLe(uint256 left, uint256 right, string calldata error) external pure;

    /// Compares two `int256` values. Expects first value to be less than or equal to second.
    function assertLe(int256 left, int256 right) external pure;

    /// Compares two `int256` values. Expects first value to be less than or equal to second.
    ///  Includes error message into revert string on failure.
    function assertLe(int256 left, int256 right, string calldata error) external pure;

    /// Compares two `uint256` values. Expects first value to be less than second.
    ///  Formats values with decimals in failure message.
    function assertLtDecimal(uint256 left, uint256 right, uint256 decimals) external pure;

    /// Compares two `uint256` values. Expects first value to be less than second.
    ///  Formats values with decimals in failure message. Includes error message into revert string on failure.
    function assertLtDecimal(uint256 left, uint256 right, uint256 decimals, string calldata error) external pure;

    /// Compares two `int256` values. Expects first value to be less than second.
    ///  Formats values with decimals in failure message.
    function assertLtDecimal(int256 left, int256 right, uint256 decimals) external pure;

    /// Compares two `int256` values. Expects first value to be less than second.
    ///  Formats values with decimals in failure message. Includes error message into revert string on failure.
    function assertLtDecimal(int256 left, int256 right, uint256 decimals, string calldata error) external pure;

    /// Compares two `uint256` values. Expects first value to be less than second.
    function assertLt(uint256 left, uint256 right) external pure;

    /// Compares two `uint256` values. Expects first value to be less than second.
    ///  Includes error message into revert string on failure.
    function assertLt(uint256 left, uint256 right, string calldata error) external pure;

    /// Compares two `int256` values. Expects first value to be less than second.
    function assertLt(int256 left, int256 right) external pure;

    /// Compares two `int256` values. Expects first value to be less than second.
    ///  Includes error message into revert string on failure.
    function assertLt(int256 left, int256 right, string calldata error) external pure;

    /// Asserts that two `uint256` values are not equal, formatting them with decimals in failure message.
    function assertNotEqDecimal(uint256 left, uint256 right, uint256 decimals) external pure;

    /// Asserts that two `uint256` values are not equal, formatting them with decimals in failure message.
    ///  Includes error message into revert string on failure.
    function assertNotEqDecimal(uint256 left, uint256 right, uint256 decimals, string calldata error) external pure;

    /// Asserts that two `int256` values are not equal, formatting them with decimals in failure message.
    function assertNotEqDecimal(int256 left, int256 right, uint256 decimals) external pure;

    /// Asserts that two `int256` values are not equal, formatting them with decimals in failure message.
    ///  Includes error message into revert string on failure.
    function assertNotEqDecimal(int256 left, int256 right, uint256 decimals, string calldata error) external pure;

    /// Asserts that two `bool` values are not equal.
    function assertNotEq(bool left, bool right) external pure;

    /// Asserts that two `bool` values are not equal and includes error message into revert string on failure.
    function assertNotEq(bool left, bool right, string calldata error) external pure;

    /// Asserts that two `string` values are not equal.
    function assertNotEq(string calldata left, string calldata right) external pure;

    /// Asserts that two `string` values are not equal and includes error message into revert string on failure.
    function assertNotEq(string calldata left, string calldata right, string calldata error) external pure;

    /// Asserts that two `bytes` values are not equal.
    function assertNotEq(bytes calldata left, bytes calldata right) external pure;

    /// Asserts that two `bytes` values are not equal and includes error message into revert string on failure.
    function assertNotEq(bytes calldata left, bytes calldata right, string calldata error) external pure;

    /// Asserts that two arrays of `bool` values are not equal.
    function assertNotEq(bool[] calldata left, bool[] calldata right) external pure;

    /// Asserts that two arrays of `bool` values are not equal and includes error message into revert string on failure.
    function assertNotEq(bool[] calldata left, bool[] calldata right, string calldata error) external pure;

    /// Asserts that two arrays of `uint256` values are not equal.
    function assertNotEq(uint256[] calldata left, uint256[] calldata right) external pure;

    /// Asserts that two arrays of `uint256` values are not equal and includes error message into revert string on failure.
    function assertNotEq(uint256[] calldata left, uint256[] calldata right, string calldata error) external pure;

    /// Asserts that two arrays of `int256` values are not equal.
    function assertNotEq(int256[] calldata left, int256[] calldata right) external pure;

    /// Asserts that two arrays of `int256` values are not equal and includes error message into revert string on failure.
    function assertNotEq(int256[] calldata left, int256[] calldata right, string calldata error) external pure;

    /// Asserts that two `uint256` values are not equal.
    function assertNotEq(uint256 left, uint256 right) external pure;

    /// Asserts that two arrays of `address` values are not equal.
    function assertNotEq(address[] calldata left, address[] calldata right) external pure;

    /// Asserts that two arrays of `address` values are not equal and includes error message into revert string on failure.
    function assertNotEq(address[] calldata left, address[] calldata right, string calldata error) external pure;

    /// Asserts that two arrays of `bytes32` values are not equal.
    function assertNotEq(bytes32[] calldata left, bytes32[] calldata right) external pure;

    /// Asserts that two arrays of `bytes32` values are not equal and includes error message into revert string on failure.
    function assertNotEq(bytes32[] calldata left, bytes32[] calldata right, string calldata error) external pure;

    /// Asserts that two arrays of `string` values are not equal.
    function assertNotEq(string[] calldata left, string[] calldata right) external pure;

    /// Asserts that two arrays of `string` values are not equal and includes error message into revert string on failure.
    function assertNotEq(string[] calldata left, string[] calldata right, string calldata error) external pure;

    /// Asserts that two arrays of `bytes` values are not equal.
    function assertNotEq(bytes[] calldata left, bytes[] calldata right) external pure;

    /// Asserts that two arrays of `bytes` values are not equal and includes error message into revert string on failure.
    function assertNotEq(bytes[] calldata left, bytes[] calldata right, string calldata error) external pure;

    /// Asserts that two `uint256` values are not equal and includes error message into revert string on failure.
    function assertNotEq(uint256 left, uint256 right, string calldata error) external pure;

    /// Asserts that two `int256` values are not equal.
    function assertNotEq(int256 left, int256 right) external pure;

    /// Asserts that two `int256` values are not equal and includes error message into revert string on failure.
    function assertNotEq(int256 left, int256 right, string calldata error) external pure;

    /// Asserts that two `address` values are not equal.
    function assertNotEq(address left, address right) external pure;

    /// Asserts that two `address` values are not equal and includes error message into revert string on failure.
    function assertNotEq(address left, address right, string calldata error) external pure;

    /// Asserts that two `bytes32` values are not equal.
    function assertNotEq(bytes32 left, bytes32 right) external pure;

    /// Asserts that two `bytes32` values are not equal and includes error message into revert string on failure.
    function assertNotEq(bytes32 left, bytes32 right, string calldata error) external pure;

    /// Asserts that the given condition is true.
    function assertTrue(bool condition) external pure;

    /// Asserts that the given condition is true and includes error message into revert string on failure.
    function assertTrue(bool condition, string calldata error) external pure;

    /// If the condition is false, discard this run's fuzz inputs and generate new ones.
    function assume(bool condition) external pure;

    /// Writes a breakpoint to jump to in the debugger.
    function breakpoint(string calldata char) external;

    /// Writes a conditional breakpoint to jump to in the debugger.
    function breakpoint(string calldata char, bool value) external;

    /// Returns the RPC url for the given alias.
    function rpcUrl(string calldata rpcAlias) external view returns (string memory json);

    /// Returns all rpc urls and their aliases as structs.
    function rpcUrlStructs() external view returns (Rpc[] memory urls);

    /// Returns all rpc urls and their aliases `[alias, url][]`.
    function rpcUrls() external view returns (string[2][] memory urls);

    /// Suspends execution of the main thread for `duration` milliseconds.
    function sleep(uint256 duration) external;

    /// Checks if `key` exists in a TOML table.
    function keyExistsToml(string calldata toml, string calldata key) external view returns (bool);

    /// Parses a string of TOML data at `key` and coerces it to `address`.
    function parseTomlAddress(string calldata toml, string calldata key) external pure returns (address);

    /// Parses a string of TOML data at `key` and coerces it to `address[]`.
    function parseTomlAddressArray(string calldata toml, string calldata key) external pure returns (address[] memory);

    /// Parses a string of TOML data at `key` and coerces it to `bool`.
    function parseTomlBool(string calldata toml, string calldata key) external pure returns (bool);

    /// Parses a string of TOML data at `key` and coerces it to `bool[]`.
    function parseTomlBoolArray(string calldata toml, string calldata key) external pure returns (bool[] memory);

    /// Parses a string of TOML data at `key` and coerces it to `bytes`.
    function parseTomlBytes(string calldata toml, string calldata key) external pure returns (bytes memory);

    /// Parses a string of TOML data at `key` and coerces it to `bytes32`.
    function parseTomlBytes32(string calldata toml, string calldata key) external pure returns (bytes32);

    /// Parses a string of TOML data at `key` and coerces it to `bytes32[]`.
    function parseTomlBytes32Array(string calldata toml, string calldata key) external pure returns (bytes32[] memory);

    /// Parses a string of TOML data at `key` and coerces it to `bytes[]`.
    function parseTomlBytesArray(string calldata toml, string calldata key) external pure returns (bytes[] memory);

    /// Parses a string of TOML data at `key` and coerces it to `int256`.
    function parseTomlInt(string calldata toml, string calldata key) external pure returns (int256);

    /// Parses a string of TOML data at `key` and coerces it to `int256[]`.
    function parseTomlIntArray(string calldata toml, string calldata key) external pure returns (int256[] memory);

    /// Returns an array of all the keys in a TOML table.
    function parseTomlKeys(string calldata toml, string calldata key) external pure returns (string[] memory keys);

    /// Parses a string of TOML data at `key` and coerces it to `string`.
    function parseTomlString(string calldata toml, string calldata key) external pure returns (string memory);

    /// Parses a string of TOML data at `key` and coerces it to `string[]`.
    function parseTomlStringArray(string calldata toml, string calldata key) external pure returns (string[] memory);

    /// Parses a string of TOML data at `key` and coerces it to `uint256`.
    function parseTomlUint(string calldata toml, string calldata key) external pure returns (uint256);

    /// Parses a string of TOML data at `key` and coerces it to `uint256[]`.
    function parseTomlUintArray(string calldata toml, string calldata key) external pure returns (uint256[] memory);

    /// ABI-encodes a TOML table.
    function parseToml(string calldata toml) external pure returns (bytes memory abiEncodedData);

    /// ABI-encodes a TOML table at `key`.
    function parseToml(string calldata toml, string calldata key) external pure returns (bytes memory abiEncodedData);

    /// Takes serialized JSON, converts to TOML and write a serialized TOML to a file.
    function writeToml(string calldata json, string calldata path) external;

    /// Takes serialized JSON, converts to TOML and write a serialized TOML table to an **existing** TOML file, replacing a value with key = <value_key.>
    ///  This is useful to replace a specific value of a TOML file, without having to parse the entire thing.
    function writeToml(string calldata json, string calldata path, string calldata valueKey) external;

    /// Compute the address of a contract created with CREATE2 using the given CREATE2 deployer.
    function computeCreate2Address(bytes32 salt, bytes32 initCodeHash, address deployer) external pure returns (address);

    /// Compute the address of a contract created with CREATE2 using the default CREATE2 deployer.
    function computeCreate2Address(bytes32 salt, bytes32 initCodeHash) external pure returns (address);

    /// Compute the address a contract will be deployed at for a given deployer address and nonce.
    function computeCreateAddress(address deployer, uint256 nonce) external pure returns (address);

    /// Derives a private key from the name, labels the account with that name, and returns the wallet.
    function createWallet(string calldata walletLabel) external returns (Wallet memory wallet);

    /// Generates a wallet from the private key and returns the wallet.
    function createWallet(uint256 privateKey) external returns (Wallet memory wallet);

    /// Generates a wallet from the private key, labels the account with that name, and returns the wallet.
    function createWallet(uint256 privateKey, string calldata walletLabel) external returns (Wallet memory wallet);

    /// Derive a private key from a provided mnenomic string (or mnenomic file path)
    ///  at the derivation path `m/44'/60'/0'/0/{index}`.
    function deriveKey(string calldata mnemonic, uint32 index) external pure returns (uint256 privateKey);

    /// Derive a private key from a provided mnenomic string (or mnenomic file path)
    ///  at `{derivationPath}{index}`.
    function deriveKey(string calldata mnemonic, string calldata derivationPath, uint32 index) external pure returns (uint256 privateKey);

    /// Derive a private key from a provided mnenomic string (or mnenomic file path) in the specified language
    ///  at the derivation path `m/44'/60'/0'/0/{index}`.
    function deriveKey(string calldata mnemonic, uint32 index, string calldata language) external pure returns (uint256 privateKey);

    /// Derive a private key from a provided mnenomic string (or mnenomic file path) in the specified language
    ///  at `{derivationPath}{index}`.
    function deriveKey(string calldata mnemonic, string calldata derivationPath, uint32 index, string calldata language) external pure returns (uint256 privateKey);

    /// Gets the label for the specified address.
    function getLabel(address account) external view returns (string memory currentLabel);

    /// Get a `Wallet`'s nonce.
    function getNonce(Wallet calldata wallet) external returns (uint64 nonce);

    /// Labels an address in call traces.
    function label(address account, string calldata newLabel) external;

    /// Adds a private key to the local forge wallet and returns the address.
    function rememberKey(uint256 privateKey) external returns (address keyAddr);

    /// Signs data with a `Wallet`.
    function sign(Wallet calldata wallet, bytes32 digest) external returns (uint8 v, bytes32 r, bytes32 s);

    /// Encodes a `bytes` value to a base64url string.
    function toBase64URL(bytes calldata data) external pure returns (string memory);

    /// Encodes a `string` value to a base64url string.
    function toBase64URL(string calldata data) external pure returns (string memory);

    /// Encodes a `bytes` value to a base64 string.
    function toBase64(bytes calldata data) external pure returns (string memory);

    /// Encodes a `string` value to a base64 string.
    function toBase64(string calldata data) external pure returns (string memory);
}

/// The `Vm` interface does allow manipulation of the EVM state. These are all intended to be used
///  in tests, but it is not recommended to use these cheats in scripts.
interface Vm is VmSafe {
    /// Returns the identifier of the currently active fork. Reverts if no fork is currently active.
    function activeFork() external view returns (uint256 forkId);

    /// In forking mode, explicitly grant the given address cheatcode access.
    function allowCheatcodes(address account) external;

    /// Sets `block.chainid`.
    function chainId(uint256 newChainId) external;

    /// Clears all mocked calls.
    function clearMockedCalls() external;

    /// Sets `block.coinbase`.
    function coinbase(address newCoinbase) external;

    /// Creates a new fork with the given endpoint and the _latest_ block and returns the identifier of the fork.
    function createFork(string calldata urlOrAlias) external returns (uint256 forkId);

    /// Creates a new fork with the given endpoint and block and returns the identifier of the fork.
    function createFork(string calldata urlOrAlias, uint256 blockNumber) external returns (uint256 forkId);

    /// Creates a new fork with the given endpoint and at the block the given transaction was mined in,
    ///  replays all transaction mined in the block before the transaction, and returns the identifier of the fork.
    function createFork(string calldata urlOrAlias, bytes32 txHash) external returns (uint256 forkId);

    /// Creates and also selects a new fork with the given endpoint and the latest block and returns the identifier of the fork.
    function createSelectFork(string calldata urlOrAlias) external returns (uint256 forkId);

    /// Creates and also selects a new fork with the given endpoint and block and returns the identifier of the fork.
    function createSelectFork(string calldata urlOrAlias, uint256 blockNumber) external returns (uint256 forkId);

    /// Creates and also selects new fork with the given endpoint and at the block the given transaction was mined in,
    ///  replays all transaction mined in the block before the transaction, returns the identifier of the fork.
    function createSelectFork(string calldata urlOrAlias, bytes32 txHash) external returns (uint256 forkId);

    /// Sets an address' balance.
    function deal(address account, uint256 newBalance) external;

    /// Removes the snapshot with the given ID created by `snapshot`.
    ///  Takes the snapshot ID to delete.
    ///  Returns `true` if the snapshot was successfully deleted.
    ///  Returns `false` if the snapshot does not exist.
    function deleteSnapshot(uint256 snapshotId) external returns (bool success);

    /// Removes _all_ snapshots previously created by `snapshot`.
    function deleteSnapshots() external;

    /// Sets `block.difficulty`.
    ///  Not available on EVM versions from Paris onwards. Use `prevrandao` instead.
    ///  Reverts if used on unsupported EVM versions.
    function difficulty(uint256 newDifficulty) external;

    /// Dump a genesis JSON file's `allocs` to disk.
    function dumpState(string calldata pathToStateJson) external;

    /// Sets an address' code.
    function etch(address target, bytes calldata newRuntimeBytecode) external;

    /// Sets `block.basefee`.
    function fee(uint256 newBasefee) external;

    /// Returns true if the account is marked as persistent.
    function isPersistent(address account) external view returns (bool persistent);

    /// Load a genesis JSON file's `allocs` into the in-memory revm state.
    function loadAllocs(string calldata pathToAllocsJson) external;

    /// Marks that the account(s) should use persistent storage across fork swaps in a multifork setup
    ///  Meaning, changes made to the state of this account will be kept when switching forks.
    function makePersistent(address account) external;

    /// See `makePersistent(address)`.
    function makePersistent(address account0, address account1) external;

    /// See `makePersistent(address)`.
    function makePersistent(address account0, address account1, address account2) external;

    /// See `makePersistent(address)`.
    function makePersistent(address[] calldata accounts) external;

    /// Reverts a call to an address with specified revert data.
    function mockCallRevert(address callee, bytes calldata data, bytes calldata revertData) external;

    /// Reverts a call to an address with a specific `msg.value`, with specified revert data.
    function mockCallRevert(address callee, uint256 msgValue, bytes calldata data, bytes calldata revertData) external;

    /// Mocks a call to an address, returning specified data.
    ///  Calldata can either be strict or a partial match, e.g. if you only
    ///  pass a Solidity selector to the expected calldata, then the entire Solidity
    ///  function will be mocked.
    function mockCall(address callee, bytes calldata data, bytes calldata returnData) external;

    /// Mocks a call to an address with a specific `msg.value`, returning specified data.
    ///  Calldata match takes precedence over `msg.value` in case of ambiguity.
    function mockCall(address callee, uint256 msgValue, bytes calldata data, bytes calldata returnData) external;

    /// Sets the *next* call's `msg.sender` to be the input address.
    function prank(address msgSender) external;

    /// Sets the *next* call's `msg.sender` to be the input address, and the `tx.origin` to be the second input.
    function prank(address msgSender, address txOrigin) external;

    /// Sets `block.prevrandao`.
    ///  Not available on EVM versions before Paris. Use `difficulty` instead.
    ///  If used on unsupported EVM versions it will revert.
    function prevrandao(bytes32 newPrevrandao) external;

    /// Reads the current `msg.sender` and `tx.origin` from state and reports if there is any active caller modification.
    function readCallers() external returns (CallerMode callerMode, address msgSender, address txOrigin);

    /// Resets the nonce of an account to 0 for EOAs and 1 for contract accounts.
    function resetNonce(address account) external;

    /// Revert the state of the EVM to a previous snapshot
    ///  Takes the snapshot ID to revert to.
    ///  Returns `true` if the snapshot was successfully reverted.
    ///  Returns `false` if the snapshot does not exist.
    ///  **Note:** This does not automatically delete the snapshot. To delete the snapshot use `deleteSnapshot`.
    function revertTo(uint256 snapshotId) external returns (bool success);

    /// Revert the state of the EVM to a previous snapshot and automatically deletes the snapshots
    ///  Takes the snapshot ID to revert to.
    ///  Returns `true` if the snapshot was successfully reverted and deleted.
    ///  Returns `false` if the snapshot does not exist.
    function revertToAndDelete(uint256 snapshotId) external returns (bool success);

    /// Revokes persistent status from the address, previously added via `makePersistent`.
    function revokePersistent(address account) external;

    /// See `revokePersistent(address)`.
    function revokePersistent(address[] calldata accounts) external;

    /// Sets `block.height`.
    function roll(uint256 newHeight) external;

    /// Updates the currently active fork to given block number
    ///  This is similar to `roll` but for the currently active fork.
    function rollFork(uint256 blockNumber) external;

    /// Updates the currently active fork to given transaction. This will `rollFork` with the number
    ///  of the block the transaction was mined in and replays all transaction mined before it in the block.
    function rollFork(bytes32 txHash) external;

    /// Updates the given fork to given block number.
    function rollFork(uint256 forkId, uint256 blockNumber) external;

    /// Updates the given fork to block number of the given transaction and replays all transaction mined before it in the block.
    function rollFork(uint256 forkId, bytes32 txHash) external;

    /// Takes a fork identifier created by `createFork` and sets the corresponding forked state as active.
    function selectFork(uint256 forkId) external;

    /// Sets the nonce of an account. Must be higher than the current nonce of the account.
    function setNonce(address account, uint64 newNonce) external;

    /// Sets the nonce of an account to an arbitrary value.
    function setNonceUnsafe(address account, uint64 newNonce) external;

    /// Snapshot the current state of the evm.
    ///  Returns the ID of the snapshot that was created.
    ///  To revert a snapshot use `revertTo`.
    function snapshot() external returns (uint256 snapshotId);

    /// Sets all subsequent calls' `msg.sender` to be the input address until `stopPrank` is called.
    function startPrank(address msgSender) external;

    /// Sets all subsequent calls' `msg.sender` to be the input address until `stopPrank` is called, and the `tx.origin` to be the second input.
    function startPrank(address msgSender, address txOrigin) external;

    /// Resets subsequent calls' `msg.sender` to be `address(this)`.
    function stopPrank() external;

    /// Stores a value to an address' storage slot.
    function store(address target, bytes32 slot, bytes32 value) external;

    /// Fetches the given transaction from the active fork and executes it on the current state.
    function transact(bytes32 txHash) external;

    /// Fetches the given transaction from the given fork and executes it on the current state.
    function transact(uint256 forkId, bytes32 txHash) external;

    /// Sets `tx.gasprice`.
    function txGasPrice(uint256 newGasPrice) external;

    /// Sets `block.timestamp`.
    function warp(uint256 newTimestamp) external;

    /// Expect a call to an address with the specified `msg.value` and calldata, and a *minimum* amount of gas.
    function expectCallMinGas(address callee, uint256 msgValue, uint64 minGas, bytes calldata data) external;

    /// Expect given number of calls to an address with the specified `msg.value` and calldata, and a *minimum* amount of gas.
    function expectCallMinGas(address callee, uint256 msgValue, uint64 minGas, bytes calldata data, uint64 count) external;

    /// Expects a call to an address with the specified calldata.
    ///  Calldata can either be a strict or a partial match.
    function expectCall(address callee, bytes calldata data) external;

    /// Expects given number of calls to an address with the specified calldata.
    function expectCall(address callee, bytes calldata data, uint64 count) external;

    /// Expects a call to an address with the specified `msg.value` and calldata.
    function expectCall(address callee, uint256 msgValue, bytes calldata data) external;

    /// Expects given number of calls to an address with the specified `msg.value` and calldata.
    function expectCall(address callee, uint256 msgValue, bytes calldata data, uint64 count) external;

    /// Expect a call to an address with the specified `msg.value`, gas, and calldata.
    function expectCall(address callee, uint256 msgValue, uint64 gas, bytes calldata data) external;

    /// Expects given number of calls to an address with the specified `msg.value`, gas, and calldata.
    function expectCall(address callee, uint256 msgValue, uint64 gas, bytes calldata data, uint64 count) external;

    /// Prepare an expected log with (bool checkTopic1, bool checkTopic2, bool checkTopic3, bool checkData.).
    ///  Call this function, then emit an event, then call a function. Internally after the call, we check if
    ///  logs were emitted in the expected order with the expected topics and data (as specified by the booleans).
    function expectEmit(bool checkTopic1, bool checkTopic2, bool checkTopic3, bool checkData) external;

    /// Same as the previous method, but also checks supplied address against emitting contract.
    function expectEmit(bool checkTopic1, bool checkTopic2, bool checkTopic3, bool checkData, address emitter) external;

    /// Prepare an expected log with all topic and data checks enabled.
    ///  Call this function, then emit an event, then call a function. Internally after the call, we check if
    ///  logs were emitted in the expected order with the expected topics and data.
    function expectEmit() external;

    /// Same as the previous method, but also checks supplied address against emitting contract.
    function expectEmit(address emitter) external;

    /// Expects an error on next call with any revert data.
    function expectRevert() external;

    /// Expects an error on next call that starts with the revert data.
    function expectRevert(bytes4 revertData) external;

    /// Expects an error on next call that exactly matches the revert data.
    function expectRevert(bytes calldata revertData) external;

    /// Only allows memory writes to offsets [0x00, 0x60) ∪ [min, max) in the current subcontext. If any other
    ///  memory is written to, the test will fail. Can be called multiple times to add more ranges to the set.
    function expectSafeMemory(uint64 min, uint64 max) external;

    /// Only allows memory writes to offsets [0x00, 0x60) ∪ [min, max) in the next created subcontext.
    ///  If any other memory is written to, the test will fail. Can be called multiple times to add more ranges
    ///  to the set.
    function expectSafeMemoryCall(uint64 min, uint64 max) external;

    /// Marks a test as skipped. Must be called at the top of the test.
    function skip(bool skipTest) external;

    /// Stops all safe memory expectation in the current subcontext.
    function stopExpectSafeMemory() external;
}