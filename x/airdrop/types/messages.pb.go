// Code generated by protoc-gen-gogo. DO NOT EDIT.
// source: quicksilver/airdrop/v1/messages.proto

package types

import (
	context "context"
	fmt "fmt"
	_ "github.com/cosmos/cosmos-proto"
	github_com_cosmos_cosmos_sdk_types "github.com/cosmos/cosmos-sdk/types"
	types1 "github.com/cosmos/cosmos-sdk/types"
	_ "github.com/cosmos/cosmos-sdk/types/msgservice"
	_ "github.com/gogo/protobuf/gogoproto"
	grpc1 "github.com/gogo/protobuf/grpc"
	proto "github.com/gogo/protobuf/proto"
	types "github.com/nephirim/blackfury/x/claimsmanager/types"
	_ "google.golang.org/genproto/googleapis/api/annotations"
	grpc "google.golang.org/grpc"
	codes "google.golang.org/grpc/codes"
	status "google.golang.org/grpc/status"
	io "io"
	math "math"
	math_bits "math/bits"
)

// Reference imports to suppress errors if they are not otherwise used.
var _ = proto.Marshal
var _ = fmt.Errorf
var _ = math.Inf

// This is a compile-time assertion to ensure that this generated file
// is compatible with the proto package it is being compiled against.
// A compilation error at this line likely means your copy of the
// proto package needs to be updated.
const _ = proto.GoGoProtoPackageIsVersion3 // please upgrade the proto package

type MsgClaim struct {
	ChainId string         `protobuf:"bytes,1,opt,name=chain_id,json=chainId,proto3" json:"chain_id,omitempty" yaml:"chain_id"`
	Action  int64          `protobuf:"varint,2,opt,name=action,proto3" json:"action,omitempty" yaml:"action"`
	Address string         `protobuf:"bytes,3,opt,name=address,proto3" json:"address,omitempty" yaml:"address"`
	Proofs  []*types.Proof `protobuf:"bytes,4,rep,name=proofs,proto3" json:"proofs,omitempty" yaml:"proofs"`
}

func (m *MsgClaim) Reset()         { *m = MsgClaim{} }
func (m *MsgClaim) String() string { return proto.CompactTextString(m) }
func (*MsgClaim) ProtoMessage()    {}
func (*MsgClaim) Descriptor() ([]byte, []int) {
	return fileDescriptor_2b0828c7de1949a1, []int{0}
}
func (m *MsgClaim) XXX_Unmarshal(b []byte) error {
	return m.Unmarshal(b)
}
func (m *MsgClaim) XXX_Marshal(b []byte, deterministic bool) ([]byte, error) {
	if deterministic {
		return xxx_messageInfo_MsgClaim.Marshal(b, m, deterministic)
	} else {
		b = b[:cap(b)]
		n, err := m.MarshalToSizedBuffer(b)
		if err != nil {
			return nil, err
		}
		return b[:n], nil
	}
}
func (m *MsgClaim) XXX_Merge(src proto.Message) {
	xxx_messageInfo_MsgClaim.Merge(m, src)
}
func (m *MsgClaim) XXX_Size() int {
	return m.Size()
}
func (m *MsgClaim) XXX_DiscardUnknown() {
	xxx_messageInfo_MsgClaim.DiscardUnknown(m)
}

var xxx_messageInfo_MsgClaim proto.InternalMessageInfo

type MsgClaimResponse struct {
	Amount uint64 `protobuf:"varint,1,opt,name=amount,proto3" json:"amount,omitempty" yaml:"amount"`
}

func (m *MsgClaimResponse) Reset()         { *m = MsgClaimResponse{} }
func (m *MsgClaimResponse) String() string { return proto.CompactTextString(m) }
func (*MsgClaimResponse) ProtoMessage()    {}
func (*MsgClaimResponse) Descriptor() ([]byte, []int) {
	return fileDescriptor_2b0828c7de1949a1, []int{1}
}
func (m *MsgClaimResponse) XXX_Unmarshal(b []byte) error {
	return m.Unmarshal(b)
}
func (m *MsgClaimResponse) XXX_Marshal(b []byte, deterministic bool) ([]byte, error) {
	if deterministic {
		return xxx_messageInfo_MsgClaimResponse.Marshal(b, m, deterministic)
	} else {
		b = b[:cap(b)]
		n, err := m.MarshalToSizedBuffer(b)
		if err != nil {
			return nil, err
		}
		return b[:n], nil
	}
}
func (m *MsgClaimResponse) XXX_Merge(src proto.Message) {
	xxx_messageInfo_MsgClaimResponse.Merge(m, src)
}
func (m *MsgClaimResponse) XXX_Size() int {
	return m.Size()
}
func (m *MsgClaimResponse) XXX_DiscardUnknown() {
	xxx_messageInfo_MsgClaimResponse.DiscardUnknown(m)
}

var xxx_messageInfo_MsgClaimResponse proto.InternalMessageInfo

// MsgIncentivePoolSpend represents a message to send coins from one account to another.
type MsgIncentivePoolSpend struct {
	Authority string                                   `protobuf:"bytes,1,opt,name=authority,proto3" json:"authority,omitempty"`
	ToAddress string                                   `protobuf:"bytes,2,opt,name=to_address,json=toAddress,proto3" json:"to_address,omitempty"`
	Amount    github_com_cosmos_cosmos_sdk_types.Coins `protobuf:"bytes,3,rep,name=amount,proto3,castrepeated=github.com/cosmos/cosmos-sdk/types.Coins" json:"amount"`
}

func (m *MsgIncentivePoolSpend) Reset()         { *m = MsgIncentivePoolSpend{} }
func (m *MsgIncentivePoolSpend) String() string { return proto.CompactTextString(m) }
func (*MsgIncentivePoolSpend) ProtoMessage()    {}
func (*MsgIncentivePoolSpend) Descriptor() ([]byte, []int) {
	return fileDescriptor_2b0828c7de1949a1, []int{2}
}
func (m *MsgIncentivePoolSpend) XXX_Unmarshal(b []byte) error {
	return m.Unmarshal(b)
}
func (m *MsgIncentivePoolSpend) XXX_Marshal(b []byte, deterministic bool) ([]byte, error) {
	if deterministic {
		return xxx_messageInfo_MsgIncentivePoolSpend.Marshal(b, m, deterministic)
	} else {
		b = b[:cap(b)]
		n, err := m.MarshalToSizedBuffer(b)
		if err != nil {
			return nil, err
		}
		return b[:n], nil
	}
}
func (m *MsgIncentivePoolSpend) XXX_Merge(src proto.Message) {
	xxx_messageInfo_MsgIncentivePoolSpend.Merge(m, src)
}
func (m *MsgIncentivePoolSpend) XXX_Size() int {
	return m.Size()
}
func (m *MsgIncentivePoolSpend) XXX_DiscardUnknown() {
	xxx_messageInfo_MsgIncentivePoolSpend.DiscardUnknown(m)
}

var xxx_messageInfo_MsgIncentivePoolSpend proto.InternalMessageInfo

// MsgIncentivePoolSpendResponse defines the MsgIncentivePoolSpend response type.
type MsgIncentivePoolSpendResponse struct {
}

func (m *MsgIncentivePoolSpendResponse) Reset()         { *m = MsgIncentivePoolSpendResponse{} }
func (m *MsgIncentivePoolSpendResponse) String() string { return proto.CompactTextString(m) }
func (*MsgIncentivePoolSpendResponse) ProtoMessage()    {}
func (*MsgIncentivePoolSpendResponse) Descriptor() ([]byte, []int) {
	return fileDescriptor_2b0828c7de1949a1, []int{3}
}
func (m *MsgIncentivePoolSpendResponse) XXX_Unmarshal(b []byte) error {
	return m.Unmarshal(b)
}
func (m *MsgIncentivePoolSpendResponse) XXX_Marshal(b []byte, deterministic bool) ([]byte, error) {
	if deterministic {
		return xxx_messageInfo_MsgIncentivePoolSpendResponse.Marshal(b, m, deterministic)
	} else {
		b = b[:cap(b)]
		n, err := m.MarshalToSizedBuffer(b)
		if err != nil {
			return nil, err
		}
		return b[:n], nil
	}
}
func (m *MsgIncentivePoolSpendResponse) XXX_Merge(src proto.Message) {
	xxx_messageInfo_MsgIncentivePoolSpendResponse.Merge(m, src)
}
func (m *MsgIncentivePoolSpendResponse) XXX_Size() int {
	return m.Size()
}
func (m *MsgIncentivePoolSpendResponse) XXX_DiscardUnknown() {
	xxx_messageInfo_MsgIncentivePoolSpendResponse.DiscardUnknown(m)
}

var xxx_messageInfo_MsgIncentivePoolSpendResponse proto.InternalMessageInfo

func init() {
	proto.RegisterType((*MsgClaim)(nil), "quicksilver.airdrop.v1.MsgClaim")
	proto.RegisterType((*MsgClaimResponse)(nil), "quicksilver.airdrop.v1.MsgClaimResponse")
	proto.RegisterType((*MsgIncentivePoolSpend)(nil), "quicksilver.airdrop.v1.MsgIncentivePoolSpend")
	proto.RegisterType((*MsgIncentivePoolSpendResponse)(nil), "quicksilver.airdrop.v1.MsgIncentivePoolSpendResponse")
}

func init() {
	proto.RegisterFile("quicksilver/airdrop/v1/messages.proto", fileDescriptor_2b0828c7de1949a1)
}

var fileDescriptor_2b0828c7de1949a1 = []byte{
	// 659 bytes of a gzipped FileDescriptorProto
	0x1f, 0x8b, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0xff, 0x94, 0x54, 0x3d, 0x6f, 0x13, 0x4d,
	0x10, 0xf6, 0xd9, 0x79, 0xf3, 0xb1, 0xaf, 0xf8, 0x3a, 0x42, 0x70, 0x2c, 0xf0, 0x59, 0x87, 0x22,
	0x19, 0x23, 0xdf, 0xc5, 0x01, 0x82, 0xe4, 0x0e, 0x87, 0x26, 0x45, 0x50, 0xe4, 0x74, 0x34, 0xd6,
	0xfa, 0x6e, 0xd9, 0xac, 0x72, 0xb7, 0x73, 0xdc, 0xae, 0xad, 0xb8, 0x43, 0x91, 0x90, 0x28, 0x91,
	0xf8, 0x03, 0xa9, 0xa9, 0x28, 0x10, 0x3d, 0x5d, 0xca, 0x08, 0x1a, 0x2a, 0x83, 0x12, 0x24, 0xa8,
	0xf3, 0x0b, 0xd0, 0xed, 0xed, 0x39, 0xb6, 0x08, 0x89, 0xa8, 0xbc, 0x37, 0xf3, 0x3c, 0xf3, 0xf1,
	0xcc, 0x8c, 0xd1, 0xd2, 0x8b, 0x1e, 0xf3, 0x76, 0x04, 0x0b, 0xfa, 0x24, 0x76, 0x31, 0x8b, 0xfd,
	0x18, 0x22, 0xb7, 0xdf, 0x70, 0x43, 0x22, 0x04, 0xa6, 0x44, 0x38, 0x51, 0x0c, 0x12, 0xcc, 0x85,
	0x31, 0x98, 0xa3, 0x61, 0x4e, 0xbf, 0x51, 0x2a, 0x7b, 0x20, 0x42, 0x10, 0x6e, 0x17, 0x0b, 0xe2,
	0xf6, 0x1b, 0x5d, 0x22, 0x71, 0xc3, 0xf5, 0x80, 0xf1, 0x94, 0x57, 0xba, 0xa9, 0xfd, 0xa1, 0xa0,
	0x2a, 0xaa, 0xa0, 0xda, 0xb1, 0x98, 0x3a, 0x3a, 0xea, 0xcb, 0x4d, 0x3f, 0xb4, 0x6b, 0x9e, 0x02,
	0x85, 0xd4, 0x9e, 0xbc, 0xb4, 0xf5, 0x16, 0x05, 0xa0, 0x01, 0x71, 0x71, 0xc4, 0x5c, 0xcc, 0x39,
	0x48, 0x2c, 0x19, 0xf0, 0x8c, 0xb3, 0x3c, 0xde, 0x86, 0x17, 0x60, 0x16, 0x8a, 0x10, 0x73, 0x4c,
	0x49, 0x9c, 0xa4, 0x9d, 0x30, 0xa4, 0x0c, 0xfb, 0x55, 0x1e, 0xcd, 0x6e, 0x08, 0xba, 0x96, 0xb8,
	0x4c, 0x07, 0xcd, 0x7a, 0xdb, 0x98, 0xf1, 0x0e, 0xf3, 0x8b, 0x46, 0xc5, 0xa8, 0xce, 0xb5, 0xae,
	0x9f, 0x0c, 0xad, 0x2b, 0x03, 0x1c, 0x06, 0x4d, 0x3b, 0xf3, 0xd8, 0xed, 0x19, 0xf5, 0x5c, 0xf7,
	0xcd, 0xbb, 0x68, 0x1a, 0x7b, 0x49, 0xfe, 0x62, 0xbe, 0x62, 0x54, 0x0b, 0xad, 0x6b, 0x27, 0x43,
	0xeb, 0x52, 0x8a, 0x4e, 0xed, 0x76, 0x5b, 0x03, 0xcc, 0x27, 0x68, 0x06, 0xfb, 0x7e, 0x4c, 0x84,
	0x28, 0x16, 0x54, 0xe4, 0xda, 0xc9, 0xd0, 0xba, 0xac, 0xb1, 0xa9, 0xc3, 0xfe, 0xfc, 0xa1, 0x3e,
	0xaf, 0x25, 0x78, 0x9c, 0x9a, 0xb6, 0x64, 0xcc, 0x38, 0x6d, 0x67, 0x54, 0xf3, 0x29, 0x9a, 0x8e,
	0x62, 0x80, 0xe7, 0xa2, 0x38, 0x55, 0x29, 0x54, 0xff, 0x5f, 0xb9, 0xe3, 0x8c, 0x0f, 0x64, 0xb2,
	0xbf, 0x7e, 0xc3, 0xd9, 0x4c, 0xb0, 0xe3, 0x55, 0xa5, 0x64, 0xbb, 0xad, 0xa3, 0x34, 0x67, 0x5f,
	0xef, 0x5b, 0xb9, 0x5f, 0xfb, 0x56, 0xce, 0x5e, 0x43, 0x57, 0x33, 0x19, 0xda, 0x44, 0x44, 0xc0,
	0x05, 0x51, 0xed, 0x85, 0xd0, 0xe3, 0x52, 0x89, 0x31, 0x35, 0xd1, 0x9e, 0xb2, 0x27, 0xed, 0xa9,
	0x47, 0x73, 0x2a, 0x09, 0x94, 0x88, 0x79, 0x63, 0x43, 0xd0, 0x75, 0xee, 0x11, 0x2e, 0x59, 0x9f,
	0x6c, 0x02, 0x04, 0x5b, 0x11, 0xe1, 0xbe, 0xb9, 0x8a, 0xe6, 0x70, 0x4f, 0x6e, 0x43, 0xcc, 0xe4,
	0x40, 0x4b, 0x5b, 0xfc, 0x6b, 0xbb, 0xa7, 0x50, 0xf3, 0x11, 0x42, 0x12, 0x3a, 0x99, 0x72, 0xf9,
	0x8b, 0x88, 0x12, 0xb4, 0xc1, 0xf4, 0x46, 0xb5, 0x17, 0x94, 0x52, 0x8b, 0x8e, 0x66, 0x24, 0x2b,
	0xea, 0xe8, 0x15, 0x75, 0xd6, 0x80, 0xf1, 0xd6, 0xf2, 0xc1, 0xd0, 0xca, 0xbd, 0xfb, 0x66, 0x55,
	0x29, 0x93, 0xdb, 0xbd, 0xae, 0xe3, 0x41, 0xa8, 0x37, 0x51, 0xff, 0xd4, 0x85, 0xbf, 0xe3, 0xca,
	0x41, 0x44, 0x84, 0x22, 0x88, 0x51, 0xd7, 0x0b, 0x99, 0x7c, 0x7b, 0x3f, 0xdf, 0xd7, 0x4e, 0xab,
	0xb6, 0x2d, 0x74, 0xfb, 0x4c, 0x19, 0x32, 0x65, 0x57, 0x3e, 0xe5, 0x51, 0x61, 0x43, 0x50, 0xf3,
	0xa5, 0x81, 0xfe, 0x4b, 0x57, 0xaf, 0xe2, 0x9c, 0x7d, 0x5a, 0x4e, 0x36, 0x95, 0x52, 0xf5, 0x22,
	0x44, 0x16, 0xdd, 0xbe, 0xb7, 0xf7, 0xe5, 0xc7, 0xdb, 0xfc, 0x92, 0x5d, 0x71, 0xc7, 0xcf, 0x41,
	0xee, 0x26, 0x37, 0x90, 0xdd, 0xb6, 0xda, 0x95, 0xa6, 0x51, 0x33, 0x3f, 0x1a, 0xc8, 0x3c, 0x63,
	0x60, 0xf5, 0x73, 0xb2, 0xfd, 0x09, 0x2f, 0x3d, 0xfc, 0x27, 0xf8, 0xa8, 0xd2, 0xa6, 0xaa, 0xf4,
	0x81, 0xed, 0x9e, 0x53, 0x29, 0xcb, 0xe8, 0x9d, 0x08, 0x20, 0xe8, 0x88, 0x24, 0x40, 0xd3, 0xa8,
	0xb5, 0x36, 0x0f, 0x8e, 0xca, 0xc6, 0xe1, 0x51, 0xd9, 0xf8, 0x7e, 0x54, 0x36, 0xde, 0x1c, 0x97,
	0x73, 0x87, 0xc7, 0xe5, 0xdc, 0xd7, 0xe3, 0x72, 0xee, 0xd9, 0xea, 0xd8, 0x20, 0x19, 0xa7, 0x84,
	0xf7, 0x98, 0x1c, 0xd4, 0xbb, 0x3d, 0x16, 0xf8, 0x13, 0x79, 0x76, 0x47, 0x39, 0xd4, 0x70, 0xbb,
	0xd3, 0xea, 0x2f, 0xe1, 0xfe, 0xef, 0x00, 0x00, 0x00, 0xff, 0xff, 0xb2, 0xf6, 0x4f, 0x1d, 0x0d,
	0x05, 0x00, 0x00,
}

// Reference imports to suppress errors if they are not otherwise used.
var _ context.Context
var _ grpc.ClientConn

// This is a compile-time assertion to ensure that this generated file
// is compatible with the grpc package it is being compiled against.
const _ = grpc.SupportPackageIsVersion4

// MsgClient is the client API for Msg service.
//
// For semantics around ctx use and closing/ending streaming RPCs, please refer to https://godoc.org/google.golang.org/grpc#ClientConn.NewStream.
type MsgClient interface {
	Claim(ctx context.Context, in *MsgClaim, opts ...grpc.CallOption) (*MsgClaimResponse, error)
	IncentivePoolSpend(ctx context.Context, in *MsgIncentivePoolSpend, opts ...grpc.CallOption) (*MsgIncentivePoolSpendResponse, error)
}

type msgClient struct {
	cc grpc1.ClientConn
}

func NewMsgClient(cc grpc1.ClientConn) MsgClient {
	return &msgClient{cc}
}

func (c *msgClient) Claim(ctx context.Context, in *MsgClaim, opts ...grpc.CallOption) (*MsgClaimResponse, error) {
	out := new(MsgClaimResponse)
	err := c.cc.Invoke(ctx, "/quicksilver.airdrop.v1.Msg/Claim", in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *msgClient) IncentivePoolSpend(ctx context.Context, in *MsgIncentivePoolSpend, opts ...grpc.CallOption) (*MsgIncentivePoolSpendResponse, error) {
	out := new(MsgIncentivePoolSpendResponse)
	err := c.cc.Invoke(ctx, "/quicksilver.airdrop.v1.Msg/IncentivePoolSpend", in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

// MsgServer is the server API for Msg service.
type MsgServer interface {
	Claim(context.Context, *MsgClaim) (*MsgClaimResponse, error)
	IncentivePoolSpend(context.Context, *MsgIncentivePoolSpend) (*MsgIncentivePoolSpendResponse, error)
}

// UnimplementedMsgServer can be embedded to have forward compatible implementations.
type UnimplementedMsgServer struct {
}

func (*UnimplementedMsgServer) Claim(ctx context.Context, req *MsgClaim) (*MsgClaimResponse, error) {
	return nil, status.Errorf(codes.Unimplemented, "method Claim not implemented")
}
func (*UnimplementedMsgServer) IncentivePoolSpend(ctx context.Context, req *MsgIncentivePoolSpend) (*MsgIncentivePoolSpendResponse, error) {
	return nil, status.Errorf(codes.Unimplemented, "method IncentivePoolSpend not implemented")
}

func RegisterMsgServer(s grpc1.Server, srv MsgServer) {
	s.RegisterService(&_Msg_serviceDesc, srv)
}

func _Msg_Claim_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(MsgClaim)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(MsgServer).Claim(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: "/quicksilver.airdrop.v1.Msg/Claim",
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(MsgServer).Claim(ctx, req.(*MsgClaim))
	}
	return interceptor(ctx, in, info, handler)
}

func _Msg_IncentivePoolSpend_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(MsgIncentivePoolSpend)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(MsgServer).IncentivePoolSpend(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: "/quicksilver.airdrop.v1.Msg/IncentivePoolSpend",
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(MsgServer).IncentivePoolSpend(ctx, req.(*MsgIncentivePoolSpend))
	}
	return interceptor(ctx, in, info, handler)
}

var _Msg_serviceDesc = grpc.ServiceDesc{
	ServiceName: "quicksilver.airdrop.v1.Msg",
	HandlerType: (*MsgServer)(nil),
	Methods: []grpc.MethodDesc{
		{
			MethodName: "Claim",
			Handler:    _Msg_Claim_Handler,
		},
		{
			MethodName: "IncentivePoolSpend",
			Handler:    _Msg_IncentivePoolSpend_Handler,
		},
	},
	Streams:  []grpc.StreamDesc{},
	Metadata: "quicksilver/airdrop/v1/messages.proto",
}

func (m *MsgClaim) Marshal() (dAtA []byte, err error) {
	size := m.Size()
	dAtA = make([]byte, size)
	n, err := m.MarshalToSizedBuffer(dAtA[:size])
	if err != nil {
		return nil, err
	}
	return dAtA[:n], nil
}

func (m *MsgClaim) MarshalTo(dAtA []byte) (int, error) {
	size := m.Size()
	return m.MarshalToSizedBuffer(dAtA[:size])
}

func (m *MsgClaim) MarshalToSizedBuffer(dAtA []byte) (int, error) {
	i := len(dAtA)
	_ = i
	var l int
	_ = l
	if len(m.Proofs) > 0 {
		for iNdEx := len(m.Proofs) - 1; iNdEx >= 0; iNdEx-- {
			{
				size, err := m.Proofs[iNdEx].MarshalToSizedBuffer(dAtA[:i])
				if err != nil {
					return 0, err
				}
				i -= size
				i = encodeVarintMessages(dAtA, i, uint64(size))
			}
			i--
			dAtA[i] = 0x22
		}
	}
	if len(m.Address) > 0 {
		i -= len(m.Address)
		copy(dAtA[i:], m.Address)
		i = encodeVarintMessages(dAtA, i, uint64(len(m.Address)))
		i--
		dAtA[i] = 0x1a
	}
	if m.Action != 0 {
		i = encodeVarintMessages(dAtA, i, uint64(m.Action))
		i--
		dAtA[i] = 0x10
	}
	if len(m.ChainId) > 0 {
		i -= len(m.ChainId)
		copy(dAtA[i:], m.ChainId)
		i = encodeVarintMessages(dAtA, i, uint64(len(m.ChainId)))
		i--
		dAtA[i] = 0xa
	}
	return len(dAtA) - i, nil
}

func (m *MsgClaimResponse) Marshal() (dAtA []byte, err error) {
	size := m.Size()
	dAtA = make([]byte, size)
	n, err := m.MarshalToSizedBuffer(dAtA[:size])
	if err != nil {
		return nil, err
	}
	return dAtA[:n], nil
}

func (m *MsgClaimResponse) MarshalTo(dAtA []byte) (int, error) {
	size := m.Size()
	return m.MarshalToSizedBuffer(dAtA[:size])
}

func (m *MsgClaimResponse) MarshalToSizedBuffer(dAtA []byte) (int, error) {
	i := len(dAtA)
	_ = i
	var l int
	_ = l
	if m.Amount != 0 {
		i = encodeVarintMessages(dAtA, i, uint64(m.Amount))
		i--
		dAtA[i] = 0x8
	}
	return len(dAtA) - i, nil
}

func (m *MsgIncentivePoolSpend) Marshal() (dAtA []byte, err error) {
	size := m.Size()
	dAtA = make([]byte, size)
	n, err := m.MarshalToSizedBuffer(dAtA[:size])
	if err != nil {
		return nil, err
	}
	return dAtA[:n], nil
}

func (m *MsgIncentivePoolSpend) MarshalTo(dAtA []byte) (int, error) {
	size := m.Size()
	return m.MarshalToSizedBuffer(dAtA[:size])
}

func (m *MsgIncentivePoolSpend) MarshalToSizedBuffer(dAtA []byte) (int, error) {
	i := len(dAtA)
	_ = i
	var l int
	_ = l
	if len(m.Amount) > 0 {
		for iNdEx := len(m.Amount) - 1; iNdEx >= 0; iNdEx-- {
			{
				size, err := m.Amount[iNdEx].MarshalToSizedBuffer(dAtA[:i])
				if err != nil {
					return 0, err
				}
				i -= size
				i = encodeVarintMessages(dAtA, i, uint64(size))
			}
			i--
			dAtA[i] = 0x1a
		}
	}
	if len(m.ToAddress) > 0 {
		i -= len(m.ToAddress)
		copy(dAtA[i:], m.ToAddress)
		i = encodeVarintMessages(dAtA, i, uint64(len(m.ToAddress)))
		i--
		dAtA[i] = 0x12
	}
	if len(m.Authority) > 0 {
		i -= len(m.Authority)
		copy(dAtA[i:], m.Authority)
		i = encodeVarintMessages(dAtA, i, uint64(len(m.Authority)))
		i--
		dAtA[i] = 0xa
	}
	return len(dAtA) - i, nil
}

func (m *MsgIncentivePoolSpendResponse) Marshal() (dAtA []byte, err error) {
	size := m.Size()
	dAtA = make([]byte, size)
	n, err := m.MarshalToSizedBuffer(dAtA[:size])
	if err != nil {
		return nil, err
	}
	return dAtA[:n], nil
}

func (m *MsgIncentivePoolSpendResponse) MarshalTo(dAtA []byte) (int, error) {
	size := m.Size()
	return m.MarshalToSizedBuffer(dAtA[:size])
}

func (m *MsgIncentivePoolSpendResponse) MarshalToSizedBuffer(dAtA []byte) (int, error) {
	i := len(dAtA)
	_ = i
	var l int
	_ = l
	return len(dAtA) - i, nil
}

func encodeVarintMessages(dAtA []byte, offset int, v uint64) int {
	offset -= sovMessages(v)
	base := offset
	for v >= 1<<7 {
		dAtA[offset] = uint8(v&0x7f | 0x80)
		v >>= 7
		offset++
	}
	dAtA[offset] = uint8(v)
	return base
}
func (m *MsgClaim) Size() (n int) {
	if m == nil {
		return 0
	}
	var l int
	_ = l
	l = len(m.ChainId)
	if l > 0 {
		n += 1 + l + sovMessages(uint64(l))
	}
	if m.Action != 0 {
		n += 1 + sovMessages(uint64(m.Action))
	}
	l = len(m.Address)
	if l > 0 {
		n += 1 + l + sovMessages(uint64(l))
	}
	if len(m.Proofs) > 0 {
		for _, e := range m.Proofs {
			l = e.Size()
			n += 1 + l + sovMessages(uint64(l))
		}
	}
	return n
}

func (m *MsgClaimResponse) Size() (n int) {
	if m == nil {
		return 0
	}
	var l int
	_ = l
	if m.Amount != 0 {
		n += 1 + sovMessages(uint64(m.Amount))
	}
	return n
}

func (m *MsgIncentivePoolSpend) Size() (n int) {
	if m == nil {
		return 0
	}
	var l int
	_ = l
	l = len(m.Authority)
	if l > 0 {
		n += 1 + l + sovMessages(uint64(l))
	}
	l = len(m.ToAddress)
	if l > 0 {
		n += 1 + l + sovMessages(uint64(l))
	}
	if len(m.Amount) > 0 {
		for _, e := range m.Amount {
			l = e.Size()
			n += 1 + l + sovMessages(uint64(l))
		}
	}
	return n
}

func (m *MsgIncentivePoolSpendResponse) Size() (n int) {
	if m == nil {
		return 0
	}
	var l int
	_ = l
	return n
}

func sovMessages(x uint64) (n int) {
	return (math_bits.Len64(x|1) + 6) / 7
}
func sozMessages(x uint64) (n int) {
	return sovMessages(uint64((x << 1) ^ uint64((int64(x) >> 63))))
}
func (m *MsgClaim) Unmarshal(dAtA []byte) error {
	l := len(dAtA)
	iNdEx := 0
	for iNdEx < l {
		preIndex := iNdEx
		var wire uint64
		for shift := uint(0); ; shift += 7 {
			if shift >= 64 {
				return ErrIntOverflowMessages
			}
			if iNdEx >= l {
				return io.ErrUnexpectedEOF
			}
			b := dAtA[iNdEx]
			iNdEx++
			wire |= uint64(b&0x7F) << shift
			if b < 0x80 {
				break
			}
		}
		fieldNum := int32(wire >> 3)
		wireType := int(wire & 0x7)
		if wireType == 4 {
			return fmt.Errorf("proto: MsgClaim: wiretype end group for non-group")
		}
		if fieldNum <= 0 {
			return fmt.Errorf("proto: MsgClaim: illegal tag %d (wire type %d)", fieldNum, wire)
		}
		switch fieldNum {
		case 1:
			if wireType != 2 {
				return fmt.Errorf("proto: wrong wireType = %d for field ChainId", wireType)
			}
			var stringLen uint64
			for shift := uint(0); ; shift += 7 {
				if shift >= 64 {
					return ErrIntOverflowMessages
				}
				if iNdEx >= l {
					return io.ErrUnexpectedEOF
				}
				b := dAtA[iNdEx]
				iNdEx++
				stringLen |= uint64(b&0x7F) << shift
				if b < 0x80 {
					break
				}
			}
			intStringLen := int(stringLen)
			if intStringLen < 0 {
				return ErrInvalidLengthMessages
			}
			postIndex := iNdEx + intStringLen
			if postIndex < 0 {
				return ErrInvalidLengthMessages
			}
			if postIndex > l {
				return io.ErrUnexpectedEOF
			}
			m.ChainId = string(dAtA[iNdEx:postIndex])
			iNdEx = postIndex
		case 2:
			if wireType != 0 {
				return fmt.Errorf("proto: wrong wireType = %d for field Action", wireType)
			}
			m.Action = 0
			for shift := uint(0); ; shift += 7 {
				if shift >= 64 {
					return ErrIntOverflowMessages
				}
				if iNdEx >= l {
					return io.ErrUnexpectedEOF
				}
				b := dAtA[iNdEx]
				iNdEx++
				m.Action |= int64(b&0x7F) << shift
				if b < 0x80 {
					break
				}
			}
		case 3:
			if wireType != 2 {
				return fmt.Errorf("proto: wrong wireType = %d for field Address", wireType)
			}
			var stringLen uint64
			for shift := uint(0); ; shift += 7 {
				if shift >= 64 {
					return ErrIntOverflowMessages
				}
				if iNdEx >= l {
					return io.ErrUnexpectedEOF
				}
				b := dAtA[iNdEx]
				iNdEx++
				stringLen |= uint64(b&0x7F) << shift
				if b < 0x80 {
					break
				}
			}
			intStringLen := int(stringLen)
			if intStringLen < 0 {
				return ErrInvalidLengthMessages
			}
			postIndex := iNdEx + intStringLen
			if postIndex < 0 {
				return ErrInvalidLengthMessages
			}
			if postIndex > l {
				return io.ErrUnexpectedEOF
			}
			m.Address = string(dAtA[iNdEx:postIndex])
			iNdEx = postIndex
		case 4:
			if wireType != 2 {
				return fmt.Errorf("proto: wrong wireType = %d for field Proofs", wireType)
			}
			var msglen int
			for shift := uint(0); ; shift += 7 {
				if shift >= 64 {
					return ErrIntOverflowMessages
				}
				if iNdEx >= l {
					return io.ErrUnexpectedEOF
				}
				b := dAtA[iNdEx]
				iNdEx++
				msglen |= int(b&0x7F) << shift
				if b < 0x80 {
					break
				}
			}
			if msglen < 0 {
				return ErrInvalidLengthMessages
			}
			postIndex := iNdEx + msglen
			if postIndex < 0 {
				return ErrInvalidLengthMessages
			}
			if postIndex > l {
				return io.ErrUnexpectedEOF
			}
			m.Proofs = append(m.Proofs, &types.Proof{})
			if err := m.Proofs[len(m.Proofs)-1].Unmarshal(dAtA[iNdEx:postIndex]); err != nil {
				return err
			}
			iNdEx = postIndex
		default:
			iNdEx = preIndex
			skippy, err := skipMessages(dAtA[iNdEx:])
			if err != nil {
				return err
			}
			if (skippy < 0) || (iNdEx+skippy) < 0 {
				return ErrInvalidLengthMessages
			}
			if (iNdEx + skippy) > l {
				return io.ErrUnexpectedEOF
			}
			iNdEx += skippy
		}
	}

	if iNdEx > l {
		return io.ErrUnexpectedEOF
	}
	return nil
}
func (m *MsgClaimResponse) Unmarshal(dAtA []byte) error {
	l := len(dAtA)
	iNdEx := 0
	for iNdEx < l {
		preIndex := iNdEx
		var wire uint64
		for shift := uint(0); ; shift += 7 {
			if shift >= 64 {
				return ErrIntOverflowMessages
			}
			if iNdEx >= l {
				return io.ErrUnexpectedEOF
			}
			b := dAtA[iNdEx]
			iNdEx++
			wire |= uint64(b&0x7F) << shift
			if b < 0x80 {
				break
			}
		}
		fieldNum := int32(wire >> 3)
		wireType := int(wire & 0x7)
		if wireType == 4 {
			return fmt.Errorf("proto: MsgClaimResponse: wiretype end group for non-group")
		}
		if fieldNum <= 0 {
			return fmt.Errorf("proto: MsgClaimResponse: illegal tag %d (wire type %d)", fieldNum, wire)
		}
		switch fieldNum {
		case 1:
			if wireType != 0 {
				return fmt.Errorf("proto: wrong wireType = %d for field Amount", wireType)
			}
			m.Amount = 0
			for shift := uint(0); ; shift += 7 {
				if shift >= 64 {
					return ErrIntOverflowMessages
				}
				if iNdEx >= l {
					return io.ErrUnexpectedEOF
				}
				b := dAtA[iNdEx]
				iNdEx++
				m.Amount |= uint64(b&0x7F) << shift
				if b < 0x80 {
					break
				}
			}
		default:
			iNdEx = preIndex
			skippy, err := skipMessages(dAtA[iNdEx:])
			if err != nil {
				return err
			}
			if (skippy < 0) || (iNdEx+skippy) < 0 {
				return ErrInvalidLengthMessages
			}
			if (iNdEx + skippy) > l {
				return io.ErrUnexpectedEOF
			}
			iNdEx += skippy
		}
	}

	if iNdEx > l {
		return io.ErrUnexpectedEOF
	}
	return nil
}
func (m *MsgIncentivePoolSpend) Unmarshal(dAtA []byte) error {
	l := len(dAtA)
	iNdEx := 0
	for iNdEx < l {
		preIndex := iNdEx
		var wire uint64
		for shift := uint(0); ; shift += 7 {
			if shift >= 64 {
				return ErrIntOverflowMessages
			}
			if iNdEx >= l {
				return io.ErrUnexpectedEOF
			}
			b := dAtA[iNdEx]
			iNdEx++
			wire |= uint64(b&0x7F) << shift
			if b < 0x80 {
				break
			}
		}
		fieldNum := int32(wire >> 3)
		wireType := int(wire & 0x7)
		if wireType == 4 {
			return fmt.Errorf("proto: MsgIncentivePoolSpend: wiretype end group for non-group")
		}
		if fieldNum <= 0 {
			return fmt.Errorf("proto: MsgIncentivePoolSpend: illegal tag %d (wire type %d)", fieldNum, wire)
		}
		switch fieldNum {
		case 1:
			if wireType != 2 {
				return fmt.Errorf("proto: wrong wireType = %d for field Authority", wireType)
			}
			var stringLen uint64
			for shift := uint(0); ; shift += 7 {
				if shift >= 64 {
					return ErrIntOverflowMessages
				}
				if iNdEx >= l {
					return io.ErrUnexpectedEOF
				}
				b := dAtA[iNdEx]
				iNdEx++
				stringLen |= uint64(b&0x7F) << shift
				if b < 0x80 {
					break
				}
			}
			intStringLen := int(stringLen)
			if intStringLen < 0 {
				return ErrInvalidLengthMessages
			}
			postIndex := iNdEx + intStringLen
			if postIndex < 0 {
				return ErrInvalidLengthMessages
			}
			if postIndex > l {
				return io.ErrUnexpectedEOF
			}
			m.Authority = string(dAtA[iNdEx:postIndex])
			iNdEx = postIndex
		case 2:
			if wireType != 2 {
				return fmt.Errorf("proto: wrong wireType = %d for field ToAddress", wireType)
			}
			var stringLen uint64
			for shift := uint(0); ; shift += 7 {
				if shift >= 64 {
					return ErrIntOverflowMessages
				}
				if iNdEx >= l {
					return io.ErrUnexpectedEOF
				}
				b := dAtA[iNdEx]
				iNdEx++
				stringLen |= uint64(b&0x7F) << shift
				if b < 0x80 {
					break
				}
			}
			intStringLen := int(stringLen)
			if intStringLen < 0 {
				return ErrInvalidLengthMessages
			}
			postIndex := iNdEx + intStringLen
			if postIndex < 0 {
				return ErrInvalidLengthMessages
			}
			if postIndex > l {
				return io.ErrUnexpectedEOF
			}
			m.ToAddress = string(dAtA[iNdEx:postIndex])
			iNdEx = postIndex
		case 3:
			if wireType != 2 {
				return fmt.Errorf("proto: wrong wireType = %d for field Amount", wireType)
			}
			var msglen int
			for shift := uint(0); ; shift += 7 {
				if shift >= 64 {
					return ErrIntOverflowMessages
				}
				if iNdEx >= l {
					return io.ErrUnexpectedEOF
				}
				b := dAtA[iNdEx]
				iNdEx++
				msglen |= int(b&0x7F) << shift
				if b < 0x80 {
					break
				}
			}
			if msglen < 0 {
				return ErrInvalidLengthMessages
			}
			postIndex := iNdEx + msglen
			if postIndex < 0 {
				return ErrInvalidLengthMessages
			}
			if postIndex > l {
				return io.ErrUnexpectedEOF
			}
			m.Amount = append(m.Amount, types1.Coin{})
			if err := m.Amount[len(m.Amount)-1].Unmarshal(dAtA[iNdEx:postIndex]); err != nil {
				return err
			}
			iNdEx = postIndex
		default:
			iNdEx = preIndex
			skippy, err := skipMessages(dAtA[iNdEx:])
			if err != nil {
				return err
			}
			if (skippy < 0) || (iNdEx+skippy) < 0 {
				return ErrInvalidLengthMessages
			}
			if (iNdEx + skippy) > l {
				return io.ErrUnexpectedEOF
			}
			iNdEx += skippy
		}
	}

	if iNdEx > l {
		return io.ErrUnexpectedEOF
	}
	return nil
}
func (m *MsgIncentivePoolSpendResponse) Unmarshal(dAtA []byte) error {
	l := len(dAtA)
	iNdEx := 0
	for iNdEx < l {
		preIndex := iNdEx
		var wire uint64
		for shift := uint(0); ; shift += 7 {
			if shift >= 64 {
				return ErrIntOverflowMessages
			}
			if iNdEx >= l {
				return io.ErrUnexpectedEOF
			}
			b := dAtA[iNdEx]
			iNdEx++
			wire |= uint64(b&0x7F) << shift
			if b < 0x80 {
				break
			}
		}
		fieldNum := int32(wire >> 3)
		wireType := int(wire & 0x7)
		if wireType == 4 {
			return fmt.Errorf("proto: MsgIncentivePoolSpendResponse: wiretype end group for non-group")
		}
		if fieldNum <= 0 {
			return fmt.Errorf("proto: MsgIncentivePoolSpendResponse: illegal tag %d (wire type %d)", fieldNum, wire)
		}
		switch fieldNum {
		default:
			iNdEx = preIndex
			skippy, err := skipMessages(dAtA[iNdEx:])
			if err != nil {
				return err
			}
			if (skippy < 0) || (iNdEx+skippy) < 0 {
				return ErrInvalidLengthMessages
			}
			if (iNdEx + skippy) > l {
				return io.ErrUnexpectedEOF
			}
			iNdEx += skippy
		}
	}

	if iNdEx > l {
		return io.ErrUnexpectedEOF
	}
	return nil
}
func skipMessages(dAtA []byte) (n int, err error) {
	l := len(dAtA)
	iNdEx := 0
	depth := 0
	for iNdEx < l {
		var wire uint64
		for shift := uint(0); ; shift += 7 {
			if shift >= 64 {
				return 0, ErrIntOverflowMessages
			}
			if iNdEx >= l {
				return 0, io.ErrUnexpectedEOF
			}
			b := dAtA[iNdEx]
			iNdEx++
			wire |= (uint64(b) & 0x7F) << shift
			if b < 0x80 {
				break
			}
		}
		wireType := int(wire & 0x7)
		switch wireType {
		case 0:
			for shift := uint(0); ; shift += 7 {
				if shift >= 64 {
					return 0, ErrIntOverflowMessages
				}
				if iNdEx >= l {
					return 0, io.ErrUnexpectedEOF
				}
				iNdEx++
				if dAtA[iNdEx-1] < 0x80 {
					break
				}
			}
		case 1:
			iNdEx += 8
		case 2:
			var length int
			for shift := uint(0); ; shift += 7 {
				if shift >= 64 {
					return 0, ErrIntOverflowMessages
				}
				if iNdEx >= l {
					return 0, io.ErrUnexpectedEOF
				}
				b := dAtA[iNdEx]
				iNdEx++
				length |= (int(b) & 0x7F) << shift
				if b < 0x80 {
					break
				}
			}
			if length < 0 {
				return 0, ErrInvalidLengthMessages
			}
			iNdEx += length
		case 3:
			depth++
		case 4:
			if depth == 0 {
				return 0, ErrUnexpectedEndOfGroupMessages
			}
			depth--
		case 5:
			iNdEx += 4
		default:
			return 0, fmt.Errorf("proto: illegal wireType %d", wireType)
		}
		if iNdEx < 0 {
			return 0, ErrInvalidLengthMessages
		}
		if depth == 0 {
			return iNdEx, nil
		}
	}
	return 0, io.ErrUnexpectedEOF
}

var (
	ErrInvalidLengthMessages        = fmt.Errorf("proto: negative length found during unmarshaling")
	ErrIntOverflowMessages          = fmt.Errorf("proto: integer overflow")
	ErrUnexpectedEndOfGroupMessages = fmt.Errorf("proto: unexpected end of group")
)
