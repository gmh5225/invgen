/* Autogenerated file. Do not edit manually. */

/* tslint:disable */

/* eslint-disable */
import type {
  TypedEventFilter,
  TypedEvent,
  TypedListener,
  OnEvent,
} from "../../../../../common";
import type {
  FunctionFragment,
  Result,
  EventFragment,
} from "@ethersproject/abi";
import type { Listener, Provider } from "@ethersproject/providers";
import type {
  BaseContract,
  BigNumber,
  BytesLike,
  CallOverrides,
  ContractTransaction,
  Overrides,
  PayableOverrides,
  PopulatedTransaction,
  Signer,
  utils,
} from "ethers";

export interface ITransparentUpgradeableProxyInterface extends utils.Interface {
  functions: {
    "admin()": FunctionFragment;
    "changeAdmin(address)": FunctionFragment;
    "implementation()": FunctionFragment;
    "upgradeTo(address)": FunctionFragment;
    "upgradeToAndCall(address,bytes)": FunctionFragment;
  };

  getFunction(
    nameOrSignatureOrTopic:
      | "admin"
      | "changeAdmin"
      | "implementation"
      | "upgradeTo"
      | "upgradeToAndCall"
  ): FunctionFragment;

  encodeFunctionData(functionFragment: "admin", values?: undefined): string;
  encodeFunctionData(functionFragment: "changeAdmin", values: [string]): string;
  encodeFunctionData(
    functionFragment: "implementation",
    values?: undefined
  ): string;
  encodeFunctionData(functionFragment: "upgradeTo", values: [string]): string;
  encodeFunctionData(
    functionFragment: "upgradeToAndCall",
    values: [string, BytesLike]
  ): string;

  decodeFunctionResult(functionFragment: "admin", data: BytesLike): Result;
  decodeFunctionResult(
    functionFragment: "changeAdmin",
    data: BytesLike
  ): Result;
  decodeFunctionResult(
    functionFragment: "implementation",
    data: BytesLike
  ): Result;
  decodeFunctionResult(functionFragment: "upgradeTo", data: BytesLike): Result;
  decodeFunctionResult(
    functionFragment: "upgradeToAndCall",
    data: BytesLike
  ): Result;

  events: {
    "AdminChanged(address,address)": EventFragment;
    "BeaconUpgraded(address)": EventFragment;
    "Upgraded(address)": EventFragment;
  };

  getEvent(nameOrSignatureOrTopic: "AdminChanged"): EventFragment;
  getEvent(nameOrSignatureOrTopic: "BeaconUpgraded"): EventFragment;
  getEvent(nameOrSignatureOrTopic: "Upgraded"): EventFragment;
}

export interface AdminChangedEventObject {
  previousAdmin: string;
  newAdmin: string;
}
export type AdminChangedEvent = TypedEvent<
  [string, string],
  AdminChangedEventObject
>;

export type AdminChangedEventFilter = TypedEventFilter<AdminChangedEvent>;

export interface BeaconUpgradedEventObject {
  beacon: string;
}
export type BeaconUpgradedEvent = TypedEvent<
  [string],
  BeaconUpgradedEventObject
>;

export type BeaconUpgradedEventFilter = TypedEventFilter<BeaconUpgradedEvent>;

export interface UpgradedEventObject {
  implementation: string;
}
export type UpgradedEvent = TypedEvent<[string], UpgradedEventObject>;

export type UpgradedEventFilter = TypedEventFilter<UpgradedEvent>;

export interface ITransparentUpgradeableProxy extends BaseContract {
  connect(signerOrProvider: Signer | Provider | string): this;
  attach(addressOrName: string): this;
  deployed(): Promise<this>;

  interface: ITransparentUpgradeableProxyInterface;

  queryFilter<TEvent extends TypedEvent>(
    event: TypedEventFilter<TEvent>,
    fromBlockOrBlockhash?: string | number | undefined,
    toBlock?: string | number | undefined
  ): Promise<Array<TEvent>>;

  listeners<TEvent extends TypedEvent>(
    eventFilter?: TypedEventFilter<TEvent>
  ): Array<TypedListener<TEvent>>;
  listeners(eventName?: string): Array<Listener>;
  removeAllListeners<TEvent extends TypedEvent>(
    eventFilter: TypedEventFilter<TEvent>
  ): this;
  removeAllListeners(eventName?: string): this;
  off: OnEvent<this>;
  on: OnEvent<this>;
  once: OnEvent<this>;
  removeListener: OnEvent<this>;

  functions: {
    admin(overrides?: CallOverrides): Promise<[string]>;

    changeAdmin(
      arg0: string,
      overrides?: Overrides & { from?: string }
    ): Promise<ContractTransaction>;

    implementation(overrides?: CallOverrides): Promise<[string]>;

    upgradeTo(
      arg0: string,
      overrides?: Overrides & { from?: string }
    ): Promise<ContractTransaction>;

    upgradeToAndCall(
      arg0: string,
      arg1: BytesLike,
      overrides?: PayableOverrides & { from?: string }
    ): Promise<ContractTransaction>;
  };

  admin(overrides?: CallOverrides): Promise<string>;

  changeAdmin(
    arg0: string,
    overrides?: Overrides & { from?: string }
  ): Promise<ContractTransaction>;

  implementation(overrides?: CallOverrides): Promise<string>;

  upgradeTo(
    arg0: string,
    overrides?: Overrides & { from?: string }
  ): Promise<ContractTransaction>;

  upgradeToAndCall(
    arg0: string,
    arg1: BytesLike,
    overrides?: PayableOverrides & { from?: string }
  ): Promise<ContractTransaction>;

  callStatic: {
    admin(overrides?: CallOverrides): Promise<string>;

    changeAdmin(arg0: string, overrides?: CallOverrides): Promise<void>;

    implementation(overrides?: CallOverrides): Promise<string>;

    upgradeTo(arg0: string, overrides?: CallOverrides): Promise<void>;

    upgradeToAndCall(
      arg0: string,
      arg1: BytesLike,
      overrides?: CallOverrides
    ): Promise<void>;
  };

  filters: {
    "AdminChanged(address,address)"(
      previousAdmin?: null,
      newAdmin?: null
    ): AdminChangedEventFilter;
    AdminChanged(
      previousAdmin?: null,
      newAdmin?: null
    ): AdminChangedEventFilter;

    "BeaconUpgraded(address)"(
      beacon?: string | null
    ): BeaconUpgradedEventFilter;
    BeaconUpgraded(beacon?: string | null): BeaconUpgradedEventFilter;

    "Upgraded(address)"(implementation?: string | null): UpgradedEventFilter;
    Upgraded(implementation?: string | null): UpgradedEventFilter;
  };

  estimateGas: {
    admin(overrides?: CallOverrides): Promise<BigNumber>;

    changeAdmin(
      arg0: string,
      overrides?: Overrides & { from?: string }
    ): Promise<BigNumber>;

    implementation(overrides?: CallOverrides): Promise<BigNumber>;

    upgradeTo(
      arg0: string,
      overrides?: Overrides & { from?: string }
    ): Promise<BigNumber>;

    upgradeToAndCall(
      arg0: string,
      arg1: BytesLike,
      overrides?: PayableOverrides & { from?: string }
    ): Promise<BigNumber>;
  };

  populateTransaction: {
    admin(overrides?: CallOverrides): Promise<PopulatedTransaction>;

    changeAdmin(
      arg0: string,
      overrides?: Overrides & { from?: string }
    ): Promise<PopulatedTransaction>;

    implementation(overrides?: CallOverrides): Promise<PopulatedTransaction>;

    upgradeTo(
      arg0: string,
      overrides?: Overrides & { from?: string }
    ): Promise<PopulatedTransaction>;

    upgradeToAndCall(
      arg0: string,
      arg1: BytesLike,
      overrides?: PayableOverrides & { from?: string }
    ): Promise<PopulatedTransaction>;
  };
}
