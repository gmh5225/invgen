import type { TestUpgradeable, TestUpgradeableInterface } from "../../../contracts/helpers/TestUpgradeable";
import type { Provider, TransactionRequest } from "@ethersproject/providers";
import { Signer, ContractFactory, Overrides } from "ethers";
type TestUpgradeableConstructorParams = [signer?: Signer] | ConstructorParameters<typeof ContractFactory>;
export declare class TestUpgradeable__factory extends ContractFactory {
    constructor(...args: TestUpgradeableConstructorParams);
    deploy(overrides?: Overrides & {
        from?: string;
    }): Promise<TestUpgradeable>;
    getDeployTransaction(overrides?: Overrides & {
        from?: string;
    }): TransactionRequest;
    attach(address: string): TestUpgradeable;
    connect(signer: Signer): TestUpgradeable__factory;
    static readonly bytecode = "0x608060405234801561001057600080fd5b50611343806100206000396000f3fe608060405234801561001057600080fd5b506004361061011b5760003560e01c80637072c6b1116100b257806391d1485411610081578063a217fddf11610066578063a217fddf146102c1578063ca15c873146102c9578063d547741f146102dc57600080fd5b806391d148541461026257806393867fb51461029b57600080fd5b80637072c6b1146102145780638129fc1c1461021c5780638cd2403d146102245780639010d07c1461023757600080fd5b80632f2ff15d116100ee5780632f2ff15d146101c757806336568abe146101da57806351a8a3e6146101ed57806354fd4d501461020857600080fd5b806301ffc9a7146101205780630b5779e61461014857806311e96cd514610170578063248a9ca314610196575b600080fd5b61013361012e36600461100f565b6102ef565b60405190151581526020015b60405180910390f35b61016e610156366004611051565b60c9805461ffff191661ffff92909216919091179055565b005b61016e61017e366004611051565b60fb805461ffff191661ffff92909216919091179055565b6101b96101a4366004611075565b60009081526065602052604090206001015490565b60405190815260200161013f565b61016e6101d536600461108e565b61034b565b61016e6101e836600461108e565b610375565b60c95461ffff165b60405161ffff909116815260200161013f565b60fb5461ffff166101f5565b61016e610406565b61016e610432565b61016e6102323660046110ca565b610552565b61024a61024536600461113c565b6105cc565b6040516001600160a01b03909116815260200161013f565b61013361027036600461108e565b60009182526065602090815260408084206001600160a01b0393909316845291905290205460ff1690565b7f2172861495e7b85edac73e3cd5fbb42dd675baadf627720e687bcfdaca0250966101b9565b6101b9600081565b6101b96102d7366004611075565b6105eb565b61016e6102ea36600461108e565b610602565b60007fffffffff0000000000000000000000000000000000000000000000000000000082167f5a05180f000000000000000000000000000000000000000000000000000000001480610345575061034582610627565b92915050565b600082815260656020526040902060010154610366816106be565b61037083836106c8565b505050565b6001600160a01b03811633146103f85760405162461bcd60e51b815260206004820152602f60248201527f416363657373436f6e74726f6c3a2063616e206f6e6c792072656e6f756e636560448201527f20726f6c657320666f722073656c66000000000000000000000000000000000060648201526084015b60405180910390fd5b61040282826106ea565b5050565b6104307f2172861495e7b85edac73e3cd5fbb42dd675baadf627720e687bcfdaca0250963361070c565b565b600054610100900460ff16158080156104525750600054600160ff909116105b8061046c5750303b15801561046c575060005460ff166001145b6104de5760405162461bcd60e51b815260206004820152602e60248201527f496e697469616c697a61626c653a20636f6e747261637420697320616c72656160448201527f647920696e697469616c697a656400000000000000000000000000000000000060648201526084016103ef565b6000805460ff191660011790558015610501576000805461ff0019166101001790555b610509610768565b801561054f576000805461ff0019169055604051600181527f7f26b83ff96e1f2b6a682f133852f6798a09c465da95921460cefb38474024989060200160405180910390a15b50565b60c9546000906105679061ffff166001611174565b905061057660fb5461ffff1690565b61ffff168161ffff16146105b6576040517f0dc149f000000000000000000000000000000000000000000000000000000000815260040160405180910390fd5b60c9805461ffff191661ffff8316179055505050565b60008281526097602052604081206105e490836107e3565b9392505050565b6000818152609760205260408120610345906107ef565b60008281526065602052604090206001015461061d816106be565b61037083836106ea565b60007fffffffff0000000000000000000000000000000000000000000000000000000082167f7965db0b00000000000000000000000000000000000000000000000000000000148061034557507f01ffc9a7000000000000000000000000000000000000000000000000000000007fffffffff00000000000000000000000000000000000000000000000000000000831614610345565b61054f81336107f9565b6106d2828261086e565b60008281526097602052604090206103709082610910565b6106f48282610925565b600082815260976020526040902061037090826109a8565b60008281526065602090815260408083206001600160a01b038516845290915290205460ff16610402576040517f4ca8886700000000000000000000000000000000000000000000000000000000815260040160405180910390fd5b600054610100900460ff166107d35760405162461bcd60e51b815260206004820152602b60248201527f496e697469616c697a61626c653a20636f6e7472616374206973206e6f74206960448201526a6e697469616c697a696e6760a81b60648201526084016103ef565b6107db6109bd565b610430610a38565b60006105e48383610ab3565b6000610345825490565b60008281526065602090815260408083206001600160a01b038516845290915290205460ff166104025761082c81610add565b610837836020610aef565b6040516020016108489291906111b3565b60408051601f198184030181529082905262461bcd60e51b82526103ef91600401611234565b60008281526065602090815260408083206001600160a01b038516845290915290205460ff166104025760008281526065602090815260408083206001600160a01b03851684529091529020805460ff191660011790556108cc3390565b6001600160a01b0316816001600160a01b0316837f2f8788117e7eff1d82e926ec794901d17c78024a50270940304540a733656f0d60405160405180910390a45050565b60006105e4836001600160a01b038416610d18565b60008281526065602090815260408083206001600160a01b038516845290915290205460ff16156104025760008281526065602090815260408083206001600160a01b0385168085529252808320805460ff1916905551339285917ff6391f5c32d9c69d2a47ea670b442974b53935d1edc7fd64eb21e047a839171b9190a45050565b60006105e4836001600160a01b038416610d67565b600054610100900460ff16610a285760405162461bcd60e51b815260206004820152602b60248201527f496e697469616c697a61626c653a20636f6e7472616374206973206e6f74206960448201526a6e697469616c697a696e6760a81b60648201526084016103ef565b610a30610e61565b610430610ecc565b600054610100900460ff16610aa35760405162461bcd60e51b815260206004820152602b60248201527f496e697469616c697a61626c653a20636f6e7472616374206973206e6f74206960448201526a6e697469616c697a696e6760a81b60648201526084016103ef565b60fb805461ffff19166001179055565b6000826000018281548110610aca57610aca611267565b9060005260206000200154905092915050565b60606103456001600160a01b03831660145b60606000610afe83600261127d565b610b09906002611294565b67ffffffffffffffff811115610b2157610b216112a7565b6040519080825280601f01601f191660200182016040528015610b4b576020820181803683370190505b5090507f300000000000000000000000000000000000000000000000000000000000000081600081518110610b8257610b82611267565b60200101907effffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff1916908160001a9053507f780000000000000000000000000000000000000000000000000000000000000081600181518110610be557610be5611267565b60200101907effffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff1916908160001a9053506000610c2184600261127d565b610c2c906001611294565b90505b6001811115610cc9577f303132333435363738396162636465660000000000000000000000000000000085600f1660108110610c6d57610c6d611267565b1a60f81b828281518110610c8357610c83611267565b60200101907effffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff1916908160001a90535060049490941c93610cc2816112bd565b9050610c2f565b5083156105e45760405162461bcd60e51b815260206004820181905260248201527f537472696e67733a20686578206c656e67746820696e73756666696369656e7460448201526064016103ef565b6000818152600183016020526040812054610d5f57508154600181810184556000848152602080822090930184905584548482528286019093526040902091909155610345565b506000610345565b60008181526001830160205260408120548015610e50576000610d8b6001836112f2565b8554909150600090610d9f906001906112f2565b9050818114610e04576000866000018281548110610dbf57610dbf611267565b9060005260206000200154905080876000018481548110610de257610de2611267565b6000918252602080832090910192909255918252600188019052604090208390555b8554869080610e1557610e15611305565b600190038181906000526020600020016000905590558560010160008681526020019081526020016000206000905560019350505050610345565b6000915050610345565b5092915050565b600054610100900460ff166104305760405162461bcd60e51b815260206004820152602b60248201527f496e697469616c697a61626c653a20636f6e7472616374206973206e6f74206960448201526a6e697469616c697a696e6760a81b60648201526084016103ef565b600054610100900460ff16610f375760405162461bcd60e51b815260206004820152602b60248201527f496e697469616c697a61626c653a20636f6e7472616374206973206e6f74206960448201526a6e697469616c697a696e6760a81b60648201526084016103ef565b6001610f4660fb5461ffff1690565b610f50919061131b565b60c9805461ffff191661ffff92909216919091179055610f907f2172861495e7b85edac73e3cd5fbb42dd675baadf627720e687bcfdaca02509680610fba565b6104307f2172861495e7b85edac73e3cd5fbb42dd675baadf627720e687bcfdaca02509633611005565b600082815260656020526040808220600101805490849055905190918391839186917fbd79b86ffe0ab8e8776151514217cd7cacd52c909f66475c3af44e129f0b00ff9190a4505050565b61040282826106c8565b60006020828403121561102157600080fd5b81357fffffffff00000000000000000000000000000000000000000000000000000000811681146105e457600080fd5b60006020828403121561106357600080fd5b813561ffff811681146105e457600080fd5b60006020828403121561108757600080fd5b5035919050565b600080604083850312156110a157600080fd5b8235915060208301356001600160a01b03811681146110bf57600080fd5b809150509250929050565b600080602083850312156110dd57600080fd5b823567ffffffffffffffff808211156110f557600080fd5b818501915085601f83011261110957600080fd5b81358181111561111857600080fd5b86602082850101111561112a57600080fd5b60209290920196919550909350505050565b6000806040838503121561114f57600080fd5b50508035926020909101359150565b634e487b7160e01b600052601160045260246000fd5b61ffff818116838216019080821115610e5a57610e5a61115e565b60005b838110156111aa578181015183820152602001611192565b50506000910152565b7f416363657373436f6e74726f6c3a206163636f756e74200000000000000000008152600083516111eb81601785016020880161118f565b7f206973206d697373696e6720726f6c6520000000000000000000000000000000601791840191820152835161122881602884016020880161118f565b01602801949350505050565b602081526000825180602084015261125381604085016020870161118f565b601f01601f19169190910160400192915050565b634e487b7160e01b600052603260045260246000fd5b80820281158282048414176103455761034561115e565b808201808211156103455761034561115e565b634e487b7160e01b600052604160045260246000fd5b6000816112cc576112cc61115e565b507fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff0190565b818103818111156103455761034561115e565b634e487b7160e01b600052603160045260246000fd5b61ffff828116828216039080821115610e5a57610e5a61115e56fea164736f6c6343000813000a";
    static readonly abi: readonly [{
        readonly inputs: readonly [];
        readonly name: "AccessDenied";
        readonly type: "error";
    }, {
        readonly inputs: readonly [];
        readonly name: "AlreadyInitialized";
        readonly type: "error";
    }, {
        readonly anonymous: false;
        readonly inputs: readonly [{
            readonly indexed: false;
            readonly internalType: "uint8";
            readonly name: "version";
            readonly type: "uint8";
        }];
        readonly name: "Initialized";
        readonly type: "event";
    }, {
        readonly anonymous: false;
        readonly inputs: readonly [{
            readonly indexed: true;
            readonly internalType: "bytes32";
            readonly name: "role";
            readonly type: "bytes32";
        }, {
            readonly indexed: true;
            readonly internalType: "bytes32";
            readonly name: "previousAdminRole";
            readonly type: "bytes32";
        }, {
            readonly indexed: true;
            readonly internalType: "bytes32";
            readonly name: "newAdminRole";
            readonly type: "bytes32";
        }];
        readonly name: "RoleAdminChanged";
        readonly type: "event";
    }, {
        readonly anonymous: false;
        readonly inputs: readonly [{
            readonly indexed: true;
            readonly internalType: "bytes32";
            readonly name: "role";
            readonly type: "bytes32";
        }, {
            readonly indexed: true;
            readonly internalType: "address";
            readonly name: "account";
            readonly type: "address";
        }, {
            readonly indexed: true;
            readonly internalType: "address";
            readonly name: "sender";
            readonly type: "address";
        }];
        readonly name: "RoleGranted";
        readonly type: "event";
    }, {
        readonly anonymous: false;
        readonly inputs: readonly [{
            readonly indexed: true;
            readonly internalType: "bytes32";
            readonly name: "role";
            readonly type: "bytes32";
        }, {
            readonly indexed: true;
            readonly internalType: "address";
            readonly name: "account";
            readonly type: "address";
        }, {
            readonly indexed: true;
            readonly internalType: "address";
            readonly name: "sender";
            readonly type: "address";
        }];
        readonly name: "RoleRevoked";
        readonly type: "event";
    }, {
        readonly inputs: readonly [];
        readonly name: "DEFAULT_ADMIN_ROLE";
        readonly outputs: readonly [{
            readonly internalType: "bytes32";
            readonly name: "";
            readonly type: "bytes32";
        }];
        readonly stateMutability: "view";
        readonly type: "function";
    }, {
        readonly inputs: readonly [{
            readonly internalType: "bytes32";
            readonly name: "role";
            readonly type: "bytes32";
        }];
        readonly name: "getRoleAdmin";
        readonly outputs: readonly [{
            readonly internalType: "bytes32";
            readonly name: "";
            readonly type: "bytes32";
        }];
        readonly stateMutability: "view";
        readonly type: "function";
    }, {
        readonly inputs: readonly [{
            readonly internalType: "bytes32";
            readonly name: "role";
            readonly type: "bytes32";
        }, {
            readonly internalType: "uint256";
            readonly name: "index";
            readonly type: "uint256";
        }];
        readonly name: "getRoleMember";
        readonly outputs: readonly [{
            readonly internalType: "address";
            readonly name: "";
            readonly type: "address";
        }];
        readonly stateMutability: "view";
        readonly type: "function";
    }, {
        readonly inputs: readonly [{
            readonly internalType: "bytes32";
            readonly name: "role";
            readonly type: "bytes32";
        }];
        readonly name: "getRoleMemberCount";
        readonly outputs: readonly [{
            readonly internalType: "uint256";
            readonly name: "";
            readonly type: "uint256";
        }];
        readonly stateMutability: "view";
        readonly type: "function";
    }, {
        readonly inputs: readonly [{
            readonly internalType: "bytes32";
            readonly name: "role";
            readonly type: "bytes32";
        }, {
            readonly internalType: "address";
            readonly name: "account";
            readonly type: "address";
        }];
        readonly name: "grantRole";
        readonly outputs: readonly [];
        readonly stateMutability: "nonpayable";
        readonly type: "function";
    }, {
        readonly inputs: readonly [{
            readonly internalType: "bytes32";
            readonly name: "role";
            readonly type: "bytes32";
        }, {
            readonly internalType: "address";
            readonly name: "account";
            readonly type: "address";
        }];
        readonly name: "hasRole";
        readonly outputs: readonly [{
            readonly internalType: "bool";
            readonly name: "";
            readonly type: "bool";
        }];
        readonly stateMutability: "view";
        readonly type: "function";
    }, {
        readonly inputs: readonly [];
        readonly name: "initializations";
        readonly outputs: readonly [{
            readonly internalType: "uint16";
            readonly name: "";
            readonly type: "uint16";
        }];
        readonly stateMutability: "view";
        readonly type: "function";
    }, {
        readonly inputs: readonly [];
        readonly name: "initialize";
        readonly outputs: readonly [];
        readonly stateMutability: "nonpayable";
        readonly type: "function";
    }, {
        readonly inputs: readonly [{
            readonly internalType: "bytes";
            readonly name: "data";
            readonly type: "bytes";
        }];
        readonly name: "postUpgrade";
        readonly outputs: readonly [];
        readonly stateMutability: "nonpayable";
        readonly type: "function";
    }, {
        readonly inputs: readonly [{
            readonly internalType: "bytes32";
            readonly name: "role";
            readonly type: "bytes32";
        }, {
            readonly internalType: "address";
            readonly name: "account";
            readonly type: "address";
        }];
        readonly name: "renounceRole";
        readonly outputs: readonly [];
        readonly stateMutability: "nonpayable";
        readonly type: "function";
    }, {
        readonly inputs: readonly [];
        readonly name: "restricted";
        readonly outputs: readonly [];
        readonly stateMutability: "view";
        readonly type: "function";
    }, {
        readonly inputs: readonly [{
            readonly internalType: "bytes32";
            readonly name: "role";
            readonly type: "bytes32";
        }, {
            readonly internalType: "address";
            readonly name: "account";
            readonly type: "address";
        }];
        readonly name: "revokeRole";
        readonly outputs: readonly [];
        readonly stateMutability: "nonpayable";
        readonly type: "function";
    }, {
        readonly inputs: readonly [];
        readonly name: "roleAdmin";
        readonly outputs: readonly [{
            readonly internalType: "bytes32";
            readonly name: "";
            readonly type: "bytes32";
        }];
        readonly stateMutability: "pure";
        readonly type: "function";
    }, {
        readonly inputs: readonly [{
            readonly internalType: "uint16";
            readonly name: "newInitializations";
            readonly type: "uint16";
        }];
        readonly name: "setInitializations";
        readonly outputs: readonly [];
        readonly stateMutability: "nonpayable";
        readonly type: "function";
    }, {
        readonly inputs: readonly [{
            readonly internalType: "uint16";
            readonly name: "newVersion";
            readonly type: "uint16";
        }];
        readonly name: "setVersion";
        readonly outputs: readonly [];
        readonly stateMutability: "nonpayable";
        readonly type: "function";
    }, {
        readonly inputs: readonly [{
            readonly internalType: "bytes4";
            readonly name: "interfaceId";
            readonly type: "bytes4";
        }];
        readonly name: "supportsInterface";
        readonly outputs: readonly [{
            readonly internalType: "bool";
            readonly name: "";
            readonly type: "bool";
        }];
        readonly stateMutability: "view";
        readonly type: "function";
    }, {
        readonly inputs: readonly [];
        readonly name: "version";
        readonly outputs: readonly [{
            readonly internalType: "uint16";
            readonly name: "";
            readonly type: "uint16";
        }];
        readonly stateMutability: "view";
        readonly type: "function";
    }];
    static createInterface(): TestUpgradeableInterface;
    static connect(address: string, signerOrProvider: Signer | Provider): TestUpgradeable;
}
export {};
//# sourceMappingURL=TestUpgradeable__factory.d.ts.map