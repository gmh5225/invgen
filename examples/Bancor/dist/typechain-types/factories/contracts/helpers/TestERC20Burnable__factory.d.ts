import type { TestERC20Burnable, TestERC20BurnableInterface } from "../../../contracts/helpers/TestERC20Burnable";
import type { Provider, TransactionRequest } from "@ethersproject/providers";
import { Signer, ContractFactory, BigNumberish, Overrides } from "ethers";
type TestERC20BurnableConstructorParams = [signer?: Signer] | ConstructorParameters<typeof ContractFactory>;
export declare class TestERC20Burnable__factory extends ContractFactory {
    constructor(...args: TestERC20BurnableConstructorParams);
    deploy(name: string, symbol: string, totalSupply: BigNumberish, overrides?: Overrides & {
        from?: string;
    }): Promise<TestERC20Burnable>;
    getDeployTransaction(name: string, symbol: string, totalSupply: BigNumberish, overrides?: Overrides & {
        from?: string;
    }): TransactionRequest;
    attach(address: string): TestERC20Burnable;
    connect(signer: Signer): TestERC20Burnable__factory;
    static readonly bytecode = "0x6101606040526009805460ff191660121790553480156200001f57600080fd5b5060405162001b2238038062001b2283398101604081905262000042916200036b565b8282828280604051806040016040528060018152602001603160f81b815250858581600390816200007491906200046c565b5060046200008382826200046c565b50620000959150839050600562000156565b61012052620000a681600662000156565b61014052815160208084019190912060e052815190820120610100524660a0526200013460e05161010051604080517f8b73c3c69bb8fe3d512ecc4cf759cc79239f7b179b0ffacaa9a75d522b39400f60208201529081019290925260608201524660808201523060a082015260009060c00160405160208183030381529060405280519060200120905090565b60805250503060c052506200014a33826200018f565b505050505050620005b4565b600060208351101562000176576200016e8362000256565b905062000189565b816200018384826200046c565b5060ff90505b92915050565b6001600160a01b038216620001eb5760405162461bcd60e51b815260206004820152601f60248201527f45524332303a206d696e7420746f20746865207a65726f20616464726573730060448201526064015b60405180910390fd5b8060026000828254620001ff919062000538565b90915550506001600160a01b038216600081815260208181526040808320805486019055518481527fddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef910160405180910390a35050565b600080829050601f8151111562000284578260405163305a27a960e01b8152600401620001e291906200055a565b805162000291826200058f565b179392505050565b505050565b634e487b7160e01b600052604160045260246000fd5b60005b83811015620002d1578181015183820152602001620002b7565b50506000910152565b600082601f830112620002ec57600080fd5b81516001600160401b03808211156200030957620003096200029e565b604051601f8301601f19908116603f011681019082821181831017156200033457620003346200029e565b816040528381528660208588010111156200034e57600080fd5b62000361846020830160208901620002b4565b9695505050505050565b6000806000606084860312156200038157600080fd5b83516001600160401b03808211156200039957600080fd5b620003a787838801620002da565b94506020860151915080821115620003be57600080fd5b50620003cd86828701620002da565b925050604084015190509250925092565b600181811c90821680620003f357607f821691505b6020821081036200041457634e487b7160e01b600052602260045260246000fd5b50919050565b601f8211156200029957600081815260208120601f850160051c81016020861015620004435750805b601f850160051c820191505b8181101562000464578281556001016200044f565b505050505050565b81516001600160401b038111156200048857620004886200029e565b620004a081620004998454620003de565b846200041a565b602080601f831160018114620004d85760008415620004bf5750858301515b600019600386901b1c1916600185901b17855562000464565b600085815260208120601f198616915b828110156200050957888601518255948401946001909101908401620004e8565b5085821015620005285787850151600019600388901b60f8161c191681555b5050505050600190811b01905550565b808201808211156200018957634e487b7160e01b600052601160045260246000fd5b60208152600082518060208401526200057b816040850160208701620002b4565b601f01601f19169190910160400192915050565b80516020808301519190811015620004145760001960209190910360031b1b16919050565b60805160a05160c05160e0516101005161012051610140516115136200060f60003960006104e5015260006104ba01526000610c5101526000610c2901526000610b8401526000610bae01526000610bd801526115136000f3fe608060405234801561001057600080fd5b50600436106101365760003560e01c806370a08231116100b257806395d89b4111610081578063a9059cbb11610066578063a9059cbb146102b2578063d505accf146102c5578063dd62ed3e146102d857600080fd5b806395d89b4114610297578063a457c2d71461029f57600080fd5b806370a082311461022d57806379cc6790146102565780637ecebe001461026957806384b0196e1461027c57600080fd5b806323b872dd116101095780633644e515116100ee5780633644e515146101ff578063395093511461020757806342966c681461021a57600080fd5b806323b872dd146101d2578063313ce567146101e557600080fd5b806306fdde031461013b578063095ea7b3146101595780630ce83a611461017c57806318160ddd146101c0575b600080fd5b610143610311565b6040516101509190611235565b60405180910390f35b61016c61016736600461126b565b6103a3565b6040519015158152602001610150565b6101be61018a3660046112a6565b600980547fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff001660ff92909216919091179055565b005b6002545b604051908152602001610150565b61016c6101e03660046112c1565b6103bd565b6101ed6103e1565b60405160ff9091168152602001610150565b6101c46103f4565b61016c61021536600461126b565b6103fe565b6101be6102283660046112fd565b61043d565b6101c461023b366004611316565b6001600160a01b031660009081526020819052604090205490565b6101be61026436600461126b565b61044a565b6101c4610277366004611316565b61048e565b6102846104ac565b6040516101509796959493929190611331565b610143610551565b61016c6102ad36600461126b565b610560565b61016c6102c036600461126b565b61060f565b6101be6102d33660046113e3565b61061d565b6101c46102e636600461144d565b6001600160a01b03918216600090815260016020908152604080832093909416825291909152205490565b60606003805461032090611480565b80601f016020809104026020016040519081016040528092919081815260200182805461034c90611480565b80156103995780601f1061036e57610100808354040283529160200191610399565b820191906000526020600020905b81548152906001019060200180831161037c57829003601f168201915b5050505050905090565b6000336103b1818585610781565b60019150505b92915050565b6000336103cb8582856108da565b6103d685858561098a565b506001949350505050565b60006103ef60095460ff1690565b905090565b60006103ef610b77565b3360008181526001602090815260408083206001600160a01b03871684529091528120549091906103b190829086906104389087906114ca565b610781565b6104473382610ca2565b50565b6001600160a01b0382166000908152600160209081526040808320338085529252909120546104809184916104389085906114dd565b61048a8282610ca2565b5050565b6001600160a01b0381166000908152600760205260408120546103b7565b6000606080828080836104e07f00000000000000000000000000000000000000000000000000000000000000006005610e03565b61050b7f00000000000000000000000000000000000000000000000000000000000000006006610e03565b604080516000808252602082019092527f0f000000000000000000000000000000000000000000000000000000000000009b939a50919850469750309650945092509050565b60606004805461032090611480565b3360008181526001602090815260408083206001600160a01b0387168452909152812054909190838110156106025760405162461bcd60e51b815260206004820152602560248201527f45524332303a2064656372656173656420616c6c6f77616e63652062656c6f7760448201527f207a65726f00000000000000000000000000000000000000000000000000000060648201526084015b60405180910390fd5b6103d68286868403610781565b6000336103b181858561098a565b8342111561066d5760405162461bcd60e51b815260206004820152601d60248201527f45524332305065726d69743a206578706972656420646561646c696e6500000060448201526064016105f9565b60007f6e71edae12b1b97f4d1f60370fef10105fa2faae0126114a169c64845d6126c988888861069c8c610eae565b6040805160208101969096526001600160a01b0394851690860152929091166060840152608083015260a082015260c0810186905260e00160405160208183030381529060405280519060200120905060006106f782610ed6565b9050600061070782878787610f1e565b9050896001600160a01b0316816001600160a01b03161461076a5760405162461bcd60e51b815260206004820152601e60248201527f45524332305065726d69743a20696e76616c6964207369676e6174757265000060448201526064016105f9565b6107758a8a8a610781565b50505050505050505050565b6001600160a01b0383166107fc5760405162461bcd60e51b8152602060048201526024808201527f45524332303a20617070726f76652066726f6d20746865207a65726f2061646460448201527f726573730000000000000000000000000000000000000000000000000000000060648201526084016105f9565b6001600160a01b0382166108785760405162461bcd60e51b815260206004820152602260248201527f45524332303a20617070726f766520746f20746865207a65726f20616464726560448201527f737300000000000000000000000000000000000000000000000000000000000060648201526084016105f9565b6001600160a01b0383811660008181526001602090815260408083209487168084529482529182902085905590518481527f8c5be1e5ebec7d5bd14f71427d1e84f3dd0314c0f7b2291e5b200ac8c7c3b92591015b60405180910390a3505050565b6001600160a01b038381166000908152600160209081526040808320938616835292905220547fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff811461098457818110156109775760405162461bcd60e51b815260206004820152601d60248201527f45524332303a20696e73756666696369656e7420616c6c6f77616e636500000060448201526064016105f9565b6109848484848403610781565b50505050565b6001600160a01b038316610a065760405162461bcd60e51b815260206004820152602560248201527f45524332303a207472616e736665722066726f6d20746865207a65726f20616460448201527f647265737300000000000000000000000000000000000000000000000000000060648201526084016105f9565b6001600160a01b038216610a825760405162461bcd60e51b815260206004820152602360248201527f45524332303a207472616e7366657220746f20746865207a65726f206164647260448201527f657373000000000000000000000000000000000000000000000000000000000060648201526084016105f9565b6001600160a01b03831660009081526020819052604090205481811015610b115760405162461bcd60e51b815260206004820152602660248201527f45524332303a207472616e7366657220616d6f756e742065786365656473206260448201527f616c616e6365000000000000000000000000000000000000000000000000000060648201526084016105f9565b6001600160a01b03848116600081815260208181526040808320878703905593871680835291849020805487019055925185815290927fddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef910160405180910390a3610984565b6000306001600160a01b037f000000000000000000000000000000000000000000000000000000000000000016148015610bd057507f000000000000000000000000000000000000000000000000000000000000000046145b15610bfa57507f000000000000000000000000000000000000000000000000000000000000000090565b6103ef604080517f8b73c3c69bb8fe3d512ecc4cf759cc79239f7b179b0ffacaa9a75d522b39400f60208201527f0000000000000000000000000000000000000000000000000000000000000000918101919091527f000000000000000000000000000000000000000000000000000000000000000060608201524660808201523060a082015260009060c00160405160208183030381529060405280519060200120905090565b6001600160a01b038216610d1e5760405162461bcd60e51b815260206004820152602160248201527f45524332303a206275726e2066726f6d20746865207a65726f2061646472657360448201527f730000000000000000000000000000000000000000000000000000000000000060648201526084016105f9565b6001600160a01b03821660009081526020819052604090205481811015610dad5760405162461bcd60e51b815260206004820152602260248201527f45524332303a206275726e20616d6f756e7420657863656564732062616c616e60448201527f636500000000000000000000000000000000000000000000000000000000000060648201526084016105f9565b6001600160a01b0383166000818152602081815260408083208686039055600280548790039055518581529192917fddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef91016108cd565b606060ff8314610e1d57610e1683610f46565b90506103b7565b818054610e2990611480565b80601f0160208091040260200160405190810160405280929190818152602001828054610e5590611480565b8015610ea25780601f10610e7757610100808354040283529160200191610ea2565b820191906000526020600020905b815481529060010190602001808311610e8557829003601f168201915b505050505090506103b7565b6001600160a01b03811660009081526007602052604090208054600181018255905b50919050565b60006103b7610ee3610b77565b836040517f19010000000000000000000000000000000000000000000000000000000000008152600281019290925260228201526042902090565b6000806000610f2f87878787610f85565b91509150610f3c81611049565b5095945050505050565b60606000610f53836111ae565b604080516020808252818301909252919250600091906020820181803683375050509182525060208101929092525090565b6000807f7fffffffffffffffffffffffffffffff5d576e7357a4501ddfe92f46681b20a0831115610fbc5750600090506003611040565b6040805160008082526020820180845289905260ff881692820192909252606081018690526080810185905260019060a0016020604051602081039080840390855afa158015611010573d6000803e3d6000fd5b5050604051601f1901519150506001600160a01b03811661103957600060019250925050611040565b9150600090505b94509492505050565b600081600481111561105d5761105d6114f0565b036110655750565b6001816004811115611079576110796114f0565b036110c65760405162461bcd60e51b815260206004820152601860248201527f45434453413a20696e76616c6964207369676e6174757265000000000000000060448201526064016105f9565b60028160048111156110da576110da6114f0565b036111275760405162461bcd60e51b815260206004820152601f60248201527f45434453413a20696e76616c6964207369676e6174757265206c656e6774680060448201526064016105f9565b600381600481111561113b5761113b6114f0565b036104475760405162461bcd60e51b815260206004820152602260248201527f45434453413a20696e76616c6964207369676e6174757265202773272076616c60448201527f756500000000000000000000000000000000000000000000000000000000000060648201526084016105f9565b600060ff8216601f8111156103b7576040517fb3512b0c00000000000000000000000000000000000000000000000000000000815260040160405180910390fd5b6000815180845260005b81811015611215576020818501810151868301820152016111f9565b506000602082860101526020601f19601f83011685010191505092915050565b60208152600061124860208301846111ef565b9392505050565b80356001600160a01b038116811461126657600080fd5b919050565b6000806040838503121561127e57600080fd5b6112878361124f565b946020939093013593505050565b803560ff8116811461126657600080fd5b6000602082840312156112b857600080fd5b61124882611295565b6000806000606084860312156112d657600080fd5b6112df8461124f565b92506112ed6020850161124f565b9150604084013590509250925092565b60006020828403121561130f57600080fd5b5035919050565b60006020828403121561132857600080fd5b6112488261124f565b7fff00000000000000000000000000000000000000000000000000000000000000881681526000602060e08184015261136d60e084018a6111ef565b838103604085015261137f818a6111ef565b606085018990526001600160a01b038816608086015260a0850187905284810360c0860152855180825283870192509083019060005b818110156113d1578351835292840192918401916001016113b5565b50909c9b505050505050505050505050565b600080600080600080600060e0888a0312156113fe57600080fd5b6114078861124f565b96506114156020890161124f565b9550604088013594506060880135935061143160808901611295565b925060a0880135915060c0880135905092959891949750929550565b6000806040838503121561146057600080fd5b6114698361124f565b91506114776020840161124f565b90509250929050565b600181811c9082168061149457607f821691505b602082108103610ed057634e487b7160e01b600052602260045260246000fd5b634e487b7160e01b600052601160045260246000fd5b808201808211156103b7576103b76114b4565b818103818111156103b7576103b76114b4565b634e487b7160e01b600052602160045260246000fdfea164736f6c6343000813000a";
    static readonly abi: readonly [{
        readonly inputs: readonly [{
            readonly internalType: "string";
            readonly name: "name";
            readonly type: "string";
        }, {
            readonly internalType: "string";
            readonly name: "symbol";
            readonly type: "string";
        }, {
            readonly internalType: "uint256";
            readonly name: "totalSupply";
            readonly type: "uint256";
        }];
        readonly stateMutability: "nonpayable";
        readonly type: "constructor";
    }, {
        readonly inputs: readonly [];
        readonly name: "InvalidShortString";
        readonly type: "error";
    }, {
        readonly inputs: readonly [{
            readonly internalType: "string";
            readonly name: "str";
            readonly type: "string";
        }];
        readonly name: "StringTooLong";
        readonly type: "error";
    }, {
        readonly anonymous: false;
        readonly inputs: readonly [{
            readonly indexed: true;
            readonly internalType: "address";
            readonly name: "owner";
            readonly type: "address";
        }, {
            readonly indexed: true;
            readonly internalType: "address";
            readonly name: "spender";
            readonly type: "address";
        }, {
            readonly indexed: false;
            readonly internalType: "uint256";
            readonly name: "value";
            readonly type: "uint256";
        }];
        readonly name: "Approval";
        readonly type: "event";
    }, {
        readonly anonymous: false;
        readonly inputs: readonly [];
        readonly name: "EIP712DomainChanged";
        readonly type: "event";
    }, {
        readonly anonymous: false;
        readonly inputs: readonly [{
            readonly indexed: true;
            readonly internalType: "address";
            readonly name: "from";
            readonly type: "address";
        }, {
            readonly indexed: true;
            readonly internalType: "address";
            readonly name: "to";
            readonly type: "address";
        }, {
            readonly indexed: false;
            readonly internalType: "uint256";
            readonly name: "value";
            readonly type: "uint256";
        }];
        readonly name: "Transfer";
        readonly type: "event";
    }, {
        readonly inputs: readonly [];
        readonly name: "DOMAIN_SEPARATOR";
        readonly outputs: readonly [{
            readonly internalType: "bytes32";
            readonly name: "";
            readonly type: "bytes32";
        }];
        readonly stateMutability: "view";
        readonly type: "function";
    }, {
        readonly inputs: readonly [{
            readonly internalType: "address";
            readonly name: "owner";
            readonly type: "address";
        }, {
            readonly internalType: "address";
            readonly name: "spender";
            readonly type: "address";
        }];
        readonly name: "allowance";
        readonly outputs: readonly [{
            readonly internalType: "uint256";
            readonly name: "";
            readonly type: "uint256";
        }];
        readonly stateMutability: "view";
        readonly type: "function";
    }, {
        readonly inputs: readonly [{
            readonly internalType: "address";
            readonly name: "spender";
            readonly type: "address";
        }, {
            readonly internalType: "uint256";
            readonly name: "amount";
            readonly type: "uint256";
        }];
        readonly name: "approve";
        readonly outputs: readonly [{
            readonly internalType: "bool";
            readonly name: "";
            readonly type: "bool";
        }];
        readonly stateMutability: "nonpayable";
        readonly type: "function";
    }, {
        readonly inputs: readonly [{
            readonly internalType: "address";
            readonly name: "account";
            readonly type: "address";
        }];
        readonly name: "balanceOf";
        readonly outputs: readonly [{
            readonly internalType: "uint256";
            readonly name: "";
            readonly type: "uint256";
        }];
        readonly stateMutability: "view";
        readonly type: "function";
    }, {
        readonly inputs: readonly [{
            readonly internalType: "uint256";
            readonly name: "amount";
            readonly type: "uint256";
        }];
        readonly name: "burn";
        readonly outputs: readonly [];
        readonly stateMutability: "nonpayable";
        readonly type: "function";
    }, {
        readonly inputs: readonly [{
            readonly internalType: "address";
            readonly name: "recipient";
            readonly type: "address";
        }, {
            readonly internalType: "uint256";
            readonly name: "amount";
            readonly type: "uint256";
        }];
        readonly name: "burnFrom";
        readonly outputs: readonly [];
        readonly stateMutability: "nonpayable";
        readonly type: "function";
    }, {
        readonly inputs: readonly [];
        readonly name: "decimals";
        readonly outputs: readonly [{
            readonly internalType: "uint8";
            readonly name: "";
            readonly type: "uint8";
        }];
        readonly stateMutability: "view";
        readonly type: "function";
    }, {
        readonly inputs: readonly [{
            readonly internalType: "address";
            readonly name: "spender";
            readonly type: "address";
        }, {
            readonly internalType: "uint256";
            readonly name: "subtractedValue";
            readonly type: "uint256";
        }];
        readonly name: "decreaseAllowance";
        readonly outputs: readonly [{
            readonly internalType: "bool";
            readonly name: "";
            readonly type: "bool";
        }];
        readonly stateMutability: "nonpayable";
        readonly type: "function";
    }, {
        readonly inputs: readonly [];
        readonly name: "eip712Domain";
        readonly outputs: readonly [{
            readonly internalType: "bytes1";
            readonly name: "fields";
            readonly type: "bytes1";
        }, {
            readonly internalType: "string";
            readonly name: "name";
            readonly type: "string";
        }, {
            readonly internalType: "string";
            readonly name: "version";
            readonly type: "string";
        }, {
            readonly internalType: "uint256";
            readonly name: "chainId";
            readonly type: "uint256";
        }, {
            readonly internalType: "address";
            readonly name: "verifyingContract";
            readonly type: "address";
        }, {
            readonly internalType: "bytes32";
            readonly name: "salt";
            readonly type: "bytes32";
        }, {
            readonly internalType: "uint256[]";
            readonly name: "extensions";
            readonly type: "uint256[]";
        }];
        readonly stateMutability: "view";
        readonly type: "function";
    }, {
        readonly inputs: readonly [{
            readonly internalType: "address";
            readonly name: "spender";
            readonly type: "address";
        }, {
            readonly internalType: "uint256";
            readonly name: "addedValue";
            readonly type: "uint256";
        }];
        readonly name: "increaseAllowance";
        readonly outputs: readonly [{
            readonly internalType: "bool";
            readonly name: "";
            readonly type: "bool";
        }];
        readonly stateMutability: "nonpayable";
        readonly type: "function";
    }, {
        readonly inputs: readonly [];
        readonly name: "name";
        readonly outputs: readonly [{
            readonly internalType: "string";
            readonly name: "";
            readonly type: "string";
        }];
        readonly stateMutability: "view";
        readonly type: "function";
    }, {
        readonly inputs: readonly [{
            readonly internalType: "address";
            readonly name: "owner";
            readonly type: "address";
        }];
        readonly name: "nonces";
        readonly outputs: readonly [{
            readonly internalType: "uint256";
            readonly name: "";
            readonly type: "uint256";
        }];
        readonly stateMutability: "view";
        readonly type: "function";
    }, {
        readonly inputs: readonly [{
            readonly internalType: "address";
            readonly name: "owner";
            readonly type: "address";
        }, {
            readonly internalType: "address";
            readonly name: "spender";
            readonly type: "address";
        }, {
            readonly internalType: "uint256";
            readonly name: "value";
            readonly type: "uint256";
        }, {
            readonly internalType: "uint256";
            readonly name: "deadline";
            readonly type: "uint256";
        }, {
            readonly internalType: "uint8";
            readonly name: "v";
            readonly type: "uint8";
        }, {
            readonly internalType: "bytes32";
            readonly name: "r";
            readonly type: "bytes32";
        }, {
            readonly internalType: "bytes32";
            readonly name: "s";
            readonly type: "bytes32";
        }];
        readonly name: "permit";
        readonly outputs: readonly [];
        readonly stateMutability: "nonpayable";
        readonly type: "function";
    }, {
        readonly inputs: readonly [];
        readonly name: "symbol";
        readonly outputs: readonly [{
            readonly internalType: "string";
            readonly name: "";
            readonly type: "string";
        }];
        readonly stateMutability: "view";
        readonly type: "function";
    }, {
        readonly inputs: readonly [];
        readonly name: "totalSupply";
        readonly outputs: readonly [{
            readonly internalType: "uint256";
            readonly name: "";
            readonly type: "uint256";
        }];
        readonly stateMutability: "view";
        readonly type: "function";
    }, {
        readonly inputs: readonly [{
            readonly internalType: "address";
            readonly name: "to";
            readonly type: "address";
        }, {
            readonly internalType: "uint256";
            readonly name: "amount";
            readonly type: "uint256";
        }];
        readonly name: "transfer";
        readonly outputs: readonly [{
            readonly internalType: "bool";
            readonly name: "";
            readonly type: "bool";
        }];
        readonly stateMutability: "nonpayable";
        readonly type: "function";
    }, {
        readonly inputs: readonly [{
            readonly internalType: "address";
            readonly name: "from";
            readonly type: "address";
        }, {
            readonly internalType: "address";
            readonly name: "to";
            readonly type: "address";
        }, {
            readonly internalType: "uint256";
            readonly name: "amount";
            readonly type: "uint256";
        }];
        readonly name: "transferFrom";
        readonly outputs: readonly [{
            readonly internalType: "bool";
            readonly name: "";
            readonly type: "bool";
        }];
        readonly stateMutability: "nonpayable";
        readonly type: "function";
    }, {
        readonly inputs: readonly [{
            readonly internalType: "uint8";
            readonly name: "newDecimals";
            readonly type: "uint8";
        }];
        readonly name: "updateDecimals";
        readonly outputs: readonly [];
        readonly stateMutability: "nonpayable";
        readonly type: "function";
    }];
    static createInterface(): TestERC20BurnableInterface;
    static connect(address: string, signerOrProvider: Signer | Provider): TestERC20Burnable;
}
export {};
//# sourceMappingURL=TestERC20Burnable__factory.d.ts.map