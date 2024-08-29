import type { ProxyAdmin, ProxyAdminInterface } from "../../../../../@openzeppelin/contracts/proxy/transparent/ProxyAdmin";
import type { Provider, TransactionRequest } from "@ethersproject/providers";
import { Signer, ContractFactory, Overrides } from "ethers";
type ProxyAdminConstructorParams = [signer?: Signer] | ConstructorParameters<typeof ContractFactory>;
export declare class ProxyAdmin__factory extends ContractFactory {
    constructor(...args: ProxyAdminConstructorParams);
    deploy(overrides?: Overrides & {
        from?: string;
    }): Promise<ProxyAdmin>;
    getDeployTransaction(overrides?: Overrides & {
        from?: string;
    }): TransactionRequest;
    attach(address: string): ProxyAdmin;
    connect(signer: Signer): ProxyAdmin__factory;
    static readonly bytecode = "0x608060405234801561001057600080fd5b5061001a3361001f565b61006f565b600080546001600160a01b038381166001600160a01b0319831681178455604051919092169283917f8be0079c531659141344cd1fd0a4f28419497f9722a3daafe3b4186f6b6457e09190a35050565b6107648061007e6000396000f3fe60806040526004361061007b5760003560e01c80639623609d1161004e5780639623609d1461011157806399a88ec414610124578063f2fde38b14610144578063f3b7dead1461016457600080fd5b8063204e1c7a14610080578063715018a6146100bc5780637eff275e146100d35780638da5cb5b146100f3575b600080fd5b34801561008c57600080fd5b506100a061009b366004610579565b610184565b6040516001600160a01b03909116815260200160405180910390f35b3480156100c857600080fd5b506100d161022e565b005b3480156100df57600080fd5b506100d16100ee36600461059d565b610242565b3480156100ff57600080fd5b506000546001600160a01b03166100a0565b6100d161011f366004610605565b6102c3565b34801561013057600080fd5b506100d161013f36600461059d565b61034b565b34801561015057600080fd5b506100d161015f366004610579565b61039a565b34801561017057600080fd5b506100a061017f366004610579565b610449565b6000806000836001600160a01b03166040516101c3907f5c60da1b00000000000000000000000000000000000000000000000000000000815260040190565b600060405180830381855afa9150503d80600081146101fe576040519150601f19603f3d011682016040523d82523d6000602084013e610203565b606091505b50915091508161021257600080fd5b8080602001905181019061022691906106db565b949350505050565b610236610488565b61024060006104fc565b565b61024a610488565b6040517f8f2839700000000000000000000000000000000000000000000000000000000081526001600160a01b038281166004830152831690638f283970906024015b600060405180830381600087803b1580156102a757600080fd5b505af11580156102bb573d6000803e3d6000fd5b505050505050565b6102cb610488565b6040517f4f1ef2860000000000000000000000000000000000000000000000000000000081526001600160a01b03841690634f1ef28690349061031490869086906004016106f8565b6000604051808303818588803b15801561032d57600080fd5b505af1158015610341573d6000803e3d6000fd5b5050505050505050565b610353610488565b6040517f3659cfe60000000000000000000000000000000000000000000000000000000081526001600160a01b038281166004830152831690633659cfe69060240161028d565b6103a2610488565b6001600160a01b03811661043d576040517f08c379a000000000000000000000000000000000000000000000000000000000815260206004820152602660248201527f4f776e61626c653a206e6577206f776e657220697320746865207a65726f206160448201527f646472657373000000000000000000000000000000000000000000000000000060648201526084015b60405180910390fd5b610446816104fc565b50565b6000806000836001600160a01b03166040516101c3907ff851a44000000000000000000000000000000000000000000000000000000000815260040190565b6000546001600160a01b03163314610240576040517f08c379a000000000000000000000000000000000000000000000000000000000815260206004820181905260248201527f4f776e61626c653a2063616c6c6572206973206e6f7420746865206f776e65726044820152606401610434565b600080546001600160a01b038381167fffffffffffffffffffffffff0000000000000000000000000000000000000000831681178455604051919092169283917f8be0079c531659141344cd1fd0a4f28419497f9722a3daafe3b4186f6b6457e09190a35050565b6001600160a01b038116811461044657600080fd5b60006020828403121561058b57600080fd5b813561059681610564565b9392505050565b600080604083850312156105b057600080fd5b82356105bb81610564565b915060208301356105cb81610564565b809150509250929050565b7f4e487b7100000000000000000000000000000000000000000000000000000000600052604160045260246000fd5b60008060006060848603121561061a57600080fd5b833561062581610564565b9250602084013561063581610564565b9150604084013567ffffffffffffffff8082111561065257600080fd5b818601915086601f83011261066657600080fd5b813581811115610678576106786105d6565b604051601f8201601f19908116603f011681019083821181831017156106a0576106a06105d6565b816040528281528960208487010111156106b957600080fd5b8260208601602083013760006020848301015280955050505050509250925092565b6000602082840312156106ed57600080fd5b815161059681610564565b6001600160a01b038316815260006020604081840152835180604085015260005b8181101561073557858101830151858201606001528201610719565b506000606082860101526060601f19601f83011685010192505050939250505056fea164736f6c6343000813000a";
    static readonly abi: readonly [{
        readonly anonymous: false;
        readonly inputs: readonly [{
            readonly indexed: true;
            readonly internalType: "address";
            readonly name: "previousOwner";
            readonly type: "address";
        }, {
            readonly indexed: true;
            readonly internalType: "address";
            readonly name: "newOwner";
            readonly type: "address";
        }];
        readonly name: "OwnershipTransferred";
        readonly type: "event";
    }, {
        readonly inputs: readonly [{
            readonly internalType: "contract ITransparentUpgradeableProxy";
            readonly name: "proxy";
            readonly type: "address";
        }, {
            readonly internalType: "address";
            readonly name: "newAdmin";
            readonly type: "address";
        }];
        readonly name: "changeProxyAdmin";
        readonly outputs: readonly [];
        readonly stateMutability: "nonpayable";
        readonly type: "function";
    }, {
        readonly inputs: readonly [{
            readonly internalType: "contract ITransparentUpgradeableProxy";
            readonly name: "proxy";
            readonly type: "address";
        }];
        readonly name: "getProxyAdmin";
        readonly outputs: readonly [{
            readonly internalType: "address";
            readonly name: "";
            readonly type: "address";
        }];
        readonly stateMutability: "view";
        readonly type: "function";
    }, {
        readonly inputs: readonly [{
            readonly internalType: "contract ITransparentUpgradeableProxy";
            readonly name: "proxy";
            readonly type: "address";
        }];
        readonly name: "getProxyImplementation";
        readonly outputs: readonly [{
            readonly internalType: "address";
            readonly name: "";
            readonly type: "address";
        }];
        readonly stateMutability: "view";
        readonly type: "function";
    }, {
        readonly inputs: readonly [];
        readonly name: "owner";
        readonly outputs: readonly [{
            readonly internalType: "address";
            readonly name: "";
            readonly type: "address";
        }];
        readonly stateMutability: "view";
        readonly type: "function";
    }, {
        readonly inputs: readonly [];
        readonly name: "renounceOwnership";
        readonly outputs: readonly [];
        readonly stateMutability: "nonpayable";
        readonly type: "function";
    }, {
        readonly inputs: readonly [{
            readonly internalType: "address";
            readonly name: "newOwner";
            readonly type: "address";
        }];
        readonly name: "transferOwnership";
        readonly outputs: readonly [];
        readonly stateMutability: "nonpayable";
        readonly type: "function";
    }, {
        readonly inputs: readonly [{
            readonly internalType: "contract ITransparentUpgradeableProxy";
            readonly name: "proxy";
            readonly type: "address";
        }, {
            readonly internalType: "address";
            readonly name: "implementation";
            readonly type: "address";
        }];
        readonly name: "upgrade";
        readonly outputs: readonly [];
        readonly stateMutability: "nonpayable";
        readonly type: "function";
    }, {
        readonly inputs: readonly [{
            readonly internalType: "contract ITransparentUpgradeableProxy";
            readonly name: "proxy";
            readonly type: "address";
        }, {
            readonly internalType: "address";
            readonly name: "implementation";
            readonly type: "address";
        }, {
            readonly internalType: "bytes";
            readonly name: "data";
            readonly type: "bytes";
        }];
        readonly name: "upgradeAndCall";
        readonly outputs: readonly [];
        readonly stateMutability: "payable";
        readonly type: "function";
    }];
    static createInterface(): ProxyAdminInterface;
    static connect(address: string, signerOrProvider: Signer | Provider): ProxyAdmin;
}
export {};
//# sourceMappingURL=ProxyAdmin__factory.d.ts.map