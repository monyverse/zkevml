# -*- coding: utf-8 -*-
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: flwr/proto/fleet.proto
"""Generated protocol buffer code."""
from google.protobuf import descriptor as _descriptor
from google.protobuf import descriptor_pool as _descriptor_pool
from google.protobuf import message as _message
from google.protobuf import reflection as _reflection
from google.protobuf import symbol_database as _symbol_database
# @@protoc_insertion_point(imports)

_sym_db = _symbol_database.Default()


from flwr.proto import node_pb2 as flwr_dot_proto_dot_node__pb2
from flwr.proto import task_pb2 as flwr_dot_proto_dot_task__pb2


DESCRIPTOR = _descriptor_pool.Default().AddSerializedFile(b'\n\x16\x66lwr/proto/fleet.proto\x12\nflwr.proto\x1a\x15\x66lwr/proto/node.proto\x1a\x15\x66lwr/proto/task.proto\"F\n\x12PullTaskInsRequest\x12\x1e\n\x04node\x18\x01 \x01(\x0b\x32\x10.flwr.proto.Node\x12\x10\n\x08task_ids\x18\x02 \x03(\t\"k\n\x13PullTaskInsResponse\x12(\n\treconnect\x18\x01 \x01(\x0b\x32\x15.flwr.proto.Reconnect\x12*\n\rtask_ins_list\x18\x02 \x03(\x0b\x32\x13.flwr.proto.TaskIns\"@\n\x12PushTaskResRequest\x12*\n\rtask_res_list\x18\x01 \x03(\x0b\x32\x13.flwr.proto.TaskRes\"\xae\x01\n\x13PushTaskResResponse\x12(\n\treconnect\x18\x01 \x01(\x0b\x32\x15.flwr.proto.Reconnect\x12=\n\x07results\x18\x02 \x03(\x0b\x32,.flwr.proto.PushTaskResResponse.ResultsEntry\x1a.\n\x0cResultsEntry\x12\x0b\n\x03key\x18\x01 \x01(\t\x12\r\n\x05value\x18\x02 \x01(\r:\x02\x38\x01\"\x1e\n\tReconnect\x12\x11\n\treconnect\x18\x01 \x01(\x04\x32\xab\x01\n\x05\x46leet\x12P\n\x0bPullTaskIns\x12\x1e.flwr.proto.PullTaskInsRequest\x1a\x1f.flwr.proto.PullTaskInsResponse\"\x00\x12P\n\x0bPushTaskRes\x12\x1e.flwr.proto.PushTaskResRequest\x1a\x1f.flwr.proto.PushTaskResResponse\"\x00\x62\x06proto3')



_PULLTASKINSREQUEST = DESCRIPTOR.message_types_by_name['PullTaskInsRequest']
_PULLTASKINSRESPONSE = DESCRIPTOR.message_types_by_name['PullTaskInsResponse']
_PUSHTASKRESREQUEST = DESCRIPTOR.message_types_by_name['PushTaskResRequest']
_PUSHTASKRESRESPONSE = DESCRIPTOR.message_types_by_name['PushTaskResResponse']
_PUSHTASKRESRESPONSE_RESULTSENTRY = _PUSHTASKRESRESPONSE.nested_types_by_name['ResultsEntry']
_RECONNECT = DESCRIPTOR.message_types_by_name['Reconnect']
PullTaskInsRequest = _reflection.GeneratedProtocolMessageType('PullTaskInsRequest', (_message.Message,), {
  'DESCRIPTOR' : _PULLTASKINSREQUEST,
  '__module__' : 'flwr.proto.fleet_pb2'
  # @@protoc_insertion_point(class_scope:flwr.proto.PullTaskInsRequest)
  })
_sym_db.RegisterMessage(PullTaskInsRequest)

PullTaskInsResponse = _reflection.GeneratedProtocolMessageType('PullTaskInsResponse', (_message.Message,), {
  'DESCRIPTOR' : _PULLTASKINSRESPONSE,
  '__module__' : 'flwr.proto.fleet_pb2'
  # @@protoc_insertion_point(class_scope:flwr.proto.PullTaskInsResponse)
  })
_sym_db.RegisterMessage(PullTaskInsResponse)

PushTaskResRequest = _reflection.GeneratedProtocolMessageType('PushTaskResRequest', (_message.Message,), {
  'DESCRIPTOR' : _PUSHTASKRESREQUEST,
  '__module__' : 'flwr.proto.fleet_pb2'
  # @@protoc_insertion_point(class_scope:flwr.proto.PushTaskResRequest)
  })
_sym_db.RegisterMessage(PushTaskResRequest)

PushTaskResResponse = _reflection.GeneratedProtocolMessageType('PushTaskResResponse', (_message.Message,), {

  'ResultsEntry' : _reflection.GeneratedProtocolMessageType('ResultsEntry', (_message.Message,), {
    'DESCRIPTOR' : _PUSHTASKRESRESPONSE_RESULTSENTRY,
    '__module__' : 'flwr.proto.fleet_pb2'
    # @@protoc_insertion_point(class_scope:flwr.proto.PushTaskResResponse.ResultsEntry)
    })
  ,
  'DESCRIPTOR' : _PUSHTASKRESRESPONSE,
  '__module__' : 'flwr.proto.fleet_pb2'
  # @@protoc_insertion_point(class_scope:flwr.proto.PushTaskResResponse)
  })
_sym_db.RegisterMessage(PushTaskResResponse)
_sym_db.RegisterMessage(PushTaskResResponse.ResultsEntry)

Reconnect = _reflection.GeneratedProtocolMessageType('Reconnect', (_message.Message,), {
  'DESCRIPTOR' : _RECONNECT,
  '__module__' : 'flwr.proto.fleet_pb2'
  # @@protoc_insertion_point(class_scope:flwr.proto.Reconnect)
  })
_sym_db.RegisterMessage(Reconnect)

_FLEET = DESCRIPTOR.services_by_name['Fleet']
if _descriptor._USE_C_DESCRIPTORS == False:

  DESCRIPTOR._options = None
  _PUSHTASKRESRESPONSE_RESULTSENTRY._options = None
  _PUSHTASKRESRESPONSE_RESULTSENTRY._serialized_options = b'8\001'
  _PULLTASKINSREQUEST._serialized_start=84
  _PULLTASKINSREQUEST._serialized_end=154
  _PULLTASKINSRESPONSE._serialized_start=156
  _PULLTASKINSRESPONSE._serialized_end=263
  _PUSHTASKRESREQUEST._serialized_start=265
  _PUSHTASKRESREQUEST._serialized_end=329
  _PUSHTASKRESRESPONSE._serialized_start=332
  _PUSHTASKRESRESPONSE._serialized_end=506
  _PUSHTASKRESRESPONSE_RESULTSENTRY._serialized_start=460
  _PUSHTASKRESRESPONSE_RESULTSENTRY._serialized_end=506
  _RECONNECT._serialized_start=508
  _RECONNECT._serialized_end=538
  _FLEET._serialized_start=541
  _FLEET._serialized_end=712
# @@protoc_insertion_point(module_scope)
