import type { TypedEventFilter, TypedEvent, TypedListener, OnEvent } from "../../common";
import type { FunctionFragment, Result, EventFragment } from "@ethersproject/abi";
import type { Listener, Provider } from "@ethersproject/providers";
import type { BaseContract, BigNumber, BigNumberish, BytesLike, CallOverrides, ContractTransaction, Overrides, PayableOverrides, PopulatedTransaction, Signer, utils } from "ethers";
export declare namespace ICarbonPOL {
    type PriceStruct = {
        sourceAmount: BigNumberish;
        targetAmount: BigNumberish;
    };
    type PriceStructOutput = [BigNumber, BigNumber] & {
        sourceAmount: BigNumber;
        targetAmount: BigNumber;
    };
    type EthSaleAmountStruct = {
        initial: BigNumberish;
        current: BigNumberish;
    };
    type EthSaleAmountStructOutput = [BigNumber, BigNumber] & {
        initial: BigNumber;
        current: BigNumber;
    };
}
export interface CarbonPOLInterface extends utils.Interface {
    functions: {
        "DEFAULT_ADMIN_ROLE()": FunctionFragment;
        "amountAvailableForTrading(address)": FunctionFragment;
        "enableTrading(address,(uint128,uint128))": FunctionFragment;
        "enableTradingETH((uint128,uint128))": FunctionFragment;
        "ethSaleAmount()": FunctionFragment;
        "expectedTradeInput(address,uint128)": FunctionFragment;
        "expectedTradeReturn(address,uint128)": FunctionFragment;
        "getRoleAdmin(bytes32)": FunctionFragment;
        "getRoleMember(bytes32,uint256)": FunctionFragment;
        "getRoleMemberCount(bytes32)": FunctionFragment;
        "grantRole(bytes32,address)": FunctionFragment;
        "hasRole(bytes32,address)": FunctionFragment;
        "initialize()": FunctionFragment;
        "marketPriceMultiply()": FunctionFragment;
        "minEthSaleAmount()": FunctionFragment;
        "postUpgrade(bytes)": FunctionFragment;
        "priceDecayHalfLife()": FunctionFragment;
        "renounceRole(bytes32,address)": FunctionFragment;
        "revokeRole(bytes32,address)": FunctionFragment;
        "roleAdmin()": FunctionFragment;
        "setEthSaleAmount(uint128)": FunctionFragment;
        "setMarketPriceMultiply(uint32)": FunctionFragment;
        "setMinEthSaleAmount(uint128)": FunctionFragment;
        "setPriceDecayHalfLife(uint32)": FunctionFragment;
        "supportsInterface(bytes4)": FunctionFragment;
        "tokenPrice(address)": FunctionFragment;
        "trade(address,uint128)": FunctionFragment;
        "tradingEnabled(address)": FunctionFragment;
        "version()": FunctionFragment;
    };
    getFunction(nameOrSignatureOrTopic: "DEFAULT_ADMIN_ROLE" | "amountAvailableForTrading" | "enableTrading" | "enableTradingETH" | "ethSaleAmount" | "expectedTradeInput" | "expectedTradeReturn" | "getRoleAdmin" | "getRoleMember" | "getRoleMemberCount" | "grantRole" | "hasRole" | "initialize" | "marketPriceMultiply" | "minEthSaleAmount" | "postUpgrade" | "priceDecayHalfLife" | "renounceRole" | "revokeRole" | "roleAdmin" | "setEthSaleAmount" | "setMarketPriceMultiply" | "setMinEthSaleAmount" | "setPriceDecayHalfLife" | "supportsInterface" | "tokenPrice" | "trade" | "tradingEnabled" | "version"): FunctionFragment;
    encodeFunctionData(functionFragment: "DEFAULT_ADMIN_ROLE", values?: undefined): string;
    encodeFunctionData(functionFragment: "amountAvailableForTrading", values: [string]): string;
    encodeFunctionData(functionFragment: "enableTrading", values: [string, ICarbonPOL.PriceStruct]): string;
    encodeFunctionData(functionFragment: "enableTradingETH", values: [ICarbonPOL.PriceStruct]): string;
    encodeFunctionData(functionFragment: "ethSaleAmount", values?: undefined): string;
    encodeFunctionData(functionFragment: "expectedTradeInput", values: [string, BigNumberish]): string;
    encodeFunctionData(functionFragment: "expectedTradeReturn", values: [string, BigNumberish]): string;
    encodeFunctionData(functionFragment: "getRoleAdmin", values: [BytesLike]): string;
    encodeFunctionData(functionFragment: "getRoleMember", values: [BytesLike, BigNumberish]): string;
    encodeFunctionData(functionFragment: "getRoleMemberCount", values: [BytesLike]): string;
    encodeFunctionData(functionFragment: "grantRole", values: [BytesLike, string]): string;
    encodeFunctionData(functionFragment: "hasRole", values: [BytesLike, string]): string;
    encodeFunctionData(functionFragment: "initialize", values?: undefined): string;
    encodeFunctionData(functionFragment: "marketPriceMultiply", values?: undefined): string;
    encodeFunctionData(functionFragment: "minEthSaleAmount", values?: undefined): string;
    encodeFunctionData(functionFragment: "postUpgrade", values: [BytesLike]): string;
    encodeFunctionData(functionFragment: "priceDecayHalfLife", values?: undefined): string;
    encodeFunctionData(functionFragment: "renounceRole", values: [BytesLike, string]): string;
    encodeFunctionData(functionFragment: "revokeRole", values: [BytesLike, string]): string;
    encodeFunctionData(functionFragment: "roleAdmin", values?: undefined): string;
    encodeFunctionData(functionFragment: "setEthSaleAmount", values: [BigNumberish]): string;
    encodeFunctionData(functionFragment: "setMarketPriceMultiply", values: [BigNumberish]): string;
    encodeFunctionData(functionFragment: "setMinEthSaleAmount", values: [BigNumberish]): string;
    encodeFunctionData(functionFragment: "setPriceDecayHalfLife", values: [BigNumberish]): string;
    encodeFunctionData(functionFragment: "supportsInterface", values: [BytesLike]): string;
    encodeFunctionData(functionFragment: "tokenPrice", values: [string]): string;
    encodeFunctionData(functionFragment: "trade", values: [string, BigNumberish]): string;
    encodeFunctionData(functionFragment: "tradingEnabled", values: [string]): string;
    encodeFunctionData(functionFragment: "version", values?: undefined): string;
    decodeFunctionResult(functionFragment: "DEFAULT_ADMIN_ROLE", data: BytesLike): Result;
    decodeFunctionResult(functionFragment: "amountAvailableForTrading", data: BytesLike): Result;
    decodeFunctionResult(functionFragment: "enableTrading", data: BytesLike): Result;
    decodeFunctionResult(functionFragment: "enableTradingETH", data: BytesLike): Result;
    decodeFunctionResult(functionFragment: "ethSaleAmount", data: BytesLike): Result;
    decodeFunctionResult(functionFragment: "expectedTradeInput", data: BytesLike): Result;
    decodeFunctionResult(functionFragment: "expectedTradeReturn", data: BytesLike): Result;
    decodeFunctionResult(functionFragment: "getRoleAdmin", data: BytesLike): Result;
    decodeFunctionResult(functionFragment: "getRoleMember", data: BytesLike): Result;
    decodeFunctionResult(functionFragment: "getRoleMemberCount", data: BytesLike): Result;
    decodeFunctionResult(functionFragment: "grantRole", data: BytesLike): Result;
    decodeFunctionResult(functionFragment: "hasRole", data: BytesLike): Result;
    decodeFunctionResult(functionFragment: "initialize", data: BytesLike): Result;
    decodeFunctionResult(functionFragment: "marketPriceMultiply", data: BytesLike): Result;
    decodeFunctionResult(functionFragment: "minEthSaleAmount", data: BytesLike): Result;
    decodeFunctionResult(functionFragment: "postUpgrade", data: BytesLike): Result;
    decodeFunctionResult(functionFragment: "priceDecayHalfLife", data: BytesLike): Result;
    decodeFunctionResult(functionFragment: "renounceRole", data: BytesLike): Result;
    decodeFunctionResult(functionFragment: "revokeRole", data: BytesLike): Result;
    decodeFunctionResult(functionFragment: "roleAdmin", data: BytesLike): Result;
    decodeFunctionResult(functionFragment: "setEthSaleAmount", data: BytesLike): Result;
    decodeFunctionResult(functionFragment: "setMarketPriceMultiply", data: BytesLike): Result;
    decodeFunctionResult(functionFragment: "setMinEthSaleAmount", data: BytesLike): Result;
    decodeFunctionResult(functionFragment: "setPriceDecayHalfLife", data: BytesLike): Result;
    decodeFunctionResult(functionFragment: "supportsInterface", data: BytesLike): Result;
    decodeFunctionResult(functionFragment: "tokenPrice", data: BytesLike): Result;
    decodeFunctionResult(functionFragment: "trade", data: BytesLike): Result;
    decodeFunctionResult(functionFragment: "tradingEnabled", data: BytesLike): Result;
    decodeFunctionResult(functionFragment: "version", data: BytesLike): Result;
    events: {
        "EthSaleAmountUpdated(uint128,uint128)": EventFragment;
        "Initialized(uint8)": EventFragment;
        "MarketPriceMultiplyUpdated(uint32,uint32)": EventFragment;
        "MinEthSaleAmountUpdated(uint128,uint128)": EventFragment;
        "PriceDecayHalfLifeUpdated(uint32,uint32)": EventFragment;
        "PriceUpdated(address,(uint128,uint128))": EventFragment;
        "RoleAdminChanged(bytes32,bytes32,bytes32)": EventFragment;
        "RoleGranted(bytes32,address,address)": EventFragment;
        "RoleRevoked(bytes32,address,address)": EventFragment;
        "TokenTraded(address,address,uint128,uint128)": EventFragment;
        "TradingEnabled(address,(uint128,uint128))": EventFragment;
    };
    getEvent(nameOrSignatureOrTopic: "EthSaleAmountUpdated"): EventFragment;
    getEvent(nameOrSignatureOrTopic: "Initialized"): EventFragment;
    getEvent(nameOrSignatureOrTopic: "MarketPriceMultiplyUpdated"): EventFragment;
    getEvent(nameOrSignatureOrTopic: "MinEthSaleAmountUpdated"): EventFragment;
    getEvent(nameOrSignatureOrTopic: "PriceDecayHalfLifeUpdated"): EventFragment;
    getEvent(nameOrSignatureOrTopic: "PriceUpdated"): EventFragment;
    getEvent(nameOrSignatureOrTopic: "RoleAdminChanged"): EventFragment;
    getEvent(nameOrSignatureOrTopic: "RoleGranted"): EventFragment;
    getEvent(nameOrSignatureOrTopic: "RoleRevoked"): EventFragment;
    getEvent(nameOrSignatureOrTopic: "TokenTraded"): EventFragment;
    getEvent(nameOrSignatureOrTopic: "TradingEnabled"): EventFragment;
}
export interface EthSaleAmountUpdatedEventObject {
    prevEthSaleAmount: BigNumber;
    newEthSaleAmount: BigNumber;
}
export type EthSaleAmountUpdatedEvent = TypedEvent<[
    BigNumber,
    BigNumber
], EthSaleAmountUpdatedEventObject>;
export type EthSaleAmountUpdatedEventFilter = TypedEventFilter<EthSaleAmountUpdatedEvent>;
export interface InitializedEventObject {
    version: number;
}
export type InitializedEvent = TypedEvent<[number], InitializedEventObject>;
export type InitializedEventFilter = TypedEventFilter<InitializedEvent>;
export interface MarketPriceMultiplyUpdatedEventObject {
    prevMarketPriceMultiply: number;
    newMarketPriceMultiply: number;
}
export type MarketPriceMultiplyUpdatedEvent = TypedEvent<[
    number,
    number
], MarketPriceMultiplyUpdatedEventObject>;
export type MarketPriceMultiplyUpdatedEventFilter = TypedEventFilter<MarketPriceMultiplyUpdatedEvent>;
export interface MinEthSaleAmountUpdatedEventObject {
    prevMinEthSaleAmount: BigNumber;
    newMinEthSaleAmount: BigNumber;
}
export type MinEthSaleAmountUpdatedEvent = TypedEvent<[
    BigNumber,
    BigNumber
], MinEthSaleAmountUpdatedEventObject>;
export type MinEthSaleAmountUpdatedEventFilter = TypedEventFilter<MinEthSaleAmountUpdatedEvent>;
export interface PriceDecayHalfLifeUpdatedEventObject {
    prevPriceDecayHalfLife: number;
    newPriceDecayHalfLife: number;
}
export type PriceDecayHalfLifeUpdatedEvent = TypedEvent<[
    number,
    number
], PriceDecayHalfLifeUpdatedEventObject>;
export type PriceDecayHalfLifeUpdatedEventFilter = TypedEventFilter<PriceDecayHalfLifeUpdatedEvent>;
export interface PriceUpdatedEventObject {
    token: string;
    price: ICarbonPOL.PriceStructOutput;
}
export type PriceUpdatedEvent = TypedEvent<[
    string,
    ICarbonPOL.PriceStructOutput
], PriceUpdatedEventObject>;
export type PriceUpdatedEventFilter = TypedEventFilter<PriceUpdatedEvent>;
export interface RoleAdminChangedEventObject {
    role: string;
    previousAdminRole: string;
    newAdminRole: string;
}
export type RoleAdminChangedEvent = TypedEvent<[
    string,
    string,
    string
], RoleAdminChangedEventObject>;
export type RoleAdminChangedEventFilter = TypedEventFilter<RoleAdminChangedEvent>;
export interface RoleGrantedEventObject {
    role: string;
    account: string;
    sender: string;
}
export type RoleGrantedEvent = TypedEvent<[
    string,
    string,
    string
], RoleGrantedEventObject>;
export type RoleGrantedEventFilter = TypedEventFilter<RoleGrantedEvent>;
export interface RoleRevokedEventObject {
    role: string;
    account: string;
    sender: string;
}
export type RoleRevokedEvent = TypedEvent<[
    string,
    string,
    string
], RoleRevokedEventObject>;
export type RoleRevokedEventFilter = TypedEventFilter<RoleRevokedEvent>;
export interface TokenTradedEventObject {
    caller: string;
    token: string;
    sourceAmount: BigNumber;
    targetAmount: BigNumber;
}
export type TokenTradedEvent = TypedEvent<[
    string,
    string,
    BigNumber,
    BigNumber
], TokenTradedEventObject>;
export type TokenTradedEventFilter = TypedEventFilter<TokenTradedEvent>;
export interface TradingEnabledEventObject {
    token: string;
    price: ICarbonPOL.PriceStructOutput;
}
export type TradingEnabledEvent = TypedEvent<[
    string,
    ICarbonPOL.PriceStructOutput
], TradingEnabledEventObject>;
export type TradingEnabledEventFilter = TypedEventFilter<TradingEnabledEvent>;
export interface CarbonPOL extends BaseContract {
    connect(signerOrProvider: Signer | Provider | string): this;
    attach(addressOrName: string): this;
    deployed(): Promise<this>;
    interface: CarbonPOLInterface;
    queryFilter<TEvent extends TypedEvent>(event: TypedEventFilter<TEvent>, fromBlockOrBlockhash?: string | number | undefined, toBlock?: string | number | undefined): Promise<Array<TEvent>>;
    listeners<TEvent extends TypedEvent>(eventFilter?: TypedEventFilter<TEvent>): Array<TypedListener<TEvent>>;
    listeners(eventName?: string): Array<Listener>;
    removeAllListeners<TEvent extends TypedEvent>(eventFilter: TypedEventFilter<TEvent>): this;
    removeAllListeners(eventName?: string): this;
    off: OnEvent<this>;
    on: OnEvent<this>;
    once: OnEvent<this>;
    removeListener: OnEvent<this>;
    functions: {
        DEFAULT_ADMIN_ROLE(overrides?: CallOverrides): Promise<[string]>;
        amountAvailableForTrading(token: string, overrides?: CallOverrides): Promise<[BigNumber]>;
        enableTrading(token: string, price: ICarbonPOL.PriceStruct, overrides?: Overrides & {
            from?: string;
        }): Promise<ContractTransaction>;
        enableTradingETH(price: ICarbonPOL.PriceStruct, overrides?: Overrides & {
            from?: string;
        }): Promise<ContractTransaction>;
        ethSaleAmount(overrides?: CallOverrides): Promise<[ICarbonPOL.EthSaleAmountStructOutput]>;
        expectedTradeInput(token: string, targetAmount: BigNumberish, overrides?: CallOverrides): Promise<[BigNumber]>;
        expectedTradeReturn(token: string, sourceAmount: BigNumberish, overrides?: CallOverrides): Promise<[BigNumber]>;
        getRoleAdmin(role: BytesLike, overrides?: CallOverrides): Promise<[string]>;
        getRoleMember(role: BytesLike, index: BigNumberish, overrides?: CallOverrides): Promise<[string]>;
        getRoleMemberCount(role: BytesLike, overrides?: CallOverrides): Promise<[BigNumber]>;
        grantRole(role: BytesLike, account: string, overrides?: Overrides & {
            from?: string;
        }): Promise<ContractTransaction>;
        hasRole(role: BytesLike, account: string, overrides?: CallOverrides): Promise<[boolean]>;
        initialize(overrides?: Overrides & {
            from?: string;
        }): Promise<ContractTransaction>;
        marketPriceMultiply(overrides?: CallOverrides): Promise<[number]>;
        minEthSaleAmount(overrides?: CallOverrides): Promise<[BigNumber]>;
        postUpgrade(data: BytesLike, overrides?: Overrides & {
            from?: string;
        }): Promise<ContractTransaction>;
        priceDecayHalfLife(overrides?: CallOverrides): Promise<[number]>;
        renounceRole(role: BytesLike, account: string, overrides?: Overrides & {
            from?: string;
        }): Promise<ContractTransaction>;
        revokeRole(role: BytesLike, account: string, overrides?: Overrides & {
            from?: string;
        }): Promise<ContractTransaction>;
        roleAdmin(overrides?: CallOverrides): Promise<[string]>;
        setEthSaleAmount(newEthSaleAmount: BigNumberish, overrides?: Overrides & {
            from?: string;
        }): Promise<ContractTransaction>;
        setMarketPriceMultiply(newMarketPriceMultiply: BigNumberish, overrides?: Overrides & {
            from?: string;
        }): Promise<ContractTransaction>;
        setMinEthSaleAmount(newMinEthSaleAmount: BigNumberish, overrides?: Overrides & {
            from?: string;
        }): Promise<ContractTransaction>;
        setPriceDecayHalfLife(newPriceDecayHalfLife: BigNumberish, overrides?: Overrides & {
            from?: string;
        }): Promise<ContractTransaction>;
        supportsInterface(interfaceId: BytesLike, overrides?: CallOverrides): Promise<[boolean]>;
        tokenPrice(token: string, overrides?: CallOverrides): Promise<[ICarbonPOL.PriceStructOutput]>;
        trade(token: string, targetAmount: BigNumberish, overrides?: PayableOverrides & {
            from?: string;
        }): Promise<ContractTransaction>;
        tradingEnabled(token: string, overrides?: CallOverrides): Promise<[boolean]>;
        version(overrides?: CallOverrides): Promise<[number]>;
    };
    DEFAULT_ADMIN_ROLE(overrides?: CallOverrides): Promise<string>;
    amountAvailableForTrading(token: string, overrides?: CallOverrides): Promise<BigNumber>;
    enableTrading(token: string, price: ICarbonPOL.PriceStruct, overrides?: Overrides & {
        from?: string;
    }): Promise<ContractTransaction>;
    enableTradingETH(price: ICarbonPOL.PriceStruct, overrides?: Overrides & {
        from?: string;
    }): Promise<ContractTransaction>;
    ethSaleAmount(overrides?: CallOverrides): Promise<ICarbonPOL.EthSaleAmountStructOutput>;
    expectedTradeInput(token: string, targetAmount: BigNumberish, overrides?: CallOverrides): Promise<BigNumber>;
    expectedTradeReturn(token: string, sourceAmount: BigNumberish, overrides?: CallOverrides): Promise<BigNumber>;
    getRoleAdmin(role: BytesLike, overrides?: CallOverrides): Promise<string>;
    getRoleMember(role: BytesLike, index: BigNumberish, overrides?: CallOverrides): Promise<string>;
    getRoleMemberCount(role: BytesLike, overrides?: CallOverrides): Promise<BigNumber>;
    grantRole(role: BytesLike, account: string, overrides?: Overrides & {
        from?: string;
    }): Promise<ContractTransaction>;
    hasRole(role: BytesLike, account: string, overrides?: CallOverrides): Promise<boolean>;
    initialize(overrides?: Overrides & {
        from?: string;
    }): Promise<ContractTransaction>;
    marketPriceMultiply(overrides?: CallOverrides): Promise<number>;
    minEthSaleAmount(overrides?: CallOverrides): Promise<BigNumber>;
    postUpgrade(data: BytesLike, overrides?: Overrides & {
        from?: string;
    }): Promise<ContractTransaction>;
    priceDecayHalfLife(overrides?: CallOverrides): Promise<number>;
    renounceRole(role: BytesLike, account: string, overrides?: Overrides & {
        from?: string;
    }): Promise<ContractTransaction>;
    revokeRole(role: BytesLike, account: string, overrides?: Overrides & {
        from?: string;
    }): Promise<ContractTransaction>;
    roleAdmin(overrides?: CallOverrides): Promise<string>;
    setEthSaleAmount(newEthSaleAmount: BigNumberish, overrides?: Overrides & {
        from?: string;
    }): Promise<ContractTransaction>;
    setMarketPriceMultiply(newMarketPriceMultiply: BigNumberish, overrides?: Overrides & {
        from?: string;
    }): Promise<ContractTransaction>;
    setMinEthSaleAmount(newMinEthSaleAmount: BigNumberish, overrides?: Overrides & {
        from?: string;
    }): Promise<ContractTransaction>;
    setPriceDecayHalfLife(newPriceDecayHalfLife: BigNumberish, overrides?: Overrides & {
        from?: string;
    }): Promise<ContractTransaction>;
    supportsInterface(interfaceId: BytesLike, overrides?: CallOverrides): Promise<boolean>;
    tokenPrice(token: string, overrides?: CallOverrides): Promise<ICarbonPOL.PriceStructOutput>;
    trade(token: string, targetAmount: BigNumberish, overrides?: PayableOverrides & {
        from?: string;
    }): Promise<ContractTransaction>;
    tradingEnabled(token: string, overrides?: CallOverrides): Promise<boolean>;
    version(overrides?: CallOverrides): Promise<number>;
    callStatic: {
        DEFAULT_ADMIN_ROLE(overrides?: CallOverrides): Promise<string>;
        amountAvailableForTrading(token: string, overrides?: CallOverrides): Promise<BigNumber>;
        enableTrading(token: string, price: ICarbonPOL.PriceStruct, overrides?: CallOverrides): Promise<void>;
        enableTradingETH(price: ICarbonPOL.PriceStruct, overrides?: CallOverrides): Promise<void>;
        ethSaleAmount(overrides?: CallOverrides): Promise<ICarbonPOL.EthSaleAmountStructOutput>;
        expectedTradeInput(token: string, targetAmount: BigNumberish, overrides?: CallOverrides): Promise<BigNumber>;
        expectedTradeReturn(token: string, sourceAmount: BigNumberish, overrides?: CallOverrides): Promise<BigNumber>;
        getRoleAdmin(role: BytesLike, overrides?: CallOverrides): Promise<string>;
        getRoleMember(role: BytesLike, index: BigNumberish, overrides?: CallOverrides): Promise<string>;
        getRoleMemberCount(role: BytesLike, overrides?: CallOverrides): Promise<BigNumber>;
        grantRole(role: BytesLike, account: string, overrides?: CallOverrides): Promise<void>;
        hasRole(role: BytesLike, account: string, overrides?: CallOverrides): Promise<boolean>;
        initialize(overrides?: CallOverrides): Promise<void>;
        marketPriceMultiply(overrides?: CallOverrides): Promise<number>;
        minEthSaleAmount(overrides?: CallOverrides): Promise<BigNumber>;
        postUpgrade(data: BytesLike, overrides?: CallOverrides): Promise<void>;
        priceDecayHalfLife(overrides?: CallOverrides): Promise<number>;
        renounceRole(role: BytesLike, account: string, overrides?: CallOverrides): Promise<void>;
        revokeRole(role: BytesLike, account: string, overrides?: CallOverrides): Promise<void>;
        roleAdmin(overrides?: CallOverrides): Promise<string>;
        setEthSaleAmount(newEthSaleAmount: BigNumberish, overrides?: CallOverrides): Promise<void>;
        setMarketPriceMultiply(newMarketPriceMultiply: BigNumberish, overrides?: CallOverrides): Promise<void>;
        setMinEthSaleAmount(newMinEthSaleAmount: BigNumberish, overrides?: CallOverrides): Promise<void>;
        setPriceDecayHalfLife(newPriceDecayHalfLife: BigNumberish, overrides?: CallOverrides): Promise<void>;
        supportsInterface(interfaceId: BytesLike, overrides?: CallOverrides): Promise<boolean>;
        tokenPrice(token: string, overrides?: CallOverrides): Promise<ICarbonPOL.PriceStructOutput>;
        trade(token: string, targetAmount: BigNumberish, overrides?: CallOverrides): Promise<void>;
        tradingEnabled(token: string, overrides?: CallOverrides): Promise<boolean>;
        version(overrides?: CallOverrides): Promise<number>;
    };
    filters: {
        "EthSaleAmountUpdated(uint128,uint128)"(prevEthSaleAmount?: null, newEthSaleAmount?: null): EthSaleAmountUpdatedEventFilter;
        EthSaleAmountUpdated(prevEthSaleAmount?: null, newEthSaleAmount?: null): EthSaleAmountUpdatedEventFilter;
        "Initialized(uint8)"(version?: null): InitializedEventFilter;
        Initialized(version?: null): InitializedEventFilter;
        "MarketPriceMultiplyUpdated(uint32,uint32)"(prevMarketPriceMultiply?: null, newMarketPriceMultiply?: null): MarketPriceMultiplyUpdatedEventFilter;
        MarketPriceMultiplyUpdated(prevMarketPriceMultiply?: null, newMarketPriceMultiply?: null): MarketPriceMultiplyUpdatedEventFilter;
        "MinEthSaleAmountUpdated(uint128,uint128)"(prevMinEthSaleAmount?: null, newMinEthSaleAmount?: null): MinEthSaleAmountUpdatedEventFilter;
        MinEthSaleAmountUpdated(prevMinEthSaleAmount?: null, newMinEthSaleAmount?: null): MinEthSaleAmountUpdatedEventFilter;
        "PriceDecayHalfLifeUpdated(uint32,uint32)"(prevPriceDecayHalfLife?: null, newPriceDecayHalfLife?: null): PriceDecayHalfLifeUpdatedEventFilter;
        PriceDecayHalfLifeUpdated(prevPriceDecayHalfLife?: null, newPriceDecayHalfLife?: null): PriceDecayHalfLifeUpdatedEventFilter;
        "PriceUpdated(address,(uint128,uint128))"(token?: string | null, price?: null): PriceUpdatedEventFilter;
        PriceUpdated(token?: string | null, price?: null): PriceUpdatedEventFilter;
        "RoleAdminChanged(bytes32,bytes32,bytes32)"(role?: BytesLike | null, previousAdminRole?: BytesLike | null, newAdminRole?: BytesLike | null): RoleAdminChangedEventFilter;
        RoleAdminChanged(role?: BytesLike | null, previousAdminRole?: BytesLike | null, newAdminRole?: BytesLike | null): RoleAdminChangedEventFilter;
        "RoleGranted(bytes32,address,address)"(role?: BytesLike | null, account?: string | null, sender?: string | null): RoleGrantedEventFilter;
        RoleGranted(role?: BytesLike | null, account?: string | null, sender?: string | null): RoleGrantedEventFilter;
        "RoleRevoked(bytes32,address,address)"(role?: BytesLike | null, account?: string | null, sender?: string | null): RoleRevokedEventFilter;
        RoleRevoked(role?: BytesLike | null, account?: string | null, sender?: string | null): RoleRevokedEventFilter;
        "TokenTraded(address,address,uint128,uint128)"(caller?: string | null, token?: string | null, sourceAmount?: null, targetAmount?: null): TokenTradedEventFilter;
        TokenTraded(caller?: string | null, token?: string | null, sourceAmount?: null, targetAmount?: null): TokenTradedEventFilter;
        "TradingEnabled(address,(uint128,uint128))"(token?: string | null, price?: null): TradingEnabledEventFilter;
        TradingEnabled(token?: string | null, price?: null): TradingEnabledEventFilter;
    };
    estimateGas: {
        DEFAULT_ADMIN_ROLE(overrides?: CallOverrides): Promise<BigNumber>;
        amountAvailableForTrading(token: string, overrides?: CallOverrides): Promise<BigNumber>;
        enableTrading(token: string, price: ICarbonPOL.PriceStruct, overrides?: Overrides & {
            from?: string;
        }): Promise<BigNumber>;
        enableTradingETH(price: ICarbonPOL.PriceStruct, overrides?: Overrides & {
            from?: string;
        }): Promise<BigNumber>;
        ethSaleAmount(overrides?: CallOverrides): Promise<BigNumber>;
        expectedTradeInput(token: string, targetAmount: BigNumberish, overrides?: CallOverrides): Promise<BigNumber>;
        expectedTradeReturn(token: string, sourceAmount: BigNumberish, overrides?: CallOverrides): Promise<BigNumber>;
        getRoleAdmin(role: BytesLike, overrides?: CallOverrides): Promise<BigNumber>;
        getRoleMember(role: BytesLike, index: BigNumberish, overrides?: CallOverrides): Promise<BigNumber>;
        getRoleMemberCount(role: BytesLike, overrides?: CallOverrides): Promise<BigNumber>;
        grantRole(role: BytesLike, account: string, overrides?: Overrides & {
            from?: string;
        }): Promise<BigNumber>;
        hasRole(role: BytesLike, account: string, overrides?: CallOverrides): Promise<BigNumber>;
        initialize(overrides?: Overrides & {
            from?: string;
        }): Promise<BigNumber>;
        marketPriceMultiply(overrides?: CallOverrides): Promise<BigNumber>;
        minEthSaleAmount(overrides?: CallOverrides): Promise<BigNumber>;
        postUpgrade(data: BytesLike, overrides?: Overrides & {
            from?: string;
        }): Promise<BigNumber>;
        priceDecayHalfLife(overrides?: CallOverrides): Promise<BigNumber>;
        renounceRole(role: BytesLike, account: string, overrides?: Overrides & {
            from?: string;
        }): Promise<BigNumber>;
        revokeRole(role: BytesLike, account: string, overrides?: Overrides & {
            from?: string;
        }): Promise<BigNumber>;
        roleAdmin(overrides?: CallOverrides): Promise<BigNumber>;
        setEthSaleAmount(newEthSaleAmount: BigNumberish, overrides?: Overrides & {
            from?: string;
        }): Promise<BigNumber>;
        setMarketPriceMultiply(newMarketPriceMultiply: BigNumberish, overrides?: Overrides & {
            from?: string;
        }): Promise<BigNumber>;
        setMinEthSaleAmount(newMinEthSaleAmount: BigNumberish, overrides?: Overrides & {
            from?: string;
        }): Promise<BigNumber>;
        setPriceDecayHalfLife(newPriceDecayHalfLife: BigNumberish, overrides?: Overrides & {
            from?: string;
        }): Promise<BigNumber>;
        supportsInterface(interfaceId: BytesLike, overrides?: CallOverrides): Promise<BigNumber>;
        tokenPrice(token: string, overrides?: CallOverrides): Promise<BigNumber>;
        trade(token: string, targetAmount: BigNumberish, overrides?: PayableOverrides & {
            from?: string;
        }): Promise<BigNumber>;
        tradingEnabled(token: string, overrides?: CallOverrides): Promise<BigNumber>;
        version(overrides?: CallOverrides): Promise<BigNumber>;
    };
    populateTransaction: {
        DEFAULT_ADMIN_ROLE(overrides?: CallOverrides): Promise<PopulatedTransaction>;
        amountAvailableForTrading(token: string, overrides?: CallOverrides): Promise<PopulatedTransaction>;
        enableTrading(token: string, price: ICarbonPOL.PriceStruct, overrides?: Overrides & {
            from?: string;
        }): Promise<PopulatedTransaction>;
        enableTradingETH(price: ICarbonPOL.PriceStruct, overrides?: Overrides & {
            from?: string;
        }): Promise<PopulatedTransaction>;
        ethSaleAmount(overrides?: CallOverrides): Promise<PopulatedTransaction>;
        expectedTradeInput(token: string, targetAmount: BigNumberish, overrides?: CallOverrides): Promise<PopulatedTransaction>;
        expectedTradeReturn(token: string, sourceAmount: BigNumberish, overrides?: CallOverrides): Promise<PopulatedTransaction>;
        getRoleAdmin(role: BytesLike, overrides?: CallOverrides): Promise<PopulatedTransaction>;
        getRoleMember(role: BytesLike, index: BigNumberish, overrides?: CallOverrides): Promise<PopulatedTransaction>;
        getRoleMemberCount(role: BytesLike, overrides?: CallOverrides): Promise<PopulatedTransaction>;
        grantRole(role: BytesLike, account: string, overrides?: Overrides & {
            from?: string;
        }): Promise<PopulatedTransaction>;
        hasRole(role: BytesLike, account: string, overrides?: CallOverrides): Promise<PopulatedTransaction>;
        initialize(overrides?: Overrides & {
            from?: string;
        }): Promise<PopulatedTransaction>;
        marketPriceMultiply(overrides?: CallOverrides): Promise<PopulatedTransaction>;
        minEthSaleAmount(overrides?: CallOverrides): Promise<PopulatedTransaction>;
        postUpgrade(data: BytesLike, overrides?: Overrides & {
            from?: string;
        }): Promise<PopulatedTransaction>;
        priceDecayHalfLife(overrides?: CallOverrides): Promise<PopulatedTransaction>;
        renounceRole(role: BytesLike, account: string, overrides?: Overrides & {
            from?: string;
        }): Promise<PopulatedTransaction>;
        revokeRole(role: BytesLike, account: string, overrides?: Overrides & {
            from?: string;
        }): Promise<PopulatedTransaction>;
        roleAdmin(overrides?: CallOverrides): Promise<PopulatedTransaction>;
        setEthSaleAmount(newEthSaleAmount: BigNumberish, overrides?: Overrides & {
            from?: string;
        }): Promise<PopulatedTransaction>;
        setMarketPriceMultiply(newMarketPriceMultiply: BigNumberish, overrides?: Overrides & {
            from?: string;
        }): Promise<PopulatedTransaction>;
        setMinEthSaleAmount(newMinEthSaleAmount: BigNumberish, overrides?: Overrides & {
            from?: string;
        }): Promise<PopulatedTransaction>;
        setPriceDecayHalfLife(newPriceDecayHalfLife: BigNumberish, overrides?: Overrides & {
            from?: string;
        }): Promise<PopulatedTransaction>;
        supportsInterface(interfaceId: BytesLike, overrides?: CallOverrides): Promise<PopulatedTransaction>;
        tokenPrice(token: string, overrides?: CallOverrides): Promise<PopulatedTransaction>;
        trade(token: string, targetAmount: BigNumberish, overrides?: PayableOverrides & {
            from?: string;
        }): Promise<PopulatedTransaction>;
        tradingEnabled(token: string, overrides?: CallOverrides): Promise<PopulatedTransaction>;
        version(overrides?: CallOverrides): Promise<PopulatedTransaction>;
    };
}
//# sourceMappingURL=CarbonPOL.d.ts.map