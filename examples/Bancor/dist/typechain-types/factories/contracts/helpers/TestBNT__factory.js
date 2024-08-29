"use strict";
/* Autogenerated file. Do not edit manually. */
Object.defineProperty(exports, "__esModule", { value: true });
exports.TestBNT__factory = void 0;
const ethers_1 = require("ethers");
const _abi = [
    {
        inputs: [
            {
                internalType: "string",
                name: "name",
                type: "string",
            },
            {
                internalType: "string",
                name: "symbol",
                type: "string",
            },
            {
                internalType: "uint256",
                name: "totalSupply",
                type: "uint256",
            },
        ],
        stateMutability: "nonpayable",
        type: "constructor",
    },
    {
        inputs: [],
        name: "InvalidShortString",
        type: "error",
    },
    {
        inputs: [
            {
                internalType: "string",
                name: "str",
                type: "string",
            },
        ],
        name: "StringTooLong",
        type: "error",
    },
    {
        anonymous: false,
        inputs: [
            {
                indexed: true,
                internalType: "address",
                name: "owner",
                type: "address",
            },
            {
                indexed: true,
                internalType: "address",
                name: "spender",
                type: "address",
            },
            {
                indexed: false,
                internalType: "uint256",
                name: "value",
                type: "uint256",
            },
        ],
        name: "Approval",
        type: "event",
    },
    {
        anonymous: false,
        inputs: [
            {
                indexed: false,
                internalType: "uint256",
                name: "_amount",
                type: "uint256",
            },
        ],
        name: "Destruction",
        type: "event",
    },
    {
        anonymous: false,
        inputs: [],
        name: "EIP712DomainChanged",
        type: "event",
    },
    {
        anonymous: false,
        inputs: [
            {
                indexed: true,
                internalType: "address",
                name: "from",
                type: "address",
            },
            {
                indexed: true,
                internalType: "address",
                name: "to",
                type: "address",
            },
            {
                indexed: false,
                internalType: "uint256",
                name: "value",
                type: "uint256",
            },
        ],
        name: "Transfer",
        type: "event",
    },
    {
        inputs: [],
        name: "DOMAIN_SEPARATOR",
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
        inputs: [],
        name: "acceptOwnership",
        outputs: [],
        stateMutability: "nonpayable",
        type: "function",
    },
    {
        inputs: [
            {
                internalType: "address",
                name: "owner",
                type: "address",
            },
            {
                internalType: "address",
                name: "spender",
                type: "address",
            },
        ],
        name: "allowance",
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
                internalType: "address",
                name: "spender",
                type: "address",
            },
            {
                internalType: "uint256",
                name: "amount",
                type: "uint256",
            },
        ],
        name: "approve",
        outputs: [
            {
                internalType: "bool",
                name: "",
                type: "bool",
            },
        ],
        stateMutability: "nonpayable",
        type: "function",
    },
    {
        inputs: [
            {
                internalType: "address",
                name: "account",
                type: "address",
            },
        ],
        name: "balanceOf",
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
        inputs: [],
        name: "decimals",
        outputs: [
            {
                internalType: "uint8",
                name: "",
                type: "uint8",
            },
        ],
        stateMutability: "view",
        type: "function",
    },
    {
        inputs: [
            {
                internalType: "address",
                name: "spender",
                type: "address",
            },
            {
                internalType: "uint256",
                name: "subtractedValue",
                type: "uint256",
            },
        ],
        name: "decreaseAllowance",
        outputs: [
            {
                internalType: "bool",
                name: "",
                type: "bool",
            },
        ],
        stateMutability: "nonpayable",
        type: "function",
    },
    {
        inputs: [
            {
                internalType: "address",
                name: "account",
                type: "address",
            },
            {
                internalType: "uint256",
                name: "amount",
                type: "uint256",
            },
        ],
        name: "destroy",
        outputs: [],
        stateMutability: "nonpayable",
        type: "function",
    },
    {
        inputs: [],
        name: "eip712Domain",
        outputs: [
            {
                internalType: "bytes1",
                name: "fields",
                type: "bytes1",
            },
            {
                internalType: "string",
                name: "name",
                type: "string",
            },
            {
                internalType: "string",
                name: "version",
                type: "string",
            },
            {
                internalType: "uint256",
                name: "chainId",
                type: "uint256",
            },
            {
                internalType: "address",
                name: "verifyingContract",
                type: "address",
            },
            {
                internalType: "bytes32",
                name: "salt",
                type: "bytes32",
            },
            {
                internalType: "uint256[]",
                name: "extensions",
                type: "uint256[]",
            },
        ],
        stateMutability: "view",
        type: "function",
    },
    {
        inputs: [
            {
                internalType: "address",
                name: "spender",
                type: "address",
            },
            {
                internalType: "uint256",
                name: "addedValue",
                type: "uint256",
            },
        ],
        name: "increaseAllowance",
        outputs: [
            {
                internalType: "bool",
                name: "",
                type: "bool",
            },
        ],
        stateMutability: "nonpayable",
        type: "function",
    },
    {
        inputs: [
            {
                internalType: "address",
                name: "recipient",
                type: "address",
            },
            {
                internalType: "uint256",
                name: "amount",
                type: "uint256",
            },
        ],
        name: "issue",
        outputs: [],
        stateMutability: "nonpayable",
        type: "function",
    },
    {
        inputs: [],
        name: "name",
        outputs: [
            {
                internalType: "string",
                name: "",
                type: "string",
            },
        ],
        stateMutability: "view",
        type: "function",
    },
    {
        inputs: [
            {
                internalType: "address",
                name: "owner",
                type: "address",
            },
        ],
        name: "nonces",
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
        inputs: [],
        name: "owner",
        outputs: [
            {
                internalType: "address",
                name: "",
                type: "address",
            },
        ],
        stateMutability: "pure",
        type: "function",
    },
    {
        inputs: [
            {
                internalType: "address",
                name: "owner",
                type: "address",
            },
            {
                internalType: "address",
                name: "spender",
                type: "address",
            },
            {
                internalType: "uint256",
                name: "value",
                type: "uint256",
            },
            {
                internalType: "uint256",
                name: "deadline",
                type: "uint256",
            },
            {
                internalType: "uint8",
                name: "v",
                type: "uint8",
            },
            {
                internalType: "bytes32",
                name: "r",
                type: "bytes32",
            },
            {
                internalType: "bytes32",
                name: "s",
                type: "bytes32",
            },
        ],
        name: "permit",
        outputs: [],
        stateMutability: "nonpayable",
        type: "function",
    },
    {
        inputs: [],
        name: "symbol",
        outputs: [
            {
                internalType: "string",
                name: "",
                type: "string",
            },
        ],
        stateMutability: "view",
        type: "function",
    },
    {
        inputs: [],
        name: "totalSupply",
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
                internalType: "address",
                name: "_to",
                type: "address",
            },
            {
                internalType: "uint256",
                name: "_value",
                type: "uint256",
            },
        ],
        name: "transfer",
        outputs: [
            {
                internalType: "bool",
                name: "success",
                type: "bool",
            },
        ],
        stateMutability: "nonpayable",
        type: "function",
    },
    {
        inputs: [
            {
                internalType: "address",
                name: "_from",
                type: "address",
            },
            {
                internalType: "address",
                name: "_to",
                type: "address",
            },
            {
                internalType: "uint256",
                name: "_value",
                type: "uint256",
            },
        ],
        name: "transferFrom",
        outputs: [
            {
                internalType: "bool",
                name: "success",
                type: "bool",
            },
        ],
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
                internalType: "uint8",
                name: "newDecimals",
                type: "uint8",
            },
        ],
        name: "updateDecimals",
        outputs: [],
        stateMutability: "nonpayable",
        type: "function",
    },
];
const _bytecode = "0x6101606040526009805460ff191660121790553480156200001f57600080fd5b5060405162001cca38038062001cca83398101604081905262000042916200037d565b8282828280604051806040016040528060018152602001603160f81b815250858581600390816200007491906200047e565b5060046200008382826200047e565b50620000959150839050600562000168565b61012052620000a681600662000168565b61014052815160208084019190912060e052815190820120610100524660a0526200013460e05161010051604080517f8b73c3c69bb8fe3d512ecc4cf759cc79239f7b179b0ffacaa9a75d522b39400f60208201529081019290925260608201524660808201523060a082015260009060c00160405160208183030381529060405280519060200120905090565b60805250503060c052506200014a3382620001a1565b5050506200015f3382620001a160201b60201c565b505050620005c6565b60006020835110156200018857620001808362000268565b90506200019b565b816200019584826200047e565b5060ff90505b92915050565b6001600160a01b038216620001fd5760405162461bcd60e51b815260206004820152601f60248201527f45524332303a206d696e7420746f20746865207a65726f20616464726573730060448201526064015b60405180910390fd5b80600260008282546200021191906200054a565b90915550506001600160a01b038216600081815260208181526040808320805486019055518481527fddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef910160405180910390a35050565b600080829050601f8151111562000296578260405163305a27a960e01b8152600401620001f491906200056c565b8051620002a382620005a1565b179392505050565b505050565b634e487b7160e01b600052604160045260246000fd5b60005b83811015620002e3578181015183820152602001620002c9565b50506000910152565b600082601f830112620002fe57600080fd5b81516001600160401b03808211156200031b576200031b620002b0565b604051601f8301601f19908116603f01168101908282118183101715620003465762000346620002b0565b816040528381528660208588010111156200036057600080fd5b62000373846020830160208901620002c6565b9695505050505050565b6000806000606084860312156200039357600080fd5b83516001600160401b0380821115620003ab57600080fd5b620003b987838801620002ec565b94506020860151915080821115620003d057600080fd5b50620003df86828701620002ec565b925050604084015190509250925092565b600181811c908216806200040557607f821691505b6020821081036200042657634e487b7160e01b600052602260045260246000fd5b50919050565b601f821115620002ab57600081815260208120601f850160051c81016020861015620004555750805b601f850160051c820191505b81811015620004765782815560010162000461565b505050505050565b81516001600160401b038111156200049a576200049a620002b0565b620004b281620004ab8454620003f0565b846200042c565b602080601f831160018114620004ea5760008415620004d15750858301515b600019600386901b1c1916600185901b17855562000476565b600085815260208120601f198616915b828110156200051b57888601518255948401946001909101908401620004fa565b50858210156200053a5787850151600019600388901b60f8161c191681555b5050505050600190811b01905550565b808201808211156200019b57634e487b7160e01b600052601160045260246000fd5b60208152600082518060208401526200058d816040850160208701620002c6565b601f01601f19169190910160400192915050565b80516020808301519190811015620004265760001960209190910360031b1b16919050565b60805160a05160c05160e0516101005161012051610140516116a962000621600039600061052f0152600061050401526000610bfc01526000610bd401526000610b2f01526000610b5901526000610b8301526116a96000f3fe608060405234801561001057600080fd5b50600436106101775760003560e01c80637ecebe00116100d8578063a24835d11161008c578063d505accf11610066578063d505accf14610310578063dd62ed3e14610323578063f2fde38b1461035c57600080fd5b8063a24835d1146102d7578063a457c2d7146102ea578063a9059cbb146102fd57600080fd5b8063867904b4116100bd578063867904b4146102ad5780638da5cb5b146102c057806395d89b41146102cf57600080fd5b80637ecebe001461027f57806384b0196e1461029257600080fd5b8063313ce5671161012f5780633950935111610114578063395093511461024357806370a082311461025657806379ba5097146101ff57600080fd5b8063313ce567146102265780633644e5151461023b57600080fd5b80630ce83a61116101605780630ce83a61146101bd57806318160ddd1461020157806323b872dd1461021357600080fd5b806306fdde031461017c578063095ea7b31461019a575b600080fd5b61018461036d565b60405161019191906113e9565b60405180910390f35b6101ad6101a836600461141f565b6103ff565b6040519015158152602001610191565b6101ff6101cb36600461145a565b600980547fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff001660ff92909216919091179055565b005b6002545b604051908152602001610191565b6101ad610221366004611475565b610419565b60095460405160ff9091168152602001610191565b61020561048a565b6101ad61025136600461141f565b610499565b6102056102643660046114b1565b6001600160a01b031660009081526020819052604090205490565b61020561028d3660046114b1565b6104d8565b61029a6104f6565b60405161019197969594939291906114cc565b6101ff6102bb36600461141f565b61059b565b60405160008152602001610191565b6101846105a9565b6101ff6102e536600461141f565b6105b8565b6101ad6102f836600461141f565b6105c2565b6101ad61030b36600461141f565b61067c565b6101ff61031e36600461157e565b6106eb565b6102056103313660046115e8565b6001600160a01b03918216600090815260016020908152604080832093909416825291909152205490565b6101ff61036a3660046114b1565b50565b60606003805461037c9061161b565b80601f01602080910402602001604051908101604052809291908181526020018280546103a89061161b565b80156103f55780601f106103ca576101008083540402835291602001916103f5565b820191906000526020600020905b8154815290600101906020018083116103d857829003601f168201915b5050505050905090565b60003361040d81858561084f565b60019150505b92915050565b60006104268484846109a8565b6104325761043261164f565b306001600160a01b038416036104805761044c30836109c1565b6040518281527f9a1b418bc061a5d80270261562e6986a35d995f8051145f277be16103abd34539060200160405180910390a15b5060019392505050565b6000610494610b22565b905090565b3360008181526001602090815260408083206001600160a01b038716845290915281205490919061040d90829086906104d3908790611665565b61084f565b6001600160a01b038116600090815260076020526040812054610413565b60006060808280808361052a7f00000000000000000000000000000000000000000000000000000000000000006005610c4d565b6105557f00000000000000000000000000000000000000000000000000000000000000006006610c4d565b604080516000808252602082019092527f0f000000000000000000000000000000000000000000000000000000000000009b939a50919850469750309650945092509050565b6105a58282610cf8565b5050565b60606004805461037c9061161b565b6105a582826109c1565b3360008181526001602090815260408083206001600160a01b0387168452909152812054909190838110156106645760405162461bcd60e51b815260206004820152602560248201527f45524332303a2064656372656173656420616c6c6f77616e63652062656c6f7760448201527f207a65726f00000000000000000000000000000000000000000000000000000060648201526084015b60405180910390fd5b610671828686840361084f565b506001949350505050565b60006106888383610db7565b6106945761069461164f565b306001600160a01b038416036106e2576106ae30836109c1565b6040518281527f9a1b418bc061a5d80270261562e6986a35d995f8051145f277be16103abd34539060200160405180910390a15b50600192915050565b8342111561073b5760405162461bcd60e51b815260206004820152601d60248201527f45524332305065726d69743a206578706972656420646561646c696e65000000604482015260640161065b565b60007f6e71edae12b1b97f4d1f60370fef10105fa2faae0126114a169c64845d6126c988888861076a8c610dc5565b6040805160208101969096526001600160a01b0394851690860152929091166060840152608083015260a082015260c0810186905260e00160405160208183030381529060405280519060200120905060006107c582610ded565b905060006107d582878787610e35565b9050896001600160a01b0316816001600160a01b0316146108385760405162461bcd60e51b815260206004820152601e60248201527f45524332305065726d69743a20696e76616c6964207369676e61747572650000604482015260640161065b565b6108438a8a8a61084f565b50505050505050505050565b6001600160a01b0383166108ca5760405162461bcd60e51b8152602060048201526024808201527f45524332303a20617070726f76652066726f6d20746865207a65726f2061646460448201527f7265737300000000000000000000000000000000000000000000000000000000606482015260840161065b565b6001600160a01b0382166109465760405162461bcd60e51b815260206004820152602260248201527f45524332303a20617070726f766520746f20746865207a65726f20616464726560448201527f7373000000000000000000000000000000000000000000000000000000000000606482015260840161065b565b6001600160a01b0383811660008181526001602090815260408083209487168084529482529182902085905590518481527f8c5be1e5ebec7d5bd14f71427d1e84f3dd0314c0f7b2291e5b200ac8c7c3b92591015b60405180910390a3505050565b6000336109b6858285610e5d565b610671858585610f0d565b6001600160a01b038216610a3d5760405162461bcd60e51b815260206004820152602160248201527f45524332303a206275726e2066726f6d20746865207a65726f2061646472657360448201527f7300000000000000000000000000000000000000000000000000000000000000606482015260840161065b565b6001600160a01b03821660009081526020819052604090205481811015610acc5760405162461bcd60e51b815260206004820152602260248201527f45524332303a206275726e20616d6f756e7420657863656564732062616c616e60448201527f6365000000000000000000000000000000000000000000000000000000000000606482015260840161065b565b6001600160a01b0383166000818152602081815260408083208686039055600280548790039055518581529192917fddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef910161099b565b6000306001600160a01b037f000000000000000000000000000000000000000000000000000000000000000016148015610b7b57507f000000000000000000000000000000000000000000000000000000000000000046145b15610ba557507f000000000000000000000000000000000000000000000000000000000000000090565b610494604080517f8b73c3c69bb8fe3d512ecc4cf759cc79239f7b179b0ffacaa9a75d522b39400f60208201527f0000000000000000000000000000000000000000000000000000000000000000918101919091527f000000000000000000000000000000000000000000000000000000000000000060608201524660808201523060a082015260009060c00160405160208183030381529060405280519060200120905090565b606060ff8314610c6757610c60836110fa565b9050610413565b818054610c739061161b565b80601f0160208091040260200160405190810160405280929190818152602001828054610c9f9061161b565b8015610cec5780601f10610cc157610100808354040283529160200191610cec565b820191906000526020600020905b815481529060010190602001808311610ccf57829003601f168201915b50505050509050610413565b6001600160a01b038216610d4e5760405162461bcd60e51b815260206004820152601f60248201527f45524332303a206d696e7420746f20746865207a65726f206164647265737300604482015260640161065b565b8060026000828254610d609190611665565b90915550506001600160a01b038216600081815260208181526040808320805486019055518481527fddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef910160405180910390a35050565b60003361040d818585610f0d565b6001600160a01b03811660009081526007602052604090208054600181018255905b50919050565b6000610413610dfa610b22565b836040517f19010000000000000000000000000000000000000000000000000000000000008152600281019290925260228201526042902090565b6000806000610e4687878787611139565b91509150610e53816111fd565b5095945050505050565b6001600160a01b038381166000908152600160209081526040808320938616835292905220547fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff8114610f075781811015610efa5760405162461bcd60e51b815260206004820152601d60248201527f45524332303a20696e73756666696369656e7420616c6c6f77616e6365000000604482015260640161065b565b610f07848484840361084f565b50505050565b6001600160a01b038316610f895760405162461bcd60e51b815260206004820152602560248201527f45524332303a207472616e736665722066726f6d20746865207a65726f20616460448201527f6472657373000000000000000000000000000000000000000000000000000000606482015260840161065b565b6001600160a01b0382166110055760405162461bcd60e51b815260206004820152602360248201527f45524332303a207472616e7366657220746f20746865207a65726f206164647260448201527f6573730000000000000000000000000000000000000000000000000000000000606482015260840161065b565b6001600160a01b038316600090815260208190526040902054818110156110945760405162461bcd60e51b815260206004820152602660248201527f45524332303a207472616e7366657220616d6f756e742065786365656473206260448201527f616c616e63650000000000000000000000000000000000000000000000000000606482015260840161065b565b6001600160a01b03848116600081815260208181526040808320878703905593871680835291849020805487019055925185815290927fddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef910160405180910390a3610f07565b6060600061110783611362565b604080516020808252818301909252919250600091906020820181803683375050509182525060208101929092525090565b6000807f7fffffffffffffffffffffffffffffff5d576e7357a4501ddfe92f46681b20a083111561117057506000905060036111f4565b6040805160008082526020820180845289905260ff881692820192909252606081018690526080810185905260019060a0016020604051602081039080840390855afa1580156111c4573d6000803e3d6000fd5b5050604051601f1901519150506001600160a01b0381166111ed576000600192509250506111f4565b9150600090505b94509492505050565b600081600481111561121157611211611686565b036112195750565b600181600481111561122d5761122d611686565b0361127a5760405162461bcd60e51b815260206004820152601860248201527f45434453413a20696e76616c6964207369676e61747572650000000000000000604482015260640161065b565b600281600481111561128e5761128e611686565b036112db5760405162461bcd60e51b815260206004820152601f60248201527f45434453413a20696e76616c6964207369676e6174757265206c656e67746800604482015260640161065b565b60038160048111156112ef576112ef611686565b0361036a5760405162461bcd60e51b815260206004820152602260248201527f45434453413a20696e76616c6964207369676e6174757265202773272076616c60448201527f7565000000000000000000000000000000000000000000000000000000000000606482015260840161065b565b600060ff8216601f811115610413576040517fb3512b0c00000000000000000000000000000000000000000000000000000000815260040160405180910390fd5b6000815180845260005b818110156113c9576020818501810151868301820152016113ad565b506000602082860101526020601f19601f83011685010191505092915050565b6020815260006113fc60208301846113a3565b9392505050565b80356001600160a01b038116811461141a57600080fd5b919050565b6000806040838503121561143257600080fd5b61143b83611403565b946020939093013593505050565b803560ff8116811461141a57600080fd5b60006020828403121561146c57600080fd5b6113fc82611449565b60008060006060848603121561148a57600080fd5b61149384611403565b92506114a160208501611403565b9150604084013590509250925092565b6000602082840312156114c357600080fd5b6113fc82611403565b7fff00000000000000000000000000000000000000000000000000000000000000881681526000602060e08184015261150860e084018a6113a3565b838103604085015261151a818a6113a3565b606085018990526001600160a01b038816608086015260a0850187905284810360c0860152855180825283870192509083019060005b8181101561156c57835183529284019291840191600101611550565b50909c9b505050505050505050505050565b600080600080600080600060e0888a03121561159957600080fd5b6115a288611403565b96506115b060208901611403565b955060408801359450606088013593506115cc60808901611449565b925060a0880135915060c0880135905092959891949750929550565b600080604083850312156115fb57600080fd5b61160483611403565b915061161260208401611403565b90509250929050565b600181811c9082168061162f57607f821691505b602082108103610de757634e487b7160e01b600052602260045260246000fd5b634e487b7160e01b600052600160045260246000fd5b8082018082111561041357634e487b7160e01b600052601160045260246000fd5b634e487b7160e01b600052602160045260246000fdfea164736f6c6343000813000a";
const isSuperArgs = (xs) => xs.length > 1;
class TestBNT__factory extends ethers_1.ContractFactory {
    constructor(...args) {
        if (isSuperArgs(args)) {
            super(...args);
        }
        else {
            super(_abi, _bytecode, args[0]);
        }
    }
    deploy(name, symbol, totalSupply, overrides) {
        return super.deploy(name, symbol, totalSupply, overrides || {});
    }
    getDeployTransaction(name, symbol, totalSupply, overrides) {
        return super.getDeployTransaction(name, symbol, totalSupply, overrides || {});
    }
    attach(address) {
        return super.attach(address);
    }
    connect(signer) {
        return super.connect(signer);
    }
    static bytecode = _bytecode;
    static abi = _abi;
    static createInterface() {
        return new ethers_1.utils.Interface(_abi);
    }
    static connect(address, signerOrProvider) {
        return new ethers_1.Contract(address, _abi, signerOrProvider);
    }
}
exports.TestBNT__factory = TestBNT__factory;
//# sourceMappingURL=TestBNT__factory.js.map