<!-- This file is auto-generated. Please do not modify it yourself. -->
# Protobuf Documentation
<a name="top"></a>

## Table of Contents

- [blackfury/epochs/v1/genesis.proto](#blackfury/epochs/v1/genesis.proto)
    - [EpochInfo](#blackfury.epochs.v1.EpochInfo)
    - [GenesisState](#blackfury.epochs.v1.GenesisState)
  
- [blackfury/epochs/v1/query.proto](#blackfury/epochs/v1/query.proto)
    - [QueryCurrentEpochRequest](#blackfury.epochs.v1.QueryCurrentEpochRequest)
    - [QueryCurrentEpochResponse](#blackfury.epochs.v1.QueryCurrentEpochResponse)
    - [QueryEpochsInfoRequest](#blackfury.epochs.v1.QueryEpochsInfoRequest)
    - [QueryEpochsInfoResponse](#blackfury.epochs.v1.QueryEpochsInfoResponse)
  
    - [Query](#blackfury.epochs.v1.Query)
  
- [blackfury/interchainquery/v1/genesis.proto](#blackfury/interchainquery/v1/genesis.proto)
    - [DataPoint](#blackfury.interchainquery.v1.DataPoint)
    - [GenesisState](#blackfury.interchainquery.v1.GenesisState)
    - [Query](#blackfury.interchainquery.v1.Query)
  
- [blackfury/interchainquery/v1/messages.proto](#blackfury/interchainquery/v1/messages.proto)
    - [MsgSubmitQueryResponse](#blackfury.interchainquery.v1.MsgSubmitQueryResponse)
    - [MsgSubmitQueryResponseResponse](#blackfury.interchainquery.v1.MsgSubmitQueryResponseResponse)
  
    - [Msg](#blackfury.interchainquery.v1.Msg)
  
- [blackfury/interchainstaking/v1/genesis.proto](#blackfury/interchainstaking/v1/genesis.proto)
    - [Delegation](#blackfury.interchainstaking.v1.Delegation)
    - [DelegationPlan](#blackfury.interchainstaking.v1.DelegationPlan)
    - [DelegatorIntent](#blackfury.interchainstaking.v1.DelegatorIntent)
    - [GenesisState](#blackfury.interchainstaking.v1.GenesisState)
    - [ICAAccount](#blackfury.interchainstaking.v1.ICAAccount)
    - [Params](#blackfury.interchainstaking.v1.Params)
    - [PortConnectionTuple](#blackfury.interchainstaking.v1.PortConnectionTuple)
    - [Receipt](#blackfury.interchainstaking.v1.Receipt)
    - [RegisteredZone](#blackfury.interchainstaking.v1.RegisteredZone)
    - [RegisteredZone.AggregateIntentEntry](#blackfury.interchainstaking.v1.RegisteredZone.AggregateIntentEntry)
    - [TransferRecord](#blackfury.interchainstaking.v1.TransferRecord)
    - [Validator](#blackfury.interchainstaking.v1.Validator)
    - [ValidatorIntent](#blackfury.interchainstaking.v1.ValidatorIntent)
    - [WithdrawalRecord](#blackfury.interchainstaking.v1.WithdrawalRecord)
  
- [blackfury/interchainstaking/v1/messages.proto](#blackfury/interchainstaking/v1/messages.proto)
    - [MsgRegisterZone](#blackfury.interchainstaking.v1.MsgRegisterZone)
    - [MsgRegisterZoneResponse](#blackfury.interchainstaking.v1.MsgRegisterZoneResponse)
    - [MsgRequestRedemption](#blackfury.interchainstaking.v1.MsgRequestRedemption)
    - [MsgRequestRedemptionResponse](#blackfury.interchainstaking.v1.MsgRequestRedemptionResponse)
    - [MsgSignalIntent](#blackfury.interchainstaking.v1.MsgSignalIntent)
    - [MsgSignalIntentResponse](#blackfury.interchainstaking.v1.MsgSignalIntentResponse)
  
    - [Msg](#blackfury.interchainstaking.v1.Msg)
  
- [blackfury/interchainstaking/v1/query.proto](#blackfury/interchainstaking/v1/query.proto)
    - [QueryDelegationPlansRequest](#blackfury.interchainstaking.v1.QueryDelegationPlansRequest)
    - [QueryDelegationPlansResponse](#blackfury.interchainstaking.v1.QueryDelegationPlansResponse)
    - [QueryDelegationsRequest](#blackfury.interchainstaking.v1.QueryDelegationsRequest)
    - [QueryDelegationsResponse](#blackfury.interchainstaking.v1.QueryDelegationsResponse)
    - [QueryDelegatorDelegationsRequest](#blackfury.interchainstaking.v1.QueryDelegatorDelegationsRequest)
    - [QueryDelegatorDelegationsResponse](#blackfury.interchainstaking.v1.QueryDelegatorDelegationsResponse)
    - [QueryDelegatorIntentRequest](#blackfury.interchainstaking.v1.QueryDelegatorIntentRequest)
    - [QueryDelegatorIntentResponse](#blackfury.interchainstaking.v1.QueryDelegatorIntentResponse)
    - [QueryDepositAccountForChainRequest](#blackfury.interchainstaking.v1.QueryDepositAccountForChainRequest)
    - [QueryDepositAccountForChainResponse](#blackfury.interchainstaking.v1.QueryDepositAccountForChainResponse)
    - [QueryRegisteredZonesInfoRequest](#blackfury.interchainstaking.v1.QueryRegisteredZonesInfoRequest)
    - [QueryRegisteredZonesInfoResponse](#blackfury.interchainstaking.v1.QueryRegisteredZonesInfoResponse)
    - [QueryValidatorDelegationsRequest](#blackfury.interchainstaking.v1.QueryValidatorDelegationsRequest)
    - [QueryValidatorDelegationsResponse](#blackfury.interchainstaking.v1.QueryValidatorDelegationsResponse)
  
    - [Query](#blackfury.interchainstaking.v1.Query)
  
- [blackfury/mint/v1beta1/mint.proto](#blackfury/mint/v1beta1/mint.proto)
    - [DistributionProportions](#blackfury.mint.v1beta1.DistributionProportions)
    - [Minter](#blackfury.mint.v1beta1.Minter)
    - [Params](#blackfury.mint.v1beta1.Params)
  
- [blackfury/mint/v1beta1/genesis.proto](#blackfury/mint/v1beta1/genesis.proto)
    - [GenesisState](#blackfury.mint.v1beta1.GenesisState)
  
- [blackfury/mint/v1beta1/query.proto](#blackfury/mint/v1beta1/query.proto)
    - [QueryEpochProvisionsRequest](#blackfury.mint.v1beta1.QueryEpochProvisionsRequest)
    - [QueryEpochProvisionsResponse](#blackfury.mint.v1beta1.QueryEpochProvisionsResponse)
    - [QueryParamsRequest](#blackfury.mint.v1beta1.QueryParamsRequest)
    - [QueryParamsResponse](#blackfury.mint.v1beta1.QueryParamsResponse)
  
    - [Query](#blackfury.mint.v1beta1.Query)
  
- [blackfury/participationrewards/v1/participationrewards.proto](#blackfury/participationrewards/v1/participationrewards.proto)
    - [DistributionProportions](#blackfury.participationrewards.v1.DistributionProportions)
    - [Params](#blackfury.participationrewards.v1.Params)
  
- [blackfury/participationrewards/v1/genesis.proto](#blackfury/participationrewards/v1/genesis.proto)
    - [GenesisState](#blackfury.participationrewards.v1.GenesisState)
  
- [blackfury/participationrewards/v1/messages.proto](#blackfury/participationrewards/v1/messages.proto)
    - [MsgSubmitClaim](#blackfury.participationrewards.v1.MsgSubmitClaim)
    - [MsgSubmitClaimResponse](#blackfury.participationrewards.v1.MsgSubmitClaimResponse)
  
    - [Msg](#blackfury.participationrewards.v1.Msg)
  
- [blackfury/participationrewards/v1/query.proto](#blackfury/participationrewards/v1/query.proto)
    - [QueryParamsRequest](#blackfury.participationrewards.v1.QueryParamsRequest)
    - [QueryParamsResponse](#blackfury.participationrewards.v1.QueryParamsResponse)
  
    - [Query](#blackfury.participationrewards.v1.Query)
  
- [Scalar Value Types](#scalar-value-types)



<a name="blackfury/epochs/v1/genesis.proto"></a>
<p align="right"><a href="#top">Top</a></p>

## blackfury/epochs/v1/genesis.proto



<a name="blackfury.epochs.v1.EpochInfo"></a>

### EpochInfo



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `identifier` | [string](#string) |  |  |
| `start_time` | [google.protobuf.Timestamp](#google.protobuf.Timestamp) |  |  |
| `duration` | [google.protobuf.Duration](#google.protobuf.Duration) |  |  |
| `current_epoch` | [int64](#int64) |  |  |
| `current_epoch_start_time` | [google.protobuf.Timestamp](#google.protobuf.Timestamp) |  |  |
| `epoch_counting_started` | [bool](#bool) |  |  |
| `current_epoch_start_height` | [int64](#int64) |  |  |






<a name="blackfury.epochs.v1.GenesisState"></a>

### GenesisState
GenesisState defines the epochs module's genesis state.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `epochs` | [EpochInfo](#blackfury.epochs.v1.EpochInfo) | repeated |  |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->



<a name="blackfury/epochs/v1/query.proto"></a>
<p align="right"><a href="#top">Top</a></p>

## blackfury/epochs/v1/query.proto



<a name="blackfury.epochs.v1.QueryCurrentEpochRequest"></a>

### QueryCurrentEpochRequest



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `identifier` | [string](#string) |  |  |






<a name="blackfury.epochs.v1.QueryCurrentEpochResponse"></a>

### QueryCurrentEpochResponse



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `current_epoch` | [int64](#int64) |  |  |






<a name="blackfury.epochs.v1.QueryEpochsInfoRequest"></a>

### QueryEpochsInfoRequest



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `pagination` | [cosmos.base.query.v1beta1.PageRequest](#cosmos.base.query.v1beta1.PageRequest) |  |  |






<a name="blackfury.epochs.v1.QueryEpochsInfoResponse"></a>

### QueryEpochsInfoResponse



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `epochs` | [EpochInfo](#blackfury.epochs.v1.EpochInfo) | repeated |  |
| `pagination` | [cosmos.base.query.v1beta1.PageResponse](#cosmos.base.query.v1beta1.PageResponse) |  |  |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->


<a name="blackfury.epochs.v1.Query"></a>

### Query
Query defines the gRPC querier service.

| Method Name | Request Type | Response Type | Description | HTTP Verb | Endpoint |
| ----------- | ------------ | ------------- | ------------| ------- | -------- |
| `EpochInfos` | [QueryEpochsInfoRequest](#blackfury.epochs.v1.QueryEpochsInfoRequest) | [QueryEpochsInfoResponse](#blackfury.epochs.v1.QueryEpochsInfoResponse) | EpochInfos provide running epochInfos | GET|/blackfury/epochs/v1/epochs|
| `CurrentEpoch` | [QueryCurrentEpochRequest](#blackfury.epochs.v1.QueryCurrentEpochRequest) | [QueryCurrentEpochResponse](#blackfury.epochs.v1.QueryCurrentEpochResponse) | CurrentEpoch provide current epoch of specified identifier | GET|/blackfury/epochs/v1/current_epoch|

 <!-- end services -->



<a name="blackfury/interchainquery/v1/genesis.proto"></a>
<p align="right"><a href="#top">Top</a></p>

## blackfury/interchainquery/v1/genesis.proto



<a name="blackfury.interchainquery.v1.DataPoint"></a>

### DataPoint



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `id` | [string](#string) |  |  |
| `remote_height` | [string](#string) |  |  |
| `local_height` | [string](#string) |  |  |
| `value` | [bytes](#bytes) |  |  |






<a name="blackfury.interchainquery.v1.GenesisState"></a>

### GenesisState
GenesisState defines the epochs module's genesis state.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `queries` | [Query](#blackfury.interchainquery.v1.Query) | repeated |  |






<a name="blackfury.interchainquery.v1.Query"></a>

### Query



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `id` | [string](#string) |  |  |
| `connection_id` | [string](#string) |  |  |
| `chain_id` | [string](#string) |  |  |
| `query_type` | [string](#string) |  |  |
| `request` | [bytes](#bytes) |  |  |
| `period` | [string](#string) |  |  |
| `last_height` | [string](#string) |  |  |
| `callback_id` | [string](#string) |  |  |
| `ttl` | [uint64](#uint64) |  |  |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->



<a name="blackfury/interchainquery/v1/messages.proto"></a>
<p align="right"><a href="#top">Top</a></p>

## blackfury/interchainquery/v1/messages.proto



<a name="blackfury.interchainquery.v1.MsgSubmitQueryResponse"></a>

### MsgSubmitQueryResponse
MsgSubmitQueryResponse represents a message type to fulfil a query request.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `chain_id` | [string](#string) |  |  |
| `query_id` | [string](#string) |  |  |
| `result` | [bytes](#bytes) |  |  |
| `proof_ops` | [tendermint.crypto.ProofOps](#tendermint.crypto.ProofOps) |  |  |
| `height` | [int64](#int64) |  |  |
| `from_address` | [string](#string) |  |  |






<a name="blackfury.interchainquery.v1.MsgSubmitQueryResponseResponse"></a>

### MsgSubmitQueryResponseResponse
MsgSubmitQueryResponseResponse defines the MsgSubmitQueryResponse response
type.





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->


<a name="blackfury.interchainquery.v1.Msg"></a>

### Msg
Msg defines the interchainquery Msg service.

| Method Name | Request Type | Response Type | Description | HTTP Verb | Endpoint |
| ----------- | ------------ | ------------- | ------------| ------- | -------- |
| `SubmitQueryResponse` | [MsgSubmitQueryResponse](#blackfury.interchainquery.v1.MsgSubmitQueryResponse) | [MsgSubmitQueryResponseResponse](#blackfury.interchainquery.v1.MsgSubmitQueryResponseResponse) | SubmitQueryResponse defines a method for submit query responses. | POST|/interchainquery/tx/v1beta1/submitquery|

 <!-- end services -->



<a name="blackfury/interchainstaking/v1/genesis.proto"></a>
<p align="right"><a href="#top">Top</a></p>

## blackfury/interchainstaking/v1/genesis.proto



<a name="blackfury.interchainstaking.v1.Delegation"></a>

### Delegation



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `delegation_address` | [string](#string) |  |  |
| `validator_address` | [string](#string) |  |  |
| `amount` | [cosmos.base.v1beta1.Coin](#cosmos.base.v1beta1.Coin) |  |  |
| `height` | [int64](#int64) |  |  |
| `redelegation_end` | [int64](#int64) |  |  |






<a name="blackfury.interchainstaking.v1.DelegationPlan"></a>

### DelegationPlan



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `validatorAddress` | [string](#string) |  |  |
| `delegatorAddress` | [string](#string) |  |  |
| `value` | [cosmos.base.v1beta1.Coin](#cosmos.base.v1beta1.Coin) | repeated |  |






<a name="blackfury.interchainstaking.v1.DelegatorIntent"></a>

### DelegatorIntent



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `delegator` | [string](#string) |  |  |
| `intents` | [ValidatorIntent](#blackfury.interchainstaking.v1.ValidatorIntent) | repeated |  |






<a name="blackfury.interchainstaking.v1.GenesisState"></a>

### GenesisState
GenesisState defines the interchainstaking module's genesis state.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `params` | [Params](#blackfury.interchainstaking.v1.Params) |  |  |
| `zones` | [RegisteredZone](#blackfury.interchainstaking.v1.RegisteredZone) | repeated |  |






<a name="blackfury.interchainstaking.v1.ICAAccount"></a>

### ICAAccount



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `address` | [string](#string) |  |  |
| `balance` | [cosmos.base.v1beta1.Coin](#cosmos.base.v1beta1.Coin) | repeated | balance defines the different coins this balance holds. |
| `delegated_balance` | [cosmos.base.v1beta1.Coin](#cosmos.base.v1beta1.Coin) |  |  |
| `port_name` | [string](#string) |  |  |
| `balance_waitgroup` | [uint32](#uint32) |  | Delegations here? or against validator? |






<a name="blackfury.interchainstaking.v1.Params"></a>

### Params



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `delegation_account_count` | [uint64](#uint64) |  |  |
| `delegation_account_split` | [uint64](#uint64) |  |  |
| `deposit_interval` | [uint64](#uint64) |  |  |
| `delegate_interval` | [uint64](#uint64) |  |  |
| `delegations_interval` | [uint64](#uint64) |  |  |
| `validatorset_interval` | [uint64](#uint64) |  |  |
| `commission_rate` | [string](#string) |  |  |






<a name="blackfury.interchainstaking.v1.PortConnectionTuple"></a>

### PortConnectionTuple



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `connection_id` | [string](#string) |  |  |
| `port_id` | [string](#string) |  |  |






<a name="blackfury.interchainstaking.v1.Receipt"></a>

### Receipt



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `zone` | [RegisteredZone](#blackfury.interchainstaking.v1.RegisteredZone) |  |  |
| `sender` | [string](#string) |  |  |
| `txhash` | [string](#string) |  |  |
| `amount` | [cosmos.base.v1beta1.Coin](#cosmos.base.v1beta1.Coin) | repeated |  |






<a name="blackfury.interchainstaking.v1.RegisteredZone"></a>

### RegisteredZone



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `connection_id` | [string](#string) |  |  |
| `chain_id` | [string](#string) |  |  |
| `deposit_address` | [ICAAccount](#blackfury.interchainstaking.v1.ICAAccount) |  |  |
| `withdrawal_address` | [ICAAccount](#blackfury.interchainstaking.v1.ICAAccount) |  |  |
| `performance_address` | [ICAAccount](#blackfury.interchainstaking.v1.ICAAccount) |  |  |
| `delegation_addresses` | [ICAAccount](#blackfury.interchainstaking.v1.ICAAccount) | repeated |  |
| `account_prefix` | [string](#string) |  |  |
| `local_denom` | [string](#string) |  |  |
| `base_denom` | [string](#string) |  |  |
| `redemption_rate` | [string](#string) |  |  |
| `last_redemption_rate` | [string](#string) |  |  |
| `validators` | [Validator](#blackfury.interchainstaking.v1.Validator) | repeated |  |
| `aggregate_intent` | [RegisteredZone.AggregateIntentEntry](#blackfury.interchainstaking.v1.RegisteredZone.AggregateIntentEntry) | repeated |  |
| `multi_send` | [bool](#bool) |  |  |
| `liquidity_module` | [bool](#bool) |  |  |
| `withdrawal_waitgroup` | [uint32](#uint32) |  |  |
| `ibc_next_validators_hash` | [bytes](#bytes) |  |  |
| `allocation` | [cosmos.base.v1beta1.Coin](#cosmos.base.v1beta1.Coin) | repeated |  |






<a name="blackfury.interchainstaking.v1.RegisteredZone.AggregateIntentEntry"></a>

### RegisteredZone.AggregateIntentEntry



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `key` | [string](#string) |  |  |
| `value` | [ValidatorIntent](#blackfury.interchainstaking.v1.ValidatorIntent) |  |  |






<a name="blackfury.interchainstaking.v1.TransferRecord"></a>

### TransferRecord



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `sender` | [string](#string) |  |  |
| `recipient` | [string](#string) |  |  |
| `amount` | [cosmos.base.v1beta1.Coin](#cosmos.base.v1beta1.Coin) |  |  |






<a name="blackfury.interchainstaking.v1.Validator"></a>

### Validator



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `valoper_address` | [string](#string) |  |  |
| `commission_rate` | [string](#string) |  |  |
| `delegator_shares` | [string](#string) |  |  |
| `voting_power` | [string](#string) |  |  |






<a name="blackfury.interchainstaking.v1.ValidatorIntent"></a>

### ValidatorIntent



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `valoper_address` | [string](#string) |  |  |
| `weight` | [string](#string) |  |  |






<a name="blackfury.interchainstaking.v1.WithdrawalRecord"></a>

### WithdrawalRecord



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `delegator` | [string](#string) |  |  |
| `validator` | [string](#string) |  |  |
| `recipient` | [string](#string) |  |  |
| `amount` | [cosmos.base.v1beta1.Coin](#cosmos.base.v1beta1.Coin) |  |  |
| `burn_amount` | [cosmos.base.v1beta1.Coin](#cosmos.base.v1beta1.Coin) |  |  |
| `txhash` | [string](#string) |  |  |
| `status` | [int32](#int32) |  |  |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->



<a name="blackfury/interchainstaking/v1/messages.proto"></a>
<p align="right"><a href="#top">Top</a></p>

## blackfury/interchainstaking/v1/messages.proto



<a name="blackfury.interchainstaking.v1.MsgRegisterZone"></a>

### MsgRegisterZone
MsgRegisterZone represents a message type to register a new zone. TODO:
deprecate in favour of governance vote.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `connection_id` | [string](#string) |  |  |
| `base_denom` | [string](#string) |  |  |
| `local_denom` | [string](#string) |  |  |
| `account_prefix` | [string](#string) |  |  |
| `from_address` | [string](#string) |  |  |
| `multi_send` | [bool](#bool) |  |  |
| `liquidity_module` | [bool](#bool) |  |  |






<a name="blackfury.interchainstaking.v1.MsgRegisterZoneResponse"></a>

### MsgRegisterZoneResponse
MsgRegisterZoneResponse defines the MsgRegisterZone response type.






<a name="blackfury.interchainstaking.v1.MsgRequestRedemption"></a>

### MsgRequestRedemption
MsgRegisterZone represents a message type to request a burn of qAssets for
native assets.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `coin` | [string](#string) |  |  |
| `destination_address` | [string](#string) |  |  |
| `from_address` | [string](#string) |  |  |






<a name="blackfury.interchainstaking.v1.MsgRequestRedemptionResponse"></a>

### MsgRequestRedemptionResponse
MsgRequestRedemptionResponse defines the MsgRequestRedemption response type.






<a name="blackfury.interchainstaking.v1.MsgSignalIntent"></a>

### MsgSignalIntent
MsgSignalIntent represents a message type for signalling voting intent for
one or more validators.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `chain_id` | [string](#string) |  |  |
| `intents` | [ValidatorIntent](#blackfury.interchainstaking.v1.ValidatorIntent) | repeated |  |
| `from_address` | [string](#string) |  |  |






<a name="blackfury.interchainstaking.v1.MsgSignalIntentResponse"></a>

### MsgSignalIntentResponse
MsgSignalIntentResponse defines the MsgSignalIntent response type.





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->


<a name="blackfury.interchainstaking.v1.Msg"></a>

### Msg
Msg defines the interchainstaking Msg service.

| Method Name | Request Type | Response Type | Description | HTTP Verb | Endpoint |
| ----------- | ------------ | ------------- | ------------| ------- | -------- |
| `RegisterZone` | [MsgRegisterZone](#blackfury.interchainstaking.v1.MsgRegisterZone) | [MsgRegisterZoneResponse](#blackfury.interchainstaking.v1.MsgRegisterZoneResponse) | RegisterZone defines a method for registering a new zone. TODO: deprecate in favour of governance vote. | POST|/blackfury/tx/v1/interchainstaking/zone|
| `RequestRedemption` | [MsgRequestRedemption](#blackfury.interchainstaking.v1.MsgRequestRedemption) | [MsgRequestRedemptionResponse](#blackfury.interchainstaking.v1.MsgRequestRedemptionResponse) | RequestRedemption defines a method for requesting burning of qAssets for native assets. | POST|/blackfury/tx/v1/interchainstaking/redeem|
| `SignalIntent` | [MsgSignalIntent](#blackfury.interchainstaking.v1.MsgSignalIntent) | [MsgSignalIntentResponse](#blackfury.interchainstaking.v1.MsgSignalIntentResponse) | SignalIntent defines a method for signalling voting intent for one or more validators. | POST|/blackfury/tx/v1/interchainstaking/intent|

 <!-- end services -->



<a name="blackfury/interchainstaking/v1/query.proto"></a>
<p align="right"><a href="#top">Top</a></p>

## blackfury/interchainstaking/v1/query.proto



<a name="blackfury.interchainstaking.v1.QueryDelegationPlansRequest"></a>

### QueryDelegationPlansRequest



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `chain_id` | [string](#string) |  |  |
| `pagination` | [cosmos.base.query.v1beta1.PageRequest](#cosmos.base.query.v1beta1.PageRequest) |  |  |






<a name="blackfury.interchainstaking.v1.QueryDelegationPlansResponse"></a>

### QueryDelegationPlansResponse



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `delegations` | [DelegationPlan](#blackfury.interchainstaking.v1.DelegationPlan) | repeated |  |






<a name="blackfury.interchainstaking.v1.QueryDelegationsRequest"></a>

### QueryDelegationsRequest



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `chain_id` | [string](#string) |  |  |
| `pagination` | [cosmos.base.query.v1beta1.PageRequest](#cosmos.base.query.v1beta1.PageRequest) |  |  |






<a name="blackfury.interchainstaking.v1.QueryDelegationsResponse"></a>

### QueryDelegationsResponse



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `delegations` | [Delegation](#blackfury.interchainstaking.v1.Delegation) | repeated |  |






<a name="blackfury.interchainstaking.v1.QueryDelegatorDelegationsRequest"></a>

### QueryDelegatorDelegationsRequest



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `delegator_address` | [string](#string) |  |  |
| `chain_id` | [string](#string) |  |  |
| `pagination` | [cosmos.base.query.v1beta1.PageRequest](#cosmos.base.query.v1beta1.PageRequest) |  |  |






<a name="blackfury.interchainstaking.v1.QueryDelegatorDelegationsResponse"></a>

### QueryDelegatorDelegationsResponse



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `delegations` | [Delegation](#blackfury.interchainstaking.v1.Delegation) | repeated |  |






<a name="blackfury.interchainstaking.v1.QueryDelegatorIntentRequest"></a>

### QueryDelegatorIntentRequest



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `chain_id` | [string](#string) |  |  |
| `delegator_address` | [string](#string) |  |  |






<a name="blackfury.interchainstaking.v1.QueryDelegatorIntentResponse"></a>

### QueryDelegatorIntentResponse



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `intent` | [DelegatorIntent](#blackfury.interchainstaking.v1.DelegatorIntent) |  |  |






<a name="blackfury.interchainstaking.v1.QueryDepositAccountForChainRequest"></a>

### QueryDepositAccountForChainRequest
QueryDepositAccountForChainRequest is the request type for the
Query/InterchainAccountAddress RPC


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `chain_id` | [string](#string) |  |  |






<a name="blackfury.interchainstaking.v1.QueryDepositAccountForChainResponse"></a>

### QueryDepositAccountForChainResponse
QueryDepositAccountForChainResponse the response type for the
Query/InterchainAccountAddress RPC


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `deposit_account_address` | [string](#string) |  |  |






<a name="blackfury.interchainstaking.v1.QueryRegisteredZonesInfoRequest"></a>

### QueryRegisteredZonesInfoRequest



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `pagination` | [cosmos.base.query.v1beta1.PageRequest](#cosmos.base.query.v1beta1.PageRequest) |  |  |






<a name="blackfury.interchainstaking.v1.QueryRegisteredZonesInfoResponse"></a>

### QueryRegisteredZonesInfoResponse



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `zones` | [RegisteredZone](#blackfury.interchainstaking.v1.RegisteredZone) | repeated |  |
| `pagination` | [cosmos.base.query.v1beta1.PageResponse](#cosmos.base.query.v1beta1.PageResponse) |  |  |






<a name="blackfury.interchainstaking.v1.QueryValidatorDelegationsRequest"></a>

### QueryValidatorDelegationsRequest



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `validator_address` | [string](#string) |  |  |
| `chain_id` | [string](#string) |  |  |
| `pagination` | [cosmos.base.query.v1beta1.PageRequest](#cosmos.base.query.v1beta1.PageRequest) |  |  |






<a name="blackfury.interchainstaking.v1.QueryValidatorDelegationsResponse"></a>

### QueryValidatorDelegationsResponse



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `delegations` | [Delegation](#blackfury.interchainstaking.v1.Delegation) | repeated |  |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->


<a name="blackfury.interchainstaking.v1.Query"></a>

### Query
Query defines the gRPC querier service.

| Method Name            | Request Type                                                                                               | Response Type | Description                                                                                      | HTTP Verb | Endpoint |
|------------------------|------------------------------------------------------------------------------------------------------------| ------------- |--------------------------------------------------------------------------------------------------| ------- | -------- |
| `Zones`      | [QueryZonesRequest](#blackfury.interchainstaking.v1.QueryZonesRequest)                                   | [QueryZonesResponse](#blackfury.interchainstaking.v1.QueryZonesResponse) | Zones provides meta data on connected zones.                                                     | GET|/blackfury/interchainstaking/v1/zones|
| `DepositAccount`       | [QueryDepositAccountForChainRequest](#blackfury.interchainstaking.v1.QueryDepositAccountForChainRequest) | [QueryDepositAccountForChainResponse](#blackfury.interchainstaking.v1.QueryDepositAccountForChainResponse) | DepositAccount provides data on the deposit address for a connected zone.                        | GET|/blackfury/interchainstaking/v1/zones/{chain_id}/deposit_address|
| `DelegatorIntent`      | [QueryDelegatorIntentRequest](#blackfury.interchainstaking.v1.QueryDelegatorIntentRequest)               | [QueryDelegatorIntentResponse](#blackfury.interchainstaking.v1.QueryDelegatorIntentResponse) | DelegatorIntent provides data on the intent of the delegator for the given zone.                 | GET|/blackfury/interchainstaking/v1/zones/{chain_id}/delegator_intent/{delegator_address}|
| `Delegations`          | [QueryDelegationsRequest](#blackfury.interchainstaking.v1.QueryDelegationsRequest)                       | [QueryDelegationsResponse](#blackfury.interchainstaking.v1.QueryDelegationsResponse) | Delegations provides data on the delegations for the given zone.                                 | GET|/blackfury/interchainstaking/v1/zones/{chain_id}/delegations|
| `DelegatorDelegations` | [QueryDelegatorDelegationsRequest](#blackfury.interchainstaking.v1.QueryDelegatorDelegationsRequest)     | [QueryDelegatorDelegationsResponse](#blackfury.interchainstaking.v1.QueryDelegatorDelegationsResponse) | DelegatorDelegations provides data on the delegations from a given delegator for the given zone. | GET|/blackfury/interchainstaking/v1/zones/{chain_id}/delegator_delegations/{delegator_address}|
| `ValidatorDelegations` | [QueryValidatorDelegationsRequest](#blackfury.interchainstaking.v1.QueryValidatorDelegationsRequest)     | [QueryValidatorDelegationsResponse](#blackfury.interchainstaking.v1.QueryValidatorDelegationsResponse) | ValidatorDelegations provides data on the delegations to a given validator for the given zone.   | GET|/blackfury/interchainstaking/v1/zones/{chain_id}/validator_delegations/{validator_address}|
| `DelegationPlans`      | [QueryDelegationPlansRequest](#blackfury.interchainstaking.v1.QueryDelegationPlansRequest)               | [QueryDelegationPlansResponse](#blackfury.interchainstaking.v1.QueryDelegationPlansResponse) | DelegationPlans provides data on the delegations to a given validator for the given zone.        | GET|/blackfury/interchainstaking/v1/zones/{chain_id}/delegation_plans|

 <!-- end services -->



<a name="blackfury/mint/v1beta1/mint.proto"></a>
<p align="right"><a href="#top">Top</a></p>

## blackfury/mint/v1beta1/mint.proto



<a name="blackfury.mint.v1beta1.DistributionProportions"></a>

### DistributionProportions



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `staking` | [string](#string) |  | staking defines the proportion of the minted minted_denom that is to be allocated as staking rewards. |
| `pool_incentives` | [string](#string) |  | pool_incentives defines the proportion of the minted minted_denom that is to be allocated as pool incentives. |
| `participation_rewards` | [string](#string) |  | participation_rewards defines the proportion of the minted minted_denom that is to be allocated to participation rewards address. |
| `community_pool` | [string](#string) |  | community_pool defines the proportion of the minted minted_denom that is to be allocated to the community pool. |






<a name="blackfury.mint.v1beta1.Minter"></a>

### Minter
Minter represents the minting state.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `epoch_provisions` | [string](#string) |  | current epoch provisions |






<a name="blackfury.mint.v1beta1.Params"></a>

### Params
Params holds parameters for the mint module.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `mint_denom` | [string](#string) |  | type of coin to mint |
| `genesis_epoch_provisions` | [string](#string) |  | epoch provisions from the first epoch |
| `epoch_identifier` | [string](#string) |  | mint epoch identifier |
| `reduction_period_in_epochs` | [int64](#int64) |  | number of epochs take to reduce rewards |
| `reduction_factor` | [string](#string) |  | reduction multiplier to execute on each period |
| `distribution_proportions` | [DistributionProportions](#blackfury.mint.v1beta1.DistributionProportions) |  | distribution_proportions defines the proportion of the minted denom |
| `minting_rewards_distribution_start_epoch` | [int64](#int64) |  | start epoch to distribute minting rewards |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->



<a name="blackfury/mint/v1beta1/genesis.proto"></a>
<p align="right"><a href="#top">Top</a></p>

## blackfury/mint/v1beta1/genesis.proto



<a name="blackfury.mint.v1beta1.GenesisState"></a>

### GenesisState
GenesisState defines the mint module's genesis state.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `minter` | [Minter](#blackfury.mint.v1beta1.Minter) |  | minter is a space for holding current rewards information. |
| `params` | [Params](#blackfury.mint.v1beta1.Params) |  | params defines all the paramaters of the module. |
| `reduction_started_epoch` | [int64](#int64) |  | current reduction period start epoch |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->



<a name="blackfury/mint/v1beta1/query.proto"></a>
<p align="right"><a href="#top">Top</a></p>

## blackfury/mint/v1beta1/query.proto



<a name="blackfury.mint.v1beta1.QueryEpochProvisionsRequest"></a>

### QueryEpochProvisionsRequest
QueryEpochProvisionsRequest is the request type for the
Query/EpochProvisions RPC method.






<a name="blackfury.mint.v1beta1.QueryEpochProvisionsResponse"></a>

### QueryEpochProvisionsResponse
QueryEpochProvisionsResponse is the response type for the
Query/EpochProvisions RPC method.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `epoch_provisions` | [bytes](#bytes) |  | epoch_provisions is the current minting per epoch provisions value. |






<a name="blackfury.mint.v1beta1.QueryParamsRequest"></a>

### QueryParamsRequest
QueryParamsRequest is the request type for the Query/Params RPC method.






<a name="blackfury.mint.v1beta1.QueryParamsResponse"></a>

### QueryParamsResponse
QueryParamsResponse is the response type for the Query/Params RPC method.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `params` | [Params](#blackfury.mint.v1beta1.Params) |  | params defines the parameters of the module. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->


<a name="blackfury.mint.v1beta1.Query"></a>

### Query
Query provides defines the gRPC querier service.

| Method Name | Request Type | Response Type | Description | HTTP Verb | Endpoint |
| ----------- | ------------ | ------------- | ------------| ------- | -------- |
| `Params` | [QueryParamsRequest](#blackfury.mint.v1beta1.QueryParamsRequest) | [QueryParamsResponse](#blackfury.mint.v1beta1.QueryParamsResponse) | Params returns the total set of minting parameters. | GET|/blackfury/mint/v1beta1/params|
| `EpochProvisions` | [QueryEpochProvisionsRequest](#blackfury.mint.v1beta1.QueryEpochProvisionsRequest) | [QueryEpochProvisionsResponse](#blackfury.mint.v1beta1.QueryEpochProvisionsResponse) | EpochProvisions current minting epoch provisions value. | GET|/blackfury/mint/v1beta1/epoch_provisions|

 <!-- end services -->



<a name="blackfury/participationrewards/v1/participationrewards.proto"></a>
<p align="right"><a href="#top">Top</a></p>

## blackfury/participationrewards/v1/participationrewards.proto



<a name="blackfury.participationrewards.v1.DistributionProportions"></a>

### DistributionProportions
DistributionProportions defines the proportions of minted FURY that is to be
allocated as participation rewards.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `validator_selection_allocation` | [string](#string) |  |  |
| `holdings_allocation` | [string](#string) |  |  |
| `lockup_allocation` | [string](#string) |  |  |






<a name="blackfury.participationrewards.v1.Params"></a>

### Params
Params holds parameters for the participationrewards module.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `distribution_proportions` | [DistributionProportions](#blackfury.participationrewards.v1.DistributionProportions) |  | distribution_proportions defines the proportions of the minted participation rewards; |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->



<a name="blackfury/participationrewards/v1/genesis.proto"></a>
<p align="right"><a href="#top">Top</a></p>

## blackfury/participationrewards/v1/genesis.proto



<a name="blackfury.participationrewards.v1.GenesisState"></a>

### GenesisState
GenesisState defines the participationrewards module's genesis state.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `params` | [Params](#blackfury.participationrewards.v1.Params) |  |  |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->

 <!-- end services -->



<a name="blackfury/participationrewards/v1/messages.proto"></a>
<p align="right"><a href="#top">Top</a></p>

## blackfury/participationrewards/v1/messages.proto



<a name="blackfury.participationrewards.v1.MsgSubmitClaim"></a>

### MsgSubmitClaim
MsgSubmitClaim represents a message type for submitting a participation
claim regarding the given zone (chain).


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `user_address` | [string](#string) |  |  |
| `zone` | [string](#string) |  |  |
| `asset_type` | [string](#string) |  |  |






<a name="blackfury.participationrewards.v1.MsgSubmitClaimResponse"></a>

### MsgSubmitClaimResponse
MsgSubmitClaimResponse defines the MsgSubmitClaim response type.





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->


<a name="blackfury.participationrewards.v1.Msg"></a>

### Msg
Msg defines the participationrewards Msg service.

| Method Name | Request Type | Response Type | Description | HTTP Verb | Endpoint |
| ----------- | ------------ | ------------- | ------------| ------- | -------- |
| `SubmitClaim` | [MsgSubmitClaim](#blackfury.participationrewards.v1.MsgSubmitClaim) | [MsgSubmitClaimResponse](#blackfury.participationrewards.v1.MsgSubmitClaimResponse) |  | POST|/blackfury/tx/v1/participationrewards/claim|

 <!-- end services -->



<a name="blackfury/participationrewards/v1/query.proto"></a>
<p align="right"><a href="#top">Top</a></p>

## blackfury/participationrewards/v1/query.proto



<a name="blackfury.participationrewards.v1.QueryParamsRequest"></a>

### QueryParamsRequest
QueryParamsRequest is the request type for the Query/Params RPC method.






<a name="blackfury.participationrewards.v1.QueryParamsResponse"></a>

### QueryParamsResponse
QueryParamsResponse is the response type for the Query/Params RPC method.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| `params` | [Params](#blackfury.participationrewards.v1.Params) |  | params defines the parameters of the module. |





 <!-- end messages -->

 <!-- end enums -->

 <!-- end HasExtensions -->


<a name="blackfury.participationrewards.v1.Query"></a>

### Query
Query provides defines the gRPC querier service.

| Method Name | Request Type | Response Type | Description | HTTP Verb | Endpoint |
| ----------- | ------------ | ------------- | ------------| ------- | -------- |
| `Params` | [QueryParamsRequest](#blackfury.participationrewards.v1.QueryParamsRequest) | [QueryParamsResponse](#blackfury.participationrewards.v1.QueryParamsResponse) | Params returns the total set of participation rewards parameters. | GET|/blackfury/participationrewards/v1beta1/params|

 <!-- end services -->



## Scalar Value Types

| .proto Type | Notes | C++ | Java | Python | Go | C# | PHP | Ruby |
| ----------- | ----- | --- | ---- | ------ | -- | -- | --- | ---- |
| <a name="double" /> double |  | double | double | float | float64 | double | float | Float |
| <a name="float" /> float |  | float | float | float | float32 | float | float | Float |
| <a name="int32" /> int32 | Uses variable-length encoding. Inefficient for encoding negative numbers – if your field is likely to have negative values, use sint32 instead. | int32 | int | int | int32 | int | integer | Bignum or Fixnum (as required) |
| <a name="int64" /> int64 | Uses variable-length encoding. Inefficient for encoding negative numbers – if your field is likely to have negative values, use sint64 instead. | int64 | long | int/long | int64 | long | integer/string | Bignum |
| <a name="uint32" /> uint32 | Uses variable-length encoding. | uint32 | int | int/long | uint32 | uint | integer | Bignum or Fixnum (as required) |
| <a name="uint64" /> uint64 | Uses variable-length encoding. | uint64 | long | int/long | uint64 | ulong | integer/string | Bignum or Fixnum (as required) |
| <a name="sint32" /> sint32 | Uses variable-length encoding. Signed int value. These more efficiently encode negative numbers than regular int32s. | int32 | int | int | int32 | int | integer | Bignum or Fixnum (as required) |
| <a name="sint64" /> sint64 | Uses variable-length encoding. Signed int value. These more efficiently encode negative numbers than regular int64s. | int64 | long | int/long | int64 | long | integer/string | Bignum |
| <a name="fixed32" /> fixed32 | Always four bytes. More efficient than uint32 if values are often greater than 2^28. | uint32 | int | int | uint32 | uint | integer | Bignum or Fixnum (as required) |
| <a name="fixed64" /> fixed64 | Always eight bytes. More efficient than uint64 if values are often greater than 2^56. | uint64 | long | int/long | uint64 | ulong | integer/string | Bignum |
| <a name="sfixed32" /> sfixed32 | Always four bytes. | int32 | int | int | int32 | int | integer | Bignum or Fixnum (as required) |
| <a name="sfixed64" /> sfixed64 | Always eight bytes. | int64 | long | int/long | int64 | long | integer/string | Bignum |
| <a name="bool" /> bool |  | bool | boolean | boolean | bool | bool | boolean | TrueClass/FalseClass |
| <a name="string" /> string | A string must always contain UTF-8 encoded or 7-bit ASCII text. | string | String | str/unicode | string | string | string | String (UTF-8) |
| <a name="bytes" /> bytes | May contain any arbitrary sequence of bytes. | string | ByteString | str | []byte | ByteString | string | String (ASCII-8BIT) |

