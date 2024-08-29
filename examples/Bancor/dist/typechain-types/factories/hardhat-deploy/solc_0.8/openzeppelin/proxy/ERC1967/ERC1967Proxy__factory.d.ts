import type { ERC1967Proxy, ERC1967ProxyInterface } from "../../../../../../hardhat-deploy/solc_0.8/openzeppelin/proxy/ERC1967/ERC1967Proxy";
import type { Provider, TransactionRequest } from "@ethersproject/providers";
import { Signer, ContractFactory, PayableOverrides, BytesLike } from "ethers";
type ERC1967ProxyConstructorParams = [signer?: Signer] | ConstructorParameters<typeof ContractFactory>;
export declare class ERC1967Proxy__factory extends ContractFactory {
    constructor(...args: ERC1967ProxyConstructorParams);
    deploy(_logic: string, _data: BytesLike, overrides?: PayableOverrides & {
        from?: string;
    }): Promise<ERC1967Proxy>;
    getDeployTransaction(_logic: string, _data: BytesLike, overrides?: PayableOverrides & {
        from?: string;
    }): TransactionRequest;
    attach(address: string): ERC1967Proxy;
    connect(signer: Signer): ERC1967Proxy__factory;
    static readonly bytecode = "0x60806040526040516105483803806105488339810160408190526100229161030a565b61004d60017f360894a13ba1a3210667c828492db98dca3e2076cc3735a920a3ca505d382bbd6103d8565b60008051602061050183398151915214610069576100696103f9565b6100758282600061007c565b505061045e565b610085836100a8565b6000825111806100925750805b156100a3576100a183836100e8565b505b505050565b6100b181610116565b6040516001600160a01b038216907fbc7cd75a20ee27fd9adebab32041f755214dbc6bffa90cc0225b39da2e5c2d3b90600090a250565b606061010d8383604051806060016040528060278152602001610521602791396101b7565b90505b92915050565b6001600160a01b0381163b6101885760405162461bcd60e51b815260206004820152602d60248201527f455243313936373a206e657720696d706c656d656e746174696f6e206973206e60448201526c1bdd08184818dbdb9d1c9858dd609a1b60648201526084015b60405180910390fd5b60008051602061050183398151915280546001600160a01b0319166001600160a01b0392909216919091179055565b60606001600160a01b0384163b61021f5760405162461bcd60e51b815260206004820152602660248201527f416464726573733a2064656c65676174652063616c6c20746f206e6f6e2d636f6044820152651b9d1c9858dd60d21b606482015260840161017f565b600080856001600160a01b03168560405161023a919061040f565b600060405180830381855af49150503d8060008114610275576040519150601f19603f3d011682016040523d82523d6000602084013e61027a565b606091505b50909250905061028b828286610297565b925050505b9392505050565b606083156102a6575081610290565b8251156102b65782518084602001fd5b8160405162461bcd60e51b815260040161017f919061042b565b634e487b7160e01b600052604160045260246000fd5b60005b838110156103015781810151838201526020016102e9565b50506000910152565b6000806040838503121561031d57600080fd5b82516001600160a01b038116811461033457600080fd5b60208401519092506001600160401b038082111561035157600080fd5b818501915085601f83011261036557600080fd5b815181811115610377576103776102d0565b604051601f8201601f19908116603f0116810190838211818310171561039f5761039f6102d0565b816040528281528860208487010111156103b857600080fd5b6103c98360208301602088016102e6565b80955050505050509250929050565b8181038181111561011057634e487b7160e01b600052601160045260246000fd5b634e487b7160e01b600052600160045260246000fd5b600082516104218184602087016102e6565b9190910192915050565b602081526000825180602084015261044a8160408501602087016102e6565b601f01601f19169190910160400192915050565b60958061046c6000396000f3fe608060405236601057600e6013565b005b600e5b601f601b6021565b6065565b565b600060607f360894a13ba1a3210667c828492db98dca3e2076cc3735a920a3ca505d382bbc5473ffffffffffffffffffffffffffffffffffffffff1690565b905090565b3660008037600080366000845af43d6000803e8080156083573d6000f35b3d6000fdfea164736f6c6343000813000a360894a13ba1a3210667c828492db98dca3e2076cc3735a920a3ca505d382bbc416464726573733a206c6f772d6c6576656c2064656c65676174652063616c6c206661696c6564";
    static readonly abi: readonly [{
        readonly inputs: readonly [{
            readonly internalType: "address";
            readonly name: "_logic";
            readonly type: "address";
        }, {
            readonly internalType: "bytes";
            readonly name: "_data";
            readonly type: "bytes";
        }];
        readonly stateMutability: "payable";
        readonly type: "constructor";
    }, {
        readonly anonymous: false;
        readonly inputs: readonly [{
            readonly indexed: false;
            readonly internalType: "address";
            readonly name: "previousAdmin";
            readonly type: "address";
        }, {
            readonly indexed: false;
            readonly internalType: "address";
            readonly name: "newAdmin";
            readonly type: "address";
        }];
        readonly name: "AdminChanged";
        readonly type: "event";
    }, {
        readonly anonymous: false;
        readonly inputs: readonly [{
            readonly indexed: true;
            readonly internalType: "address";
            readonly name: "beacon";
            readonly type: "address";
        }];
        readonly name: "BeaconUpgraded";
        readonly type: "event";
    }, {
        readonly anonymous: false;
        readonly inputs: readonly [{
            readonly indexed: true;
            readonly internalType: "address";
            readonly name: "implementation";
            readonly type: "address";
        }];
        readonly name: "Upgraded";
        readonly type: "event";
    }, {
        readonly stateMutability: "payable";
        readonly type: "fallback";
    }, {
        readonly stateMutability: "payable";
        readonly type: "receive";
    }];
    static createInterface(): ERC1967ProxyInterface;
    static connect(address: string, signerOrProvider: Signer | Provider): ERC1967Proxy;
}
export {};
//# sourceMappingURL=ERC1967Proxy__factory.d.ts.map