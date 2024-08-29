"use strict";
/* Autogenerated file. Do not edit manually. */
Object.defineProperty(exports, "__esModule", { value: true });
exports.ICarbonController__factory = void 0;
const ethers_1 = require("ethers");
const _abi = [
    {
        anonymous: false,
        inputs: [
            {
                indexed: true,
                internalType: "bytes32",
                name: "role",
                type: "bytes32",
            },
            {
                indexed: true,
                internalType: "bytes32",
                name: "previousAdminRole",
                type: "bytes32",
            },
            {
                indexed: true,
                internalType: "bytes32",
                name: "newAdminRole",
                type: "bytes32",
            },
        ],
        name: "RoleAdminChanged",
        type: "event",
    },
    {
        anonymous: false,
        inputs: [
            {
                indexed: true,
                internalType: "bytes32",
                name: "role",
                type: "bytes32",
            },
            {
                indexed: true,
                internalType: "address",
                name: "account",
                type: "address",
            },
            {
                indexed: true,
                internalType: "address",
                name: "sender",
                type: "address",
            },
        ],
        name: "RoleGranted",
        type: "event",
    },
    {
        anonymous: false,
        inputs: [
            {
                indexed: true,
                internalType: "bytes32",
                name: "role",
                type: "bytes32",
            },
            {
                indexed: true,
                internalType: "address",
                name: "account",
                type: "address",
            },
            {
                indexed: true,
                internalType: "address",
                name: "sender",
                type: "address",
            },
        ],
        name: "RoleRevoked",
        type: "event",
    },
    {
        inputs: [
            {
                internalType: "Token",
                name: "token",
                type: "address",
            },
        ],
        name: "accumulatedFees",
        outputs: [
            {
                internalType: "uint256",
                name: "",
                type: "uint256",
            },
        ],
        stateMutability: "view",
        type: "function",
    },
    {
        inputs: [
            {
                internalType: "Token",
                name: "sourceToken",
                type: "address",
            },
            {
                internalType: "Token",
                name: "targetToken",
                type: "address",
            },
            {
                components: [
                    {
                        internalType: "uint256",
                        name: "strategyId",
                        type: "uint256",
                    },
                    {
                        internalType: "uint128",
                        name: "amount",
                        type: "uint128",
                    },
                ],
                internalType: "struct TradeAction[]",
                name: "tradeActions",
                type: "tuple[]",
            },
        ],
        name: "calculateTradeSourceAmount",
        outputs: [
            {
                internalType: "uint128",
                name: "",
                type: "uint128",
            },
        ],
        stateMutability: "view",
        type: "function",
    },
    {
        inputs: [
            {
                internalType: "Token",
                name: "sourceToken",
                type: "address",
            },
            {
                internalType: "Token",
                name: "targetToken",
                type: "address",
            },
            {
                components: [
                    {
                        internalType: "uint256",
                        name: "strategyId",
                        type: "uint256",
                    },
                    {
                        internalType: "uint128",
                        name: "amount",
                        type: "uint128",
                    },
                ],
                internalType: "struct TradeAction[]",
                name: "tradeActions",
                type: "tuple[]",
            },
        ],
        name: "calculateTradeTargetAmount",
        outputs: [
            {
                internalType: "uint128",
                name: "",
                type: "uint128",
            },
        ],
        stateMutability: "view",
        type: "function",
    },
    {
        inputs: [],
        name: "controllerType",
        outputs: [
            {
                internalType: "uint16",
                name: "",
                type: "uint16",
            },
        ],
        stateMutability: "pure",
        type: "function",
    },
    {
        inputs: [
            {
                internalType: "Token",
                name: "token0",
                type: "address",
            },
            {
                internalType: "Token",
                name: "token1",
                type: "address",
            },
        ],
        name: "createPair",
        outputs: [
            {
                components: [
                    {
                        internalType: "uint128",
                        name: "id",
                        type: "uint128",
                    },
                    {
                        internalType: "Token[2]",
                        name: "tokens",
                        type: "address[2]",
                    },
                ],
                internalType: "struct Pair",
                name: "",
                type: "tuple",
            },
        ],
        stateMutability: "nonpayable",
        type: "function",
    },
    {
        inputs: [
            {
                internalType: "Token",
                name: "token0",
                type: "address",
            },
            {
                internalType: "Token",
                name: "token1",
                type: "address",
            },
            {
                components: [
                    {
                        internalType: "uint128",
                        name: "y",
                        type: "uint128",
                    },
                    {
                        internalType: "uint128",
                        name: "z",
                        type: "uint128",
                    },
                    {
                        internalType: "uint64",
                        name: "A",
                        type: "uint64",
                    },
                    {
                        internalType: "uint64",
                        name: "B",
                        type: "uint64",
                    },
                ],
                internalType: "struct Order[2]",
                name: "orders",
                type: "tuple[2]",
            },
        ],
        name: "createStrategy",
        outputs: [
            {
                internalType: "uint256",
                name: "",
                type: "uint256",
            },
        ],
        stateMutability: "payable",
        type: "function",
    },
    {
        inputs: [
            {
                internalType: "uint256",
                name: "strategyId",
                type: "uint256",
            },
        ],
        name: "deleteStrategy",
        outputs: [],
        stateMutability: "nonpayable",
        type: "function",
    },
    {
        inputs: [
            {
                internalType: "bytes32",
                name: "role",
                type: "bytes32",
            },
        ],
        name: "getRoleAdmin",
        outputs: [
            {
                internalType: "bytes32",
                name: "",
                type: "bytes32",
            },
        ],
        stateMutability: "view",
        type: "function",
    },
    {
        inputs: [
            {
                internalType: "bytes32",
                name: "role",
                type: "bytes32",
            },
            {
                internalType: "uint256",
                name: "index",
                type: "uint256",
            },
        ],
        name: "getRoleMember",
        outputs: [
            {
                internalType: "address",
                name: "",
                type: "address",
            },
        ],
        stateMutability: "view",
        type: "function",
    },
    {
        inputs: [
            {
                internalType: "bytes32",
                name: "role",
                type: "bytes32",
            },
        ],
        name: "getRoleMemberCount",
        outputs: [
            {
                internalType: "uint256",
                name: "",
                type: "uint256",
            },
        ],
        stateMutability: "view",
        type: "function",
    },
    {
        inputs: [
            {
                internalType: "bytes32",
                name: "role",
                type: "bytes32",
            },
            {
                internalType: "address",
                name: "account",
                type: "address",
            },
        ],
        name: "grantRole",
        outputs: [],
        stateMutability: "nonpayable",
        type: "function",
    },
    {
        inputs: [
            {
                internalType: "bytes32",
                name: "role",
                type: "bytes32",
            },
            {
                internalType: "address",
                name: "account",
                type: "address",
            },
        ],
        name: "hasRole",
        outputs: [
            {
                internalType: "bool",
                name: "",
                type: "bool",
            },
        ],
        stateMutability: "view",
        type: "function",
    },
    {
        inputs: [
            {
                internalType: "Token",
                name: "token0",
                type: "address",
            },
            {
                internalType: "Token",
                name: "token1",
                type: "address",
            },
        ],
        name: "pair",
        outputs: [
            {
                components: [
                    {
                        internalType: "uint128",
                        name: "id",
                        type: "uint128",
                    },
                    {
                        internalType: "Token[2]",
                        name: "tokens",
                        type: "address[2]",
                    },
                ],
                internalType: "struct Pair",
                name: "",
                type: "tuple",
            },
        ],
        stateMutability: "view",
        type: "function",
    },
    {
        inputs: [
            {
                internalType: "Token",
                name: "token0",
                type: "address",
            },
            {
                internalType: "Token",
                name: "token1",
                type: "address",
            },
        ],
        name: "pairTradingFeePPM",
        outputs: [
            {
                internalType: "uint32",
                name: "",
                type: "uint32",
            },
        ],
        stateMutability: "view",
        type: "function",
    },
    {
        inputs: [],
        name: "pairs",
        outputs: [
            {
                internalType: "Token[2][]",
                name: "",
                type: "address[2][]",
            },
        ],
        stateMutability: "view",
        type: "function",
    },
    {
        inputs: [
            {
                internalType: "bytes32",
                name: "role",
                type: "bytes32",
            },
            {
                internalType: "address",
                name: "account",
                type: "address",
            },
        ],
        name: "renounceRole",
        outputs: [],
        stateMutability: "nonpayable",
        type: "function",
    },
    {
        inputs: [
            {
                internalType: "bytes32",
                name: "role",
                type: "bytes32",
            },
            {
                internalType: "address",
                name: "account",
                type: "address",
            },
        ],
        name: "revokeRole",
        outputs: [],
        stateMutability: "nonpayable",
        type: "function",
    },
    {
        inputs: [
            {
                internalType: "Token",
                name: "token0",
                type: "address",
            },
            {
                internalType: "Token",
                name: "token1",
                type: "address",
            },
            {
                internalType: "uint256",
                name: "startIndex",
                type: "uint256",
            },
            {
                internalType: "uint256",
                name: "endIndex",
                type: "uint256",
            },
        ],
        name: "strategiesByPair",
        outputs: [
            {
                components: [
                    {
                        internalType: "uint256",
                        name: "id",
                        type: "uint256",
                    },
                    {
                        internalType: "address",
                        name: "owner",
                        type: "address",
                    },
                    {
                        internalType: "Token[2]",
                        name: "tokens",
                        type: "address[2]",
                    },
                    {
                        components: [
                            {
                                internalType: "uint128",
                                name: "y",
                                type: "uint128",
                            },
                            {
                                internalType: "uint128",
                                name: "z",
                                type: "uint128",
                            },
                            {
                                internalType: "uint64",
                                name: "A",
                                type: "uint64",
                            },
                            {
                                internalType: "uint64",
                                name: "B",
                                type: "uint64",
                            },
                        ],
                        internalType: "struct Order[2]",
                        name: "orders",
                        type: "tuple[2]",
                    },
                ],
                internalType: "struct Strategy[]",
                name: "",
                type: "tuple[]",
            },
        ],
        stateMutability: "view",
        type: "function",
    },
    {
        inputs: [
            {
                internalType: "Token",
                name: "token0",
                type: "address",
            },
            {
                internalType: "Token",
                name: "token1",
                type: "address",
            },
        ],
        name: "strategiesByPairCount",
        outputs: [
            {
                internalType: "uint256",
                name: "",
                type: "uint256",
            },
        ],
        stateMutability: "view",
        type: "function",
    },
    {
        inputs: [
            {
                internalType: "uint256",
                name: "id",
                type: "uint256",
            },
        ],
        name: "strategy",
        outputs: [
            {
                components: [
                    {
                        internalType: "uint256",
                        name: "id",
                        type: "uint256",
                    },
                    {
                        internalType: "address",
                        name: "owner",
                        type: "address",
                    },
                    {
                        internalType: "Token[2]",
                        name: "tokens",
                        type: "address[2]",
                    },
                    {
                        components: [
                            {
                                internalType: "uint128",
                                name: "y",
                                type: "uint128",
                            },
                            {
                                internalType: "uint128",
                                name: "z",
                                type: "uint128",
                            },
                            {
                                internalType: "uint64",
                                name: "A",
                                type: "uint64",
                            },
                            {
                                internalType: "uint64",
                                name: "B",
                                type: "uint64",
                            },
                        ],
                        internalType: "struct Order[2]",
                        name: "orders",
                        type: "tuple[2]",
                    },
                ],
                internalType: "struct Strategy",
                name: "",
                type: "tuple",
            },
        ],
        stateMutability: "view",
        type: "function",
    },
    {
        inputs: [
            {
                internalType: "Token",
                name: "sourceToken",
                type: "address",
            },
            {
                internalType: "Token",
                name: "targetToken",
                type: "address",
            },
            {
                components: [
                    {
                        internalType: "uint256",
                        name: "strategyId",
                        type: "uint256",
                    },
                    {
                        internalType: "uint128",
                        name: "amount",
                        type: "uint128",
                    },
                ],
                internalType: "struct TradeAction[]",
                name: "tradeActions",
                type: "tuple[]",
            },
            {
                internalType: "uint256",
                name: "deadline",
                type: "uint256",
            },
            {
                internalType: "uint128",
                name: "minReturn",
                type: "uint128",
            },
        ],
        name: "tradeBySourceAmount",
        outputs: [
            {
                internalType: "uint128",
                name: "",
                type: "uint128",
            },
        ],
        stateMutability: "payable",
        type: "function",
    },
    {
        inputs: [
            {
                internalType: "Token",
                name: "sourceToken",
                type: "address",
            },
            {
                internalType: "Token",
                name: "targetToken",
                type: "address",
            },
            {
                components: [
                    {
                        internalType: "uint256",
                        name: "strategyId",
                        type: "uint256",
                    },
                    {
                        internalType: "uint128",
                        name: "amount",
                        type: "uint128",
                    },
                ],
                internalType: "struct TradeAction[]",
                name: "tradeActions",
                type: "tuple[]",
            },
            {
                internalType: "uint256",
                name: "deadline",
                type: "uint256",
            },
            {
                internalType: "uint128",
                name: "maxInput",
                type: "uint128",
            },
        ],
        name: "tradeByTargetAmount",
        outputs: [
            {
                internalType: "uint128",
                name: "",
                type: "uint128",
            },
        ],
        stateMutability: "payable",
        type: "function",
    },
    {
        inputs: [],
        name: "tradingFeePPM",
        outputs: [
            {
                internalType: "uint32",
                name: "",
                type: "uint32",
            },
        ],
        stateMutability: "view",
        type: "function",
    },
    {
        inputs: [
            {
                internalType: "uint256",
                name: "strategyId",
                type: "uint256",
            },
            {
                components: [
                    {
                        internalType: "uint128",
                        name: "y",
                        type: "uint128",
                    },
                    {
                        internalType: "uint128",
                        name: "z",
                        type: "uint128",
                    },
                    {
                        internalType: "uint64",
                        name: "A",
                        type: "uint64",
                    },
                    {
                        internalType: "uint64",
                        name: "B",
                        type: "uint64",
                    },
                ],
                internalType: "struct Order[2]",
                name: "currentOrders",
                type: "tuple[2]",
            },
            {
                components: [
                    {
                        internalType: "uint128",
                        name: "y",
                        type: "uint128",
                    },
                    {
                        internalType: "uint128",
                        name: "z",
                        type: "uint128",
                    },
                    {
                        internalType: "uint64",
                        name: "A",
                        type: "uint64",
                    },
                    {
                        internalType: "uint64",
                        name: "B",
                        type: "uint64",
                    },
                ],
                internalType: "struct Order[2]",
                name: "newOrders",
                type: "tuple[2]",
            },
        ],
        name: "updateStrategy",
        outputs: [],
        stateMutability: "payable",
        type: "function",
    },
    {
        inputs: [],
        name: "version",
        outputs: [
            {
                internalType: "uint16",
                name: "",
                type: "uint16",
            },
        ],
        stateMutability: "view",
        type: "function",
    },
    {
        inputs: [
            {
                internalType: "Token",
                name: "token",
                type: "address",
            },
            {
                internalType: "uint256",
                name: "amount",
                type: "uint256",
            },
            {
                internalType: "address",
                name: "recipient",
                type: "address",
            },
        ],
        name: "withdrawFees",
        outputs: [
            {
                internalType: "uint256",
                name: "",
                type: "uint256",
            },
        ],
        stateMutability: "nonpayable",
        type: "function",
    },
];
class ICarbonController__factory {
    static abi = _abi;
    static createInterface() {
        return new ethers_1.utils.Interface(_abi);
    }
    static connect(address, signerOrProvider) {
        return new ethers_1.Contract(address, _abi, signerOrProvider);
    }
}
exports.ICarbonController__factory = ICarbonController__factory;
//# sourceMappingURL=ICarbonController__factory.js.map