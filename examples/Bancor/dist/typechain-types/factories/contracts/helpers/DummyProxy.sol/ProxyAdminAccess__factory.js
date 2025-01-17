"use strict";
/* Autogenerated file. Do not edit manually. */
Object.defineProperty(exports, "__esModule", { value: true });
exports.ProxyAdminAccess__factory = void 0;
const ethers_1 = require("ethers");
const _abi = [
    {
        anonymous: false,
        inputs: [
            {
                indexed: true,
                internalType: "address",
                name: "previousOwner",
                type: "address",
            },
            {
                indexed: true,
                internalType: "address",
                name: "newOwner",
                type: "address",
            },
        ],
        name: "OwnershipTransferred",
        type: "event",
    },
    {
        inputs: [
            {
                internalType: "contract ITransparentUpgradeableProxy",
                name: "proxy",
                type: "address",
            },
            {
                internalType: "address",
                name: "newAdmin",
                type: "address",
            },
        ],
        name: "changeProxyAdmin",
        outputs: [],
        stateMutability: "nonpayable",
        type: "function",
    },
    {
        inputs: [
            {
                internalType: "contract ITransparentUpgradeableProxy",
                name: "proxy",
                type: "address",
            },
        ],
        name: "getProxyAdmin",
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
                internalType: "contract ITransparentUpgradeableProxy",
                name: "proxy",
                type: "address",
            },
        ],
        name: "getProxyImplementation",
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
        inputs: [],
        name: "owner",
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
        inputs: [],
        name: "renounceOwnership",
        outputs: [],
        stateMutability: "nonpayable",
        type: "function",
    },
    {
        inputs: [
            {
                internalType: "address",
                name: "newOwner",
                type: "address",
            },
        ],
        name: "transferOwnership",
        outputs: [],
        stateMutability: "nonpayable",
        type: "function",
    },
    {
        inputs: [
            {
                internalType: "contract ITransparentUpgradeableProxy",
                name: "proxy",
                type: "address",
            },
            {
                internalType: "address",
                name: "implementation",
                type: "address",
            },
        ],
        name: "upgrade",
        outputs: [],
        stateMutability: "nonpayable",
        type: "function",
    },
    {
        inputs: [
            {
                internalType: "contract ITransparentUpgradeableProxy",
                name: "proxy",
                type: "address",
            },
            {
                internalType: "address",
                name: "implementation",
                type: "address",
            },
            {
                internalType: "bytes",
                name: "data",
                type: "bytes",
            },
        ],
        name: "upgradeAndCall",
        outputs: [],
        stateMutability: "payable",
        type: "function",
    },
];
class ProxyAdminAccess__factory {
    static abi = _abi;
    static createInterface() {
        return new ethers_1.utils.Interface(_abi);
    }
    static connect(address, signerOrProvider) {
        return new ethers_1.Contract(address, _abi, signerOrProvider);
    }
}
exports.ProxyAdminAccess__factory = ProxyAdminAccess__factory;
//# sourceMappingURL=ProxyAdminAccess__factory.js.map