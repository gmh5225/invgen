import type { TestReenterCarbonVortex, TestReenterCarbonVortexInterface } from "../../../contracts/helpers/TestReenterCarbonVortex";
import type { Provider, TransactionRequest } from "@ethersproject/providers";
import { Signer, ContractFactory, Overrides } from "ethers";
type TestReenterCarbonVortexConstructorParams = [signer?: Signer] | ConstructorParameters<typeof ContractFactory>;
export declare class TestReenterCarbonVortex__factory extends ContractFactory {
    constructor(...args: TestReenterCarbonVortexConstructorParams);
    deploy(carbonVortexInit: string, overrides?: Overrides & {
        from?: string;
    }): Promise<TestReenterCarbonVortex>;
    getDeployTransaction(carbonVortexInit: string, overrides?: Overrides & {
        from?: string;
    }): TransactionRequest;
    attach(address: string): TestReenterCarbonVortex;
    connect(signer: Signer): TestReenterCarbonVortex__factory;
    static readonly bytecode = "0x60a060405234801561001057600080fd5b506040516104c23803806104c283398101604081905261002f91610040565b6001600160a01b0316608052610070565b60006020828403121561005257600080fd5b81516001600160a01b038116811461006957600080fd5b9392505050565b60805161042a610098600039600081816068015281816101740152610213015261042a6000f3fe60806040526004361061002d5760003560e01c80631b401b2c146100e45780631ca3aeb4146100f757600080fd5b366100df57604080516000815260208101918290527f4c0a0dfa000000000000000000000000000000000000000000000000000000009091527f000000000000000000000000000000000000000000000000000000000000000073ffffffffffffffffffffffffffffffffffffffff16634c0a0dfa6100af8360248101610280565b600060405180830381600087803b1580156100c957600080fd5b505af11580156100dd573d6000803e3d6000fd5b005b600080fd5b6100dd6100f2366004610303565b610117565b34801561010357600080fd5b506100dd61011236600461034f565b6101d6565b6040517f4747919d00000000000000000000000000000000000000000000000000000000815273ffffffffffffffffffffffffffffffffffffffff83811660048301526fffffffffffffffffffffffffffffffff831660248301527f00000000000000000000000000000000000000000000000000000000000000001690634747919d9034906044016000604051808303818588803b1580156101b957600080fd5b505af11580156101cd573d6000803e3d6000fd5b50505050505050565b6040517f4c0a0dfa00000000000000000000000000000000000000000000000000000000815273ffffffffffffffffffffffffffffffffffffffff7f00000000000000000000000000000000000000000000000000000000000000001690634c0a0dfa9061024a90859085906004016103c4565b600060405180830381600087803b15801561026457600080fd5b505af1158015610278573d6000803e3d6000fd5b505050505050565b6020808252825182820181905260009190848201906040850190845b818110156102ce57835173ffffffffffffffffffffffffffffffffffffffff168352928401929184019160010161029c565b50909695505050505050565b803573ffffffffffffffffffffffffffffffffffffffff811681146102fe57600080fd5b919050565b6000806040838503121561031657600080fd5b61031f836102da565b915060208301356fffffffffffffffffffffffffffffffff8116811461034457600080fd5b809150509250929050565b6000806020838503121561036257600080fd5b823567ffffffffffffffff8082111561037a57600080fd5b818501915085601f83011261038e57600080fd5b81358181111561039d57600080fd5b8660208260051b85010111156103b257600080fd5b60209290920196919550909350505050565b60208082528181018390526000908460408401835b868110156104125773ffffffffffffffffffffffffffffffffffffffff6103ff846102da565b16825291830191908301906001016103d9565b50969550505050505056fea164736f6c6343000813000a";
    static readonly abi: readonly [{
        readonly inputs: readonly [{
            readonly internalType: "contract ICarbonVortex";
            readonly name: "carbonVortexInit";
            readonly type: "address";
        }];
        readonly stateMutability: "nonpayable";
        readonly type: "constructor";
    }, {
        readonly inputs: readonly [{
            readonly internalType: "Token[]";
            readonly name: "tokens";
            readonly type: "address[]";
        }];
        readonly name: "tryReenterCarbonVortexExecute";
        readonly outputs: readonly [];
        readonly stateMutability: "nonpayable";
        readonly type: "function";
    }, {
        readonly inputs: readonly [{
            readonly internalType: "Token";
            readonly name: "token";
            readonly type: "address";
        }, {
            readonly internalType: "uint128";
            readonly name: "targetAmount";
            readonly type: "uint128";
        }];
        readonly name: "tryReenterCarbonVortexTrade";
        readonly outputs: readonly [];
        readonly stateMutability: "payable";
        readonly type: "function";
    }, {
        readonly stateMutability: "payable";
        readonly type: "receive";
    }];
    static createInterface(): TestReenterCarbonVortexInterface;
    static connect(address: string, signerOrProvider: Signer | Provider): TestReenterCarbonVortex;
}
export {};
//# sourceMappingURL=TestReenterCarbonVortex__factory.d.ts.map