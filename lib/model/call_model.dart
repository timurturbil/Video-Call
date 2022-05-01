class Call {
  String callerId;
  String callerName;
  String callerPic;
  String callerRole;
  String receiverId;
  String receiverName;
  String receiverPic;
  String receiverRole;
  String channelId;
  bool hasDialled;

  Call({
    this.callerId,
    this.callerName,
    this.callerPic,
    this.callerRole,
    this.receiverId,
    this.receiverName,
    this.receiverPic,
    this.receiverRole,
    this.channelId,
    this.hasDialled,
  });

  // to map
  Map<String, dynamic> toMap(Call call) {
    Map<String, dynamic> callMap = Map();
    callMap["caller_id"] = call.callerId;
    callMap["caller_name"] = call.callerName;
    callMap["caller_pic"] = call.callerPic;
    callMap["caller_role"] = call.callerRole;
    callMap["receiver_id"] = call.receiverId;
    callMap["receiver_name"] = call.receiverName;
    callMap["receiver_pic"] = call.receiverPic;
    callMap["receiver_role"] = call.receiverRole;
    callMap["channel_id"] = call.channelId;
    callMap["has_dialled"] = call.hasDialled;

    return callMap;
  }

  Call.fromMap(Map callMap) {
    this.callerId = callMap["caller_id"];
    this.callerName = callMap["caller_name"];
    this.callerPic = callMap["caller_pic"];
    this.callerRole = callMap["caller_role"];
    this.receiverId = callMap["receiver_id"];
    this.receiverName = callMap["receiver_name"];
    this.receiverPic = callMap["receiver_pic"];
    this.receiverRole = callMap["receiver_role"];
    this.channelId = callMap["channel_id"];
    this.hasDialled = callMap["has_dialled"];
  }
}
