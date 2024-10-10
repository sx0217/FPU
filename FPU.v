module RecFNToRecFN(
  input  [31:0] io_in,
  output [31:0] io_out
);
  assign io_out = io_in; // @[RecFNToRecFN.scala 64:35]
endmodule
module MulFullRawFN(
  input         io_a_isNaN,
  input         io_a_isInf,
  input         io_a_isZero,
  input         io_a_sign,
  input  [9:0]  io_a_sExp,
  input  [23:0] io_a_sig,
  input         io_b_isNaN,
  input         io_b_isInf,
  input         io_b_isZero,
  input         io_b_sign,
  input  [9:0]  io_b_sExp,
  input  [23:0] io_b_sig,
  output        io_invalidExc,
  output        io_rawOut_isNaN,
  output        io_rawOut_isInf,
  output        io_rawOut_isZero,
  output        io_rawOut_sign,
  output [9:0]  io_rawOut_sExp,
  output [45:0] io_rawOut_sig
);
  wire  notSigNaN_invalidExc = io_a_isInf & io_b_isZero | io_a_isZero & io_b_isInf; // @[MulRecFN.scala 58:60]
  wire [9:0] _common_sExpOut_T_2 = $signed(io_a_sExp) + $signed(io_b_sExp); // @[MulRecFN.scala 62:36]
  wire [47:0] _common_sigOut_T = io_a_sig * io_b_sig; // @[MulRecFN.scala 63:35]
  wire  _io_invalidExc_T_2 = io_a_isNaN & ~io_a_sig[21]; // @[common.scala 82:46]
  wire  _io_invalidExc_T_5 = io_b_isNaN & ~io_b_sig[21]; // @[common.scala 82:46]
  assign io_invalidExc = _io_invalidExc_T_2 | _io_invalidExc_T_5 | notSigNaN_invalidExc; // @[MulRecFN.scala 66:71]
  assign io_rawOut_isNaN = io_a_isNaN | io_b_isNaN; // @[MulRecFN.scala 70:35]
  assign io_rawOut_isInf = io_a_isInf | io_b_isInf; // @[MulRecFN.scala 59:38]
  assign io_rawOut_isZero = io_a_isZero | io_b_isZero; // @[MulRecFN.scala 60:40]
  assign io_rawOut_sign = io_a_sign ^ io_b_sign; // @[MulRecFN.scala 61:36]
  assign io_rawOut_sExp = $signed(_common_sExpOut_T_2) - 10'sh100; // @[MulRecFN.scala 62:48]
  assign io_rawOut_sig = _common_sigOut_T[45:0]; // @[MulRecFN.scala 63:46]
endmodule
module MulRawFN(
  input         io_a_isNaN,
  input         io_a_isInf,
  input         io_a_isZero,
  input         io_a_sign,
  input  [9:0]  io_a_sExp,
  input  [23:0] io_a_sig,
  input         io_b_isNaN,
  input         io_b_isInf,
  input         io_b_isZero,
  input         io_b_sign,
  input  [9:0]  io_b_sExp,
  input  [23:0] io_b_sig,
  output        io_invalidExc,
  output        io_rawOut_isNaN,
  output        io_rawOut_isInf,
  output        io_rawOut_isZero,
  output        io_rawOut_sign,
  output [9:0]  io_rawOut_sExp,
  output [25:0] io_rawOut_sig
);
  wire  mulFullRaw_io_a_isNaN; // @[MulRecFN.scala 84:28]
  wire  mulFullRaw_io_a_isInf; // @[MulRecFN.scala 84:28]
  wire  mulFullRaw_io_a_isZero; // @[MulRecFN.scala 84:28]
  wire  mulFullRaw_io_a_sign; // @[MulRecFN.scala 84:28]
  wire [9:0] mulFullRaw_io_a_sExp; // @[MulRecFN.scala 84:28]
  wire [23:0] mulFullRaw_io_a_sig; // @[MulRecFN.scala 84:28]
  wire  mulFullRaw_io_b_isNaN; // @[MulRecFN.scala 84:28]
  wire  mulFullRaw_io_b_isInf; // @[MulRecFN.scala 84:28]
  wire  mulFullRaw_io_b_isZero; // @[MulRecFN.scala 84:28]
  wire  mulFullRaw_io_b_sign; // @[MulRecFN.scala 84:28]
  wire [9:0] mulFullRaw_io_b_sExp; // @[MulRecFN.scala 84:28]
  wire [23:0] mulFullRaw_io_b_sig; // @[MulRecFN.scala 84:28]
  wire  mulFullRaw_io_invalidExc; // @[MulRecFN.scala 84:28]
  wire  mulFullRaw_io_rawOut_isNaN; // @[MulRecFN.scala 84:28]
  wire  mulFullRaw_io_rawOut_isInf; // @[MulRecFN.scala 84:28]
  wire  mulFullRaw_io_rawOut_isZero; // @[MulRecFN.scala 84:28]
  wire  mulFullRaw_io_rawOut_sign; // @[MulRecFN.scala 84:28]
  wire [9:0] mulFullRaw_io_rawOut_sExp; // @[MulRecFN.scala 84:28]
  wire [45:0] mulFullRaw_io_rawOut_sig; // @[MulRecFN.scala 84:28]
  wire  _io_rawOut_sig_T_2 = |mulFullRaw_io_rawOut_sig[20:0]; // @[MulRecFN.scala 93:55]
  MulFullRawFN mulFullRaw ( // @[MulRecFN.scala 84:28]
    .io_a_isNaN(mulFullRaw_io_a_isNaN),
    .io_a_isInf(mulFullRaw_io_a_isInf),
    .io_a_isZero(mulFullRaw_io_a_isZero),
    .io_a_sign(mulFullRaw_io_a_sign),
    .io_a_sExp(mulFullRaw_io_a_sExp),
    .io_a_sig(mulFullRaw_io_a_sig),
    .io_b_isNaN(mulFullRaw_io_b_isNaN),
    .io_b_isInf(mulFullRaw_io_b_isInf),
    .io_b_isZero(mulFullRaw_io_b_isZero),
    .io_b_sign(mulFullRaw_io_b_sign),
    .io_b_sExp(mulFullRaw_io_b_sExp),
    .io_b_sig(mulFullRaw_io_b_sig),
    .io_invalidExc(mulFullRaw_io_invalidExc),
    .io_rawOut_isNaN(mulFullRaw_io_rawOut_isNaN),
    .io_rawOut_isInf(mulFullRaw_io_rawOut_isInf),
    .io_rawOut_isZero(mulFullRaw_io_rawOut_isZero),
    .io_rawOut_sign(mulFullRaw_io_rawOut_sign),
    .io_rawOut_sExp(mulFullRaw_io_rawOut_sExp),
    .io_rawOut_sig(mulFullRaw_io_rawOut_sig)
  );
  assign io_invalidExc = mulFullRaw_io_invalidExc; // @[MulRecFN.scala 89:19]
  assign io_rawOut_isNaN = mulFullRaw_io_rawOut_isNaN; // @[MulRecFN.scala 90:15]
  assign io_rawOut_isInf = mulFullRaw_io_rawOut_isInf; // @[MulRecFN.scala 90:15]
  assign io_rawOut_isZero = mulFullRaw_io_rawOut_isZero; // @[MulRecFN.scala 90:15]
  assign io_rawOut_sign = mulFullRaw_io_rawOut_sign; // @[MulRecFN.scala 90:15]
  assign io_rawOut_sExp = mulFullRaw_io_rawOut_sExp; // @[MulRecFN.scala 90:15]
  assign io_rawOut_sig = {mulFullRaw_io_rawOut_sig[45:21],_io_rawOut_sig_T_2}; // @[Cat.scala 33:92]
  assign mulFullRaw_io_a_isNaN = io_a_isNaN; // @[MulRecFN.scala 86:21]
  assign mulFullRaw_io_a_isInf = io_a_isInf; // @[MulRecFN.scala 86:21]
  assign mulFullRaw_io_a_isZero = io_a_isZero; // @[MulRecFN.scala 86:21]
  assign mulFullRaw_io_a_sign = io_a_sign; // @[MulRecFN.scala 86:21]
  assign mulFullRaw_io_a_sExp = io_a_sExp; // @[MulRecFN.scala 86:21]
  assign mulFullRaw_io_a_sig = io_a_sig; // @[MulRecFN.scala 86:21]
  assign mulFullRaw_io_b_isNaN = io_b_isNaN; // @[MulRecFN.scala 87:21]
  assign mulFullRaw_io_b_isInf = io_b_isInf; // @[MulRecFN.scala 87:21]
  assign mulFullRaw_io_b_isZero = io_b_isZero; // @[MulRecFN.scala 87:21]
  assign mulFullRaw_io_b_sign = io_b_sign; // @[MulRecFN.scala 87:21]
  assign mulFullRaw_io_b_sExp = io_b_sExp; // @[MulRecFN.scala 87:21]
  assign mulFullRaw_io_b_sig = io_b_sig; // @[MulRecFN.scala 87:21]
endmodule
module RoundAnyRawFNToRecFN_ie8_is25_oe8_os23(
  input         io_invalidExc,
  input         io_in_isNaN,
  input         io_in_isInf,
  input         io_in_isZero,
  input         io_in_sign,
  input  [9:0]  io_in_sExp,
  input  [25:0] io_in_sig,
  output [31:0] io_out
);
  wire  doShiftSigDown1 = io_in_sig[25]; // @[RoundAnyRawFNToRecFN.scala 120:57]
  wire [8:0] _roundMask_T_1 = ~io_in_sExp[8:0]; // @[primitives.scala 52:21]
  wire  roundMask_msb = _roundMask_T_1[8]; // @[primitives.scala 58:25]
  wire [7:0] roundMask_lsbs = _roundMask_T_1[7:0]; // @[primitives.scala 59:26]
  wire  roundMask_msb_1 = roundMask_lsbs[7]; // @[primitives.scala 58:25]
  wire [6:0] roundMask_lsbs_1 = roundMask_lsbs[6:0]; // @[primitives.scala 59:26]
  wire  roundMask_msb_2 = roundMask_lsbs_1[6]; // @[primitives.scala 58:25]
  wire [5:0] roundMask_lsbs_2 = roundMask_lsbs_1[5:0]; // @[primitives.scala 59:26]
  wire [64:0] roundMask_shift = 65'sh10000000000000000 >>> roundMask_lsbs_2; // @[primitives.scala 76:56]
  wire [15:0] _GEN_0 = {{8'd0}, roundMask_shift[58:51]}; // @[Bitwise.scala 108:31]
  wire [15:0] _roundMask_T_7 = _GEN_0 & 16'hff; // @[Bitwise.scala 108:31]
  wire [15:0] _roundMask_T_9 = {roundMask_shift[50:43], 8'h0}; // @[Bitwise.scala 108:70]
  wire [15:0] _roundMask_T_11 = _roundMask_T_9 & 16'hff00; // @[Bitwise.scala 108:80]
  wire [15:0] _roundMask_T_12 = _roundMask_T_7 | _roundMask_T_11; // @[Bitwise.scala 108:39]
  wire [15:0] _GEN_1 = {{4'd0}, _roundMask_T_12[15:4]}; // @[Bitwise.scala 108:31]
  wire [15:0] _roundMask_T_17 = _GEN_1 & 16'hf0f; // @[Bitwise.scala 108:31]
  wire [15:0] _roundMask_T_19 = {_roundMask_T_12[11:0], 4'h0}; // @[Bitwise.scala 108:70]
  wire [15:0] _roundMask_T_21 = _roundMask_T_19 & 16'hf0f0; // @[Bitwise.scala 108:80]
  wire [15:0] _roundMask_T_22 = _roundMask_T_17 | _roundMask_T_21; // @[Bitwise.scala 108:39]
  wire [15:0] _GEN_2 = {{2'd0}, _roundMask_T_22[15:2]}; // @[Bitwise.scala 108:31]
  wire [15:0] _roundMask_T_27 = _GEN_2 & 16'h3333; // @[Bitwise.scala 108:31]
  wire [15:0] _roundMask_T_29 = {_roundMask_T_22[13:0], 2'h0}; // @[Bitwise.scala 108:70]
  wire [15:0] _roundMask_T_31 = _roundMask_T_29 & 16'hcccc; // @[Bitwise.scala 108:80]
  wire [15:0] _roundMask_T_32 = _roundMask_T_27 | _roundMask_T_31; // @[Bitwise.scala 108:39]
  wire [15:0] _GEN_3 = {{1'd0}, _roundMask_T_32[15:1]}; // @[Bitwise.scala 108:31]
  wire [15:0] _roundMask_T_37 = _GEN_3 & 16'h5555; // @[Bitwise.scala 108:31]
  wire [15:0] _roundMask_T_39 = {_roundMask_T_32[14:0], 1'h0}; // @[Bitwise.scala 108:70]
  wire [15:0] _roundMask_T_41 = _roundMask_T_39 & 16'haaaa; // @[Bitwise.scala 108:80]
  wire [15:0] _roundMask_T_42 = _roundMask_T_37 | _roundMask_T_41; // @[Bitwise.scala 108:39]
  wire [20:0] _roundMask_T_56 = {_roundMask_T_42,roundMask_shift[59],roundMask_shift[60],roundMask_shift[61],
    roundMask_shift[62],roundMask_shift[63]}; // @[Cat.scala 33:92]
  wire [20:0] _roundMask_T_57 = ~_roundMask_T_56; // @[primitives.scala 73:32]
  wire [20:0] _roundMask_T_58 = roundMask_msb_2 ? 21'h0 : _roundMask_T_57; // @[primitives.scala 73:21]
  wire [20:0] _roundMask_T_59 = ~_roundMask_T_58; // @[primitives.scala 73:17]
  wire [23:0] _roundMask_T_60 = {_roundMask_T_59,3'h7}; // @[primitives.scala 68:58]
  wire [2:0] _roundMask_T_67 = {roundMask_shift[0],roundMask_shift[1],roundMask_shift[2]}; // @[Cat.scala 33:92]
  wire [2:0] _roundMask_T_68 = roundMask_msb_2 ? _roundMask_T_67 : 3'h0; // @[primitives.scala 62:24]
  wire [23:0] _roundMask_T_69 = roundMask_msb_1 ? _roundMask_T_60 : {{21'd0}, _roundMask_T_68}; // @[primitives.scala 67:24]
  wire [23:0] _roundMask_T_70 = roundMask_msb ? _roundMask_T_69 : 24'h0; // @[primitives.scala 62:24]
  wire [23:0] _GEN_4 = {{23'd0}, doShiftSigDown1}; // @[RoundAnyRawFNToRecFN.scala 159:23]
  wire [23:0] _roundMask_T_71 = _roundMask_T_70 | _GEN_4; // @[RoundAnyRawFNToRecFN.scala 159:23]
  wire [25:0] roundMask = {_roundMask_T_71,2'h3}; // @[RoundAnyRawFNToRecFN.scala 159:42]
  wire [26:0] _shiftedRoundMask_T = {1'h0,_roundMask_T_71,2'h3}; // @[RoundAnyRawFNToRecFN.scala 162:41]
  wire [25:0] shiftedRoundMask = _shiftedRoundMask_T[26:1]; // @[RoundAnyRawFNToRecFN.scala 162:53]
  wire [25:0] _roundPosMask_T = ~shiftedRoundMask; // @[RoundAnyRawFNToRecFN.scala 163:28]
  wire [25:0] roundPosMask = _roundPosMask_T & roundMask; // @[RoundAnyRawFNToRecFN.scala 163:46]
  wire [25:0] _roundPosBit_T = io_in_sig & roundPosMask; // @[RoundAnyRawFNToRecFN.scala 164:40]
  wire  roundPosBit = |_roundPosBit_T; // @[RoundAnyRawFNToRecFN.scala 164:56]
  wire [25:0] _anyRoundExtra_T = io_in_sig & shiftedRoundMask; // @[RoundAnyRawFNToRecFN.scala 165:42]
  wire  anyRoundExtra = |_anyRoundExtra_T; // @[RoundAnyRawFNToRecFN.scala 165:62]
  wire [25:0] _roundedSig_T = io_in_sig | roundMask; // @[RoundAnyRawFNToRecFN.scala 174:32]
  wire [24:0] _roundedSig_T_2 = _roundedSig_T[25:2] + 24'h1; // @[RoundAnyRawFNToRecFN.scala 174:49]
  wire  _roundedSig_T_4 = ~anyRoundExtra; // @[RoundAnyRawFNToRecFN.scala 176:30]
  wire [24:0] _roundedSig_T_7 = roundPosBit & _roundedSig_T_4 ? roundMask[25:1] : 25'h0; // @[RoundAnyRawFNToRecFN.scala 175:25]
  wire [24:0] _roundedSig_T_8 = ~_roundedSig_T_7; // @[RoundAnyRawFNToRecFN.scala 175:21]
  wire [24:0] _roundedSig_T_9 = _roundedSig_T_2 & _roundedSig_T_8; // @[RoundAnyRawFNToRecFN.scala 174:57]
  wire [25:0] _roundedSig_T_10 = ~roundMask; // @[RoundAnyRawFNToRecFN.scala 180:32]
  wire [25:0] _roundedSig_T_11 = io_in_sig & _roundedSig_T_10; // @[RoundAnyRawFNToRecFN.scala 180:30]
  wire [24:0] _roundedSig_T_16 = {{1'd0}, _roundedSig_T_11[25:2]}; // @[RoundAnyRawFNToRecFN.scala 180:47]
  wire [24:0] roundedSig = roundPosBit ? _roundedSig_T_9 : _roundedSig_T_16; // @[RoundAnyRawFNToRecFN.scala 173:16]
  wire [2:0] _sRoundedExp_T_1 = {1'b0,$signed(roundedSig[24:23])}; // @[RoundAnyRawFNToRecFN.scala 185:76]
  wire [9:0] _GEN_5 = {{7{_sRoundedExp_T_1[2]}},_sRoundedExp_T_1}; // @[RoundAnyRawFNToRecFN.scala 185:40]
  wire [10:0] sRoundedExp = $signed(io_in_sExp) + $signed(_GEN_5); // @[RoundAnyRawFNToRecFN.scala 185:40]
  wire [8:0] common_expOut = sRoundedExp[8:0]; // @[RoundAnyRawFNToRecFN.scala 187:37]
  wire [21:0] common_fractOut = doShiftSigDown1 ? roundedSig[22:1] : roundedSig[21:0]; // @[RoundAnyRawFNToRecFN.scala 189:16]
  wire [3:0] _common_overflow_T = sRoundedExp[10:7]; // @[RoundAnyRawFNToRecFN.scala 196:30]
  wire  common_overflow = $signed(_common_overflow_T) >= 4'sh3; // @[RoundAnyRawFNToRecFN.scala 196:50]
  wire  common_totalUnderflow = $signed(sRoundedExp) < 11'sh6c; // @[RoundAnyRawFNToRecFN.scala 200:31]
  wire  isNaNOut = io_invalidExc | io_in_isNaN; // @[RoundAnyRawFNToRecFN.scala 235:34]
  wire  commonCase = ~isNaNOut & ~io_in_isInf & ~io_in_isZero; // @[RoundAnyRawFNToRecFN.scala 237:61]
  wire  overflow = commonCase & common_overflow; // @[RoundAnyRawFNToRecFN.scala 238:32]
  wire  notNaN_isInfOut = io_in_isInf | overflow; // @[RoundAnyRawFNToRecFN.scala 248:32]
  wire  signOut = isNaNOut ? 1'h0 : io_in_sign; // @[RoundAnyRawFNToRecFN.scala 250:22]
  wire [8:0] _expOut_T_1 = io_in_isZero | common_totalUnderflow ? 9'h1c0 : 9'h0; // @[RoundAnyRawFNToRecFN.scala 253:18]
  wire [8:0] _expOut_T_2 = ~_expOut_T_1; // @[RoundAnyRawFNToRecFN.scala 253:14]
  wire [8:0] _expOut_T_3 = common_expOut & _expOut_T_2; // @[RoundAnyRawFNToRecFN.scala 252:24]
  wire [8:0] _expOut_T_11 = notNaN_isInfOut ? 9'h40 : 9'h0; // @[RoundAnyRawFNToRecFN.scala 265:18]
  wire [8:0] _expOut_T_12 = ~_expOut_T_11; // @[RoundAnyRawFNToRecFN.scala 265:14]
  wire [8:0] _expOut_T_13 = _expOut_T_3 & _expOut_T_12; // @[RoundAnyRawFNToRecFN.scala 264:17]
  wire [8:0] _expOut_T_18 = notNaN_isInfOut ? 9'h180 : 9'h0; // @[RoundAnyRawFNToRecFN.scala 277:16]
  wire [8:0] _expOut_T_19 = _expOut_T_13 | _expOut_T_18; // @[RoundAnyRawFNToRecFN.scala 276:15]
  wire [8:0] _expOut_T_20 = isNaNOut ? 9'h1c0 : 9'h0; // @[RoundAnyRawFNToRecFN.scala 278:16]
  wire [8:0] expOut = _expOut_T_19 | _expOut_T_20; // @[RoundAnyRawFNToRecFN.scala 277:73]
  wire [21:0] _fractOut_T_2 = isNaNOut ? 22'h200000 : 22'h0; // @[RoundAnyRawFNToRecFN.scala 281:16]
  wire [21:0] fractOut = isNaNOut | io_in_isZero | common_totalUnderflow ? _fractOut_T_2 : common_fractOut; // @[RoundAnyRawFNToRecFN.scala 280:12]
  wire [9:0] _io_out_T = {signOut,expOut}; // @[RoundAnyRawFNToRecFN.scala 286:23]
  assign io_out = {_io_out_T,fractOut}; // @[RoundAnyRawFNToRecFN.scala 286:33]
endmodule
module RoundRawFNToRecFN_e8_s23(
  input         io_invalidExc,
  input         io_in_isNaN,
  input         io_in_isInf,
  input         io_in_isZero,
  input         io_in_sign,
  input  [9:0]  io_in_sExp,
  input  [25:0] io_in_sig,
  output [31:0] io_out
);
  wire  roundAnyRawFNToRecFN_io_invalidExc; // @[RoundAnyRawFNToRecFN.scala 310:15]
  wire  roundAnyRawFNToRecFN_io_in_isNaN; // @[RoundAnyRawFNToRecFN.scala 310:15]
  wire  roundAnyRawFNToRecFN_io_in_isInf; // @[RoundAnyRawFNToRecFN.scala 310:15]
  wire  roundAnyRawFNToRecFN_io_in_isZero; // @[RoundAnyRawFNToRecFN.scala 310:15]
  wire  roundAnyRawFNToRecFN_io_in_sign; // @[RoundAnyRawFNToRecFN.scala 310:15]
  wire [9:0] roundAnyRawFNToRecFN_io_in_sExp; // @[RoundAnyRawFNToRecFN.scala 310:15]
  wire [25:0] roundAnyRawFNToRecFN_io_in_sig; // @[RoundAnyRawFNToRecFN.scala 310:15]
  wire [31:0] roundAnyRawFNToRecFN_io_out; // @[RoundAnyRawFNToRecFN.scala 310:15]
  RoundAnyRawFNToRecFN_ie8_is25_oe8_os23 roundAnyRawFNToRecFN ( // @[RoundAnyRawFNToRecFN.scala 310:15]
    .io_invalidExc(roundAnyRawFNToRecFN_io_invalidExc),
    .io_in_isNaN(roundAnyRawFNToRecFN_io_in_isNaN),
    .io_in_isInf(roundAnyRawFNToRecFN_io_in_isInf),
    .io_in_isZero(roundAnyRawFNToRecFN_io_in_isZero),
    .io_in_sign(roundAnyRawFNToRecFN_io_in_sign),
    .io_in_sExp(roundAnyRawFNToRecFN_io_in_sExp),
    .io_in_sig(roundAnyRawFNToRecFN_io_in_sig),
    .io_out(roundAnyRawFNToRecFN_io_out)
  );
  assign io_out = roundAnyRawFNToRecFN_io_out; // @[RoundAnyRawFNToRecFN.scala 318:23]
  assign roundAnyRawFNToRecFN_io_invalidExc = io_invalidExc; // @[RoundAnyRawFNToRecFN.scala 313:44]
  assign roundAnyRawFNToRecFN_io_in_isNaN = io_in_isNaN; // @[RoundAnyRawFNToRecFN.scala 315:44]
  assign roundAnyRawFNToRecFN_io_in_isInf = io_in_isInf; // @[RoundAnyRawFNToRecFN.scala 315:44]
  assign roundAnyRawFNToRecFN_io_in_isZero = io_in_isZero; // @[RoundAnyRawFNToRecFN.scala 315:44]
  assign roundAnyRawFNToRecFN_io_in_sign = io_in_sign; // @[RoundAnyRawFNToRecFN.scala 315:44]
  assign roundAnyRawFNToRecFN_io_in_sExp = io_in_sExp; // @[RoundAnyRawFNToRecFN.scala 315:44]
  assign roundAnyRawFNToRecFN_io_in_sig = io_in_sig; // @[RoundAnyRawFNToRecFN.scala 315:44]
endmodule
module MulRecFN(
  input  [31:0] io_a,
  input  [31:0] io_b,
  output [31:0] io_out
);
  wire  mulRawFN__io_a_isNaN; // @[MulRecFN.scala 113:26]
  wire  mulRawFN__io_a_isInf; // @[MulRecFN.scala 113:26]
  wire  mulRawFN__io_a_isZero; // @[MulRecFN.scala 113:26]
  wire  mulRawFN__io_a_sign; // @[MulRecFN.scala 113:26]
  wire [9:0] mulRawFN__io_a_sExp; // @[MulRecFN.scala 113:26]
  wire [23:0] mulRawFN__io_a_sig; // @[MulRecFN.scala 113:26]
  wire  mulRawFN__io_b_isNaN; // @[MulRecFN.scala 113:26]
  wire  mulRawFN__io_b_isInf; // @[MulRecFN.scala 113:26]
  wire  mulRawFN__io_b_isZero; // @[MulRecFN.scala 113:26]
  wire  mulRawFN__io_b_sign; // @[MulRecFN.scala 113:26]
  wire [9:0] mulRawFN__io_b_sExp; // @[MulRecFN.scala 113:26]
  wire [23:0] mulRawFN__io_b_sig; // @[MulRecFN.scala 113:26]
  wire  mulRawFN__io_invalidExc; // @[MulRecFN.scala 113:26]
  wire  mulRawFN__io_rawOut_isNaN; // @[MulRecFN.scala 113:26]
  wire  mulRawFN__io_rawOut_isInf; // @[MulRecFN.scala 113:26]
  wire  mulRawFN__io_rawOut_isZero; // @[MulRecFN.scala 113:26]
  wire  mulRawFN__io_rawOut_sign; // @[MulRecFN.scala 113:26]
  wire [9:0] mulRawFN__io_rawOut_sExp; // @[MulRecFN.scala 113:26]
  wire [25:0] mulRawFN__io_rawOut_sig; // @[MulRecFN.scala 113:26]
  wire  roundRawFNToRecFN_io_invalidExc; // @[MulRecFN.scala 121:15]
  wire  roundRawFNToRecFN_io_in_isNaN; // @[MulRecFN.scala 121:15]
  wire  roundRawFNToRecFN_io_in_isInf; // @[MulRecFN.scala 121:15]
  wire  roundRawFNToRecFN_io_in_isZero; // @[MulRecFN.scala 121:15]
  wire  roundRawFNToRecFN_io_in_sign; // @[MulRecFN.scala 121:15]
  wire [9:0] roundRawFNToRecFN_io_in_sExp; // @[MulRecFN.scala 121:15]
  wire [25:0] roundRawFNToRecFN_io_in_sig; // @[MulRecFN.scala 121:15]
  wire [31:0] roundRawFNToRecFN_io_out; // @[MulRecFN.scala 121:15]
  wire [8:0] mulRawFN_io_a_exp = io_a[30:22]; // @[rawFloatFromRecFN.scala 51:21]
  wire  mulRawFN_io_a_isZero = mulRawFN_io_a_exp[8:6] == 3'h0; // @[rawFloatFromRecFN.scala 52:53]
  wire  mulRawFN_io_a_isSpecial = mulRawFN_io_a_exp[8:7] == 2'h3; // @[rawFloatFromRecFN.scala 53:53]
  wire  _mulRawFN_io_a_out_sig_T = ~mulRawFN_io_a_isZero; // @[rawFloatFromRecFN.scala 61:35]
  wire [1:0] _mulRawFN_io_a_out_sig_T_1 = {1'h0,_mulRawFN_io_a_out_sig_T}; // @[rawFloatFromRecFN.scala 61:32]
  wire [8:0] mulRawFN_io_b_exp = io_b[30:22]; // @[rawFloatFromRecFN.scala 51:21]
  wire  mulRawFN_io_b_isZero = mulRawFN_io_b_exp[8:6] == 3'h0; // @[rawFloatFromRecFN.scala 52:53]
  wire  mulRawFN_io_b_isSpecial = mulRawFN_io_b_exp[8:7] == 2'h3; // @[rawFloatFromRecFN.scala 53:53]
  wire  _mulRawFN_io_b_out_sig_T = ~mulRawFN_io_b_isZero; // @[rawFloatFromRecFN.scala 61:35]
  wire [1:0] _mulRawFN_io_b_out_sig_T_1 = {1'h0,_mulRawFN_io_b_out_sig_T}; // @[rawFloatFromRecFN.scala 61:32]
  MulRawFN mulRawFN_ ( // @[MulRecFN.scala 113:26]
    .io_a_isNaN(mulRawFN__io_a_isNaN),
    .io_a_isInf(mulRawFN__io_a_isInf),
    .io_a_isZero(mulRawFN__io_a_isZero),
    .io_a_sign(mulRawFN__io_a_sign),
    .io_a_sExp(mulRawFN__io_a_sExp),
    .io_a_sig(mulRawFN__io_a_sig),
    .io_b_isNaN(mulRawFN__io_b_isNaN),
    .io_b_isInf(mulRawFN__io_b_isInf),
    .io_b_isZero(mulRawFN__io_b_isZero),
    .io_b_sign(mulRawFN__io_b_sign),
    .io_b_sExp(mulRawFN__io_b_sExp),
    .io_b_sig(mulRawFN__io_b_sig),
    .io_invalidExc(mulRawFN__io_invalidExc),
    .io_rawOut_isNaN(mulRawFN__io_rawOut_isNaN),
    .io_rawOut_isInf(mulRawFN__io_rawOut_isInf),
    .io_rawOut_isZero(mulRawFN__io_rawOut_isZero),
    .io_rawOut_sign(mulRawFN__io_rawOut_sign),
    .io_rawOut_sExp(mulRawFN__io_rawOut_sExp),
    .io_rawOut_sig(mulRawFN__io_rawOut_sig)
  );
  RoundRawFNToRecFN_e8_s23 roundRawFNToRecFN ( // @[MulRecFN.scala 121:15]
    .io_invalidExc(roundRawFNToRecFN_io_invalidExc),
    .io_in_isNaN(roundRawFNToRecFN_io_in_isNaN),
    .io_in_isInf(roundRawFNToRecFN_io_in_isInf),
    .io_in_isZero(roundRawFNToRecFN_io_in_isZero),
    .io_in_sign(roundRawFNToRecFN_io_in_sign),
    .io_in_sExp(roundRawFNToRecFN_io_in_sExp),
    .io_in_sig(roundRawFNToRecFN_io_in_sig),
    .io_out(roundRawFNToRecFN_io_out)
  );
  assign io_out = roundRawFNToRecFN_io_out; // @[MulRecFN.scala 127:23]
  assign mulRawFN__io_a_isNaN = mulRawFN_io_a_isSpecial & mulRawFN_io_a_exp[6]; // @[rawFloatFromRecFN.scala 56:33]
  assign mulRawFN__io_a_isInf = mulRawFN_io_a_isSpecial & ~mulRawFN_io_a_exp[6]; // @[rawFloatFromRecFN.scala 57:33]
  assign mulRawFN__io_a_isZero = mulRawFN_io_a_exp[8:6] == 3'h0; // @[rawFloatFromRecFN.scala 52:53]
  assign mulRawFN__io_a_sign = io_a[31]; // @[rawFloatFromRecFN.scala 59:25]
  assign mulRawFN__io_a_sExp = {1'b0,$signed(mulRawFN_io_a_exp)}; // @[rawFloatFromRecFN.scala 60:27]
  assign mulRawFN__io_a_sig = {_mulRawFN_io_a_out_sig_T_1,io_a[21:0]}; // @[rawFloatFromRecFN.scala 61:44]
  assign mulRawFN__io_b_isNaN = mulRawFN_io_b_isSpecial & mulRawFN_io_b_exp[6]; // @[rawFloatFromRecFN.scala 56:33]
  assign mulRawFN__io_b_isInf = mulRawFN_io_b_isSpecial & ~mulRawFN_io_b_exp[6]; // @[rawFloatFromRecFN.scala 57:33]
  assign mulRawFN__io_b_isZero = mulRawFN_io_b_exp[8:6] == 3'h0; // @[rawFloatFromRecFN.scala 52:53]
  assign mulRawFN__io_b_sign = io_b[31]; // @[rawFloatFromRecFN.scala 59:25]
  assign mulRawFN__io_b_sExp = {1'b0,$signed(mulRawFN_io_b_exp)}; // @[rawFloatFromRecFN.scala 60:27]
  assign mulRawFN__io_b_sig = {_mulRawFN_io_b_out_sig_T_1,io_b[21:0]}; // @[rawFloatFromRecFN.scala 61:44]
  assign roundRawFNToRecFN_io_invalidExc = mulRawFN__io_invalidExc; // @[MulRecFN.scala 122:39]
  assign roundRawFNToRecFN_io_in_isNaN = mulRawFN__io_rawOut_isNaN; // @[MulRecFN.scala 124:39]
  assign roundRawFNToRecFN_io_in_isInf = mulRawFN__io_rawOut_isInf; // @[MulRecFN.scala 124:39]
  assign roundRawFNToRecFN_io_in_isZero = mulRawFN__io_rawOut_isZero; // @[MulRecFN.scala 124:39]
  assign roundRawFNToRecFN_io_in_sign = mulRawFN__io_rawOut_sign; // @[MulRecFN.scala 124:39]
  assign roundRawFNToRecFN_io_in_sExp = mulRawFN__io_rawOut_sExp; // @[MulRecFN.scala 124:39]
  assign roundRawFNToRecFN_io_in_sig = mulRawFN__io_rawOut_sig; // @[MulRecFN.scala 124:39]
endmodule
module FPU(
  input         clock,
  input         reset,
  input  [30:0] io_a_bits,
  input  [30:0] io_b_bits,
  output [30:0] io_out_bits
);
  wire [31:0] floatMul_t_resizer_io_in; // @[Arithmetic.scala 337:32]
  wire [31:0] floatMul_t_resizer_io_out; // @[Arithmetic.scala 337:32]
  wire [31:0] floatMul_muladder_io_a; // @[Arithmetic.scala 343:30]
  wire [31:0] floatMul_muladder_io_b; // @[Arithmetic.scala 343:30]
  wire [31:0] floatMul_muladder_io_out; // @[Arithmetic.scala 343:30]
  wire  floatMul_t_rec_rawIn_sign = io_b_bits[30]; // @[rawFloatFromFN.scala 44:18]
  wire [7:0] floatMul_t_rec_rawIn_expIn = io_b_bits[29:22]; // @[rawFloatFromFN.scala 45:19]
  wire [21:0] floatMul_t_rec_rawIn_fractIn = io_b_bits[21:0]; // @[rawFloatFromFN.scala 46:21]
  wire  floatMul_t_rec_rawIn_isZeroExpIn = floatMul_t_rec_rawIn_expIn == 8'h0; // @[rawFloatFromFN.scala 48:30]
  wire  floatMul_t_rec_rawIn_isZeroFractIn = floatMul_t_rec_rawIn_fractIn == 22'h0; // @[rawFloatFromFN.scala 49:34]
  wire [4:0] _floatMul_t_rec_rawIn_normDist_T_22 = floatMul_t_rec_rawIn_fractIn[1] ? 5'h14 : 5'h15; // @[Mux.scala 47:70]
  wire [4:0] _floatMul_t_rec_rawIn_normDist_T_23 = floatMul_t_rec_rawIn_fractIn[2] ? 5'h13 :
    _floatMul_t_rec_rawIn_normDist_T_22; // @[Mux.scala 47:70]
  wire [4:0] _floatMul_t_rec_rawIn_normDist_T_24 = floatMul_t_rec_rawIn_fractIn[3] ? 5'h12 :
    _floatMul_t_rec_rawIn_normDist_T_23; // @[Mux.scala 47:70]
  wire [4:0] _floatMul_t_rec_rawIn_normDist_T_25 = floatMul_t_rec_rawIn_fractIn[4] ? 5'h11 :
    _floatMul_t_rec_rawIn_normDist_T_24; // @[Mux.scala 47:70]
  wire [4:0] _floatMul_t_rec_rawIn_normDist_T_26 = floatMul_t_rec_rawIn_fractIn[5] ? 5'h10 :
    _floatMul_t_rec_rawIn_normDist_T_25; // @[Mux.scala 47:70]
  wire [4:0] _floatMul_t_rec_rawIn_normDist_T_27 = floatMul_t_rec_rawIn_fractIn[6] ? 5'hf :
    _floatMul_t_rec_rawIn_normDist_T_26; // @[Mux.scala 47:70]
  wire [4:0] _floatMul_t_rec_rawIn_normDist_T_28 = floatMul_t_rec_rawIn_fractIn[7] ? 5'he :
    _floatMul_t_rec_rawIn_normDist_T_27; // @[Mux.scala 47:70]
  wire [4:0] _floatMul_t_rec_rawIn_normDist_T_29 = floatMul_t_rec_rawIn_fractIn[8] ? 5'hd :
    _floatMul_t_rec_rawIn_normDist_T_28; // @[Mux.scala 47:70]
  wire [4:0] _floatMul_t_rec_rawIn_normDist_T_30 = floatMul_t_rec_rawIn_fractIn[9] ? 5'hc :
    _floatMul_t_rec_rawIn_normDist_T_29; // @[Mux.scala 47:70]
  wire [4:0] _floatMul_t_rec_rawIn_normDist_T_31 = floatMul_t_rec_rawIn_fractIn[10] ? 5'hb :
    _floatMul_t_rec_rawIn_normDist_T_30; // @[Mux.scala 47:70]
  wire [4:0] _floatMul_t_rec_rawIn_normDist_T_32 = floatMul_t_rec_rawIn_fractIn[11] ? 5'ha :
    _floatMul_t_rec_rawIn_normDist_T_31; // @[Mux.scala 47:70]
  wire [4:0] _floatMul_t_rec_rawIn_normDist_T_33 = floatMul_t_rec_rawIn_fractIn[12] ? 5'h9 :
    _floatMul_t_rec_rawIn_normDist_T_32; // @[Mux.scala 47:70]
  wire [4:0] _floatMul_t_rec_rawIn_normDist_T_34 = floatMul_t_rec_rawIn_fractIn[13] ? 5'h8 :
    _floatMul_t_rec_rawIn_normDist_T_33; // @[Mux.scala 47:70]
  wire [4:0] _floatMul_t_rec_rawIn_normDist_T_35 = floatMul_t_rec_rawIn_fractIn[14] ? 5'h7 :
    _floatMul_t_rec_rawIn_normDist_T_34; // @[Mux.scala 47:70]
  wire [4:0] _floatMul_t_rec_rawIn_normDist_T_36 = floatMul_t_rec_rawIn_fractIn[15] ? 5'h6 :
    _floatMul_t_rec_rawIn_normDist_T_35; // @[Mux.scala 47:70]
  wire [4:0] _floatMul_t_rec_rawIn_normDist_T_37 = floatMul_t_rec_rawIn_fractIn[16] ? 5'h5 :
    _floatMul_t_rec_rawIn_normDist_T_36; // @[Mux.scala 47:70]
  wire [4:0] _floatMul_t_rec_rawIn_normDist_T_38 = floatMul_t_rec_rawIn_fractIn[17] ? 5'h4 :
    _floatMul_t_rec_rawIn_normDist_T_37; // @[Mux.scala 47:70]
  wire [4:0] _floatMul_t_rec_rawIn_normDist_T_39 = floatMul_t_rec_rawIn_fractIn[18] ? 5'h3 :
    _floatMul_t_rec_rawIn_normDist_T_38; // @[Mux.scala 47:70]
  wire [4:0] _floatMul_t_rec_rawIn_normDist_T_40 = floatMul_t_rec_rawIn_fractIn[19] ? 5'h2 :
    _floatMul_t_rec_rawIn_normDist_T_39; // @[Mux.scala 47:70]
  wire [4:0] _floatMul_t_rec_rawIn_normDist_T_41 = floatMul_t_rec_rawIn_fractIn[20] ? 5'h1 :
    _floatMul_t_rec_rawIn_normDist_T_40; // @[Mux.scala 47:70]
  wire [4:0] floatMul_t_rec_rawIn_normDist = floatMul_t_rec_rawIn_fractIn[21] ? 5'h0 :
    _floatMul_t_rec_rawIn_normDist_T_41; // @[Mux.scala 47:70]
  wire [52:0] _GEN_8 = {{31'd0}, floatMul_t_rec_rawIn_fractIn}; // @[rawFloatFromFN.scala 52:33]
  wire [52:0] _floatMul_t_rec_rawIn_subnormFract_T = _GEN_8 << floatMul_t_rec_rawIn_normDist; // @[rawFloatFromFN.scala 52:33]
  wire [21:0] floatMul_t_rec_rawIn_subnormFract = {_floatMul_t_rec_rawIn_subnormFract_T[20:0], 1'h0}; // @[rawFloatFromFN.scala 52:64]
  wire [8:0] _GEN_0 = {{4'd0}, floatMul_t_rec_rawIn_normDist}; // @[rawFloatFromFN.scala 55:18]
  wire [8:0] _floatMul_t_rec_rawIn_adjustedExp_T = _GEN_0 ^ 9'h1ff; // @[rawFloatFromFN.scala 55:18]
  wire [8:0] _floatMul_t_rec_rawIn_adjustedExp_T_1 = floatMul_t_rec_rawIn_isZeroExpIn ?
    _floatMul_t_rec_rawIn_adjustedExp_T : {{1'd0}, floatMul_t_rec_rawIn_expIn}; // @[rawFloatFromFN.scala 54:10]
  wire [1:0] _floatMul_t_rec_rawIn_adjustedExp_T_2 = floatMul_t_rec_rawIn_isZeroExpIn ? 2'h2 : 2'h1; // @[rawFloatFromFN.scala 58:14]
  wire [7:0] _GEN_1 = {{6'd0}, _floatMul_t_rec_rawIn_adjustedExp_T_2}; // @[rawFloatFromFN.scala 58:9]
  wire [7:0] _floatMul_t_rec_rawIn_adjustedExp_T_3 = 8'h80 | _GEN_1; // @[rawFloatFromFN.scala 58:9]
  wire [8:0] _GEN_2 = {{1'd0}, _floatMul_t_rec_rawIn_adjustedExp_T_3}; // @[rawFloatFromFN.scala 57:9]
  wire [8:0] floatMul_t_rec_rawIn_adjustedExp = _floatMul_t_rec_rawIn_adjustedExp_T_1 + _GEN_2; // @[rawFloatFromFN.scala 57:9]
  wire  floatMul_t_rec_rawIn_isZero = floatMul_t_rec_rawIn_isZeroExpIn & floatMul_t_rec_rawIn_isZeroFractIn; // @[rawFloatFromFN.scala 60:30]
  wire  floatMul_t_rec_rawIn_isSpecial = floatMul_t_rec_rawIn_adjustedExp[8:7] == 2'h3; // @[rawFloatFromFN.scala 61:57]
  wire  floatMul_t_rec_rawIn__isNaN = floatMul_t_rec_rawIn_isSpecial & ~floatMul_t_rec_rawIn_isZeroFractIn; // @[rawFloatFromFN.scala 64:28]
  wire [9:0] floatMul_t_rec_rawIn__sExp = {1'b0,$signed(floatMul_t_rec_rawIn_adjustedExp)}; // @[rawFloatFromFN.scala 68:42]
  wire  _floatMul_t_rec_rawIn_out_sig_T = ~floatMul_t_rec_rawIn_isZero; // @[rawFloatFromFN.scala 70:19]
  wire [21:0] _floatMul_t_rec_rawIn_out_sig_T_2 = floatMul_t_rec_rawIn_isZeroExpIn ? floatMul_t_rec_rawIn_subnormFract
     : floatMul_t_rec_rawIn_fractIn; // @[rawFloatFromFN.scala 70:33]
  wire [23:0] floatMul_t_rec_rawIn__sig = {1'h0,_floatMul_t_rec_rawIn_out_sig_T,_floatMul_t_rec_rawIn_out_sig_T_2}; // @[rawFloatFromFN.scala 70:27]
  wire [2:0] _floatMul_t_rec_T_1 = floatMul_t_rec_rawIn_isZero ? 3'h0 : floatMul_t_rec_rawIn__sExp[8:6]; // @[recFNFromFN.scala 48:15]
  wire [2:0] _GEN_3 = {{2'd0}, floatMul_t_rec_rawIn__isNaN}; // @[recFNFromFN.scala 48:76]
  wire [2:0] _floatMul_t_rec_T_3 = _floatMul_t_rec_T_1 | _GEN_3; // @[recFNFromFN.scala 48:76]
  wire [9:0] _floatMul_t_rec_T_6 = {floatMul_t_rec_rawIn_sign,_floatMul_t_rec_T_3,floatMul_t_rec_rawIn__sExp[5:0]}; // @[recFNFromFN.scala 49:45]
  wire  floatMul_self_rec_rawIn_sign = io_a_bits[30]; // @[rawFloatFromFN.scala 44:18]
  wire [7:0] floatMul_self_rec_rawIn_expIn = io_a_bits[29:22]; // @[rawFloatFromFN.scala 45:19]
  wire [21:0] floatMul_self_rec_rawIn_fractIn = io_a_bits[21:0]; // @[rawFloatFromFN.scala 46:21]
  wire  floatMul_self_rec_rawIn_isZeroExpIn = floatMul_self_rec_rawIn_expIn == 8'h0; // @[rawFloatFromFN.scala 48:30]
  wire  floatMul_self_rec_rawIn_isZeroFractIn = floatMul_self_rec_rawIn_fractIn == 22'h0; // @[rawFloatFromFN.scala 49:34]
  wire [4:0] _floatMul_self_rec_rawIn_normDist_T_22 = floatMul_self_rec_rawIn_fractIn[1] ? 5'h14 : 5'h15; // @[Mux.scala 47:70]
  wire [4:0] _floatMul_self_rec_rawIn_normDist_T_23 = floatMul_self_rec_rawIn_fractIn[2] ? 5'h13 :
    _floatMul_self_rec_rawIn_normDist_T_22; // @[Mux.scala 47:70]
  wire [4:0] _floatMul_self_rec_rawIn_normDist_T_24 = floatMul_self_rec_rawIn_fractIn[3] ? 5'h12 :
    _floatMul_self_rec_rawIn_normDist_T_23; // @[Mux.scala 47:70]
  wire [4:0] _floatMul_self_rec_rawIn_normDist_T_25 = floatMul_self_rec_rawIn_fractIn[4] ? 5'h11 :
    _floatMul_self_rec_rawIn_normDist_T_24; // @[Mux.scala 47:70]
  wire [4:0] _floatMul_self_rec_rawIn_normDist_T_26 = floatMul_self_rec_rawIn_fractIn[5] ? 5'h10 :
    _floatMul_self_rec_rawIn_normDist_T_25; // @[Mux.scala 47:70]
  wire [4:0] _floatMul_self_rec_rawIn_normDist_T_27 = floatMul_self_rec_rawIn_fractIn[6] ? 5'hf :
    _floatMul_self_rec_rawIn_normDist_T_26; // @[Mux.scala 47:70]
  wire [4:0] _floatMul_self_rec_rawIn_normDist_T_28 = floatMul_self_rec_rawIn_fractIn[7] ? 5'he :
    _floatMul_self_rec_rawIn_normDist_T_27; // @[Mux.scala 47:70]
  wire [4:0] _floatMul_self_rec_rawIn_normDist_T_29 = floatMul_self_rec_rawIn_fractIn[8] ? 5'hd :
    _floatMul_self_rec_rawIn_normDist_T_28; // @[Mux.scala 47:70]
  wire [4:0] _floatMul_self_rec_rawIn_normDist_T_30 = floatMul_self_rec_rawIn_fractIn[9] ? 5'hc :
    _floatMul_self_rec_rawIn_normDist_T_29; // @[Mux.scala 47:70]
  wire [4:0] _floatMul_self_rec_rawIn_normDist_T_31 = floatMul_self_rec_rawIn_fractIn[10] ? 5'hb :
    _floatMul_self_rec_rawIn_normDist_T_30; // @[Mux.scala 47:70]
  wire [4:0] _floatMul_self_rec_rawIn_normDist_T_32 = floatMul_self_rec_rawIn_fractIn[11] ? 5'ha :
    _floatMul_self_rec_rawIn_normDist_T_31; // @[Mux.scala 47:70]
  wire [4:0] _floatMul_self_rec_rawIn_normDist_T_33 = floatMul_self_rec_rawIn_fractIn[12] ? 5'h9 :
    _floatMul_self_rec_rawIn_normDist_T_32; // @[Mux.scala 47:70]
  wire [4:0] _floatMul_self_rec_rawIn_normDist_T_34 = floatMul_self_rec_rawIn_fractIn[13] ? 5'h8 :
    _floatMul_self_rec_rawIn_normDist_T_33; // @[Mux.scala 47:70]
  wire [4:0] _floatMul_self_rec_rawIn_normDist_T_35 = floatMul_self_rec_rawIn_fractIn[14] ? 5'h7 :
    _floatMul_self_rec_rawIn_normDist_T_34; // @[Mux.scala 47:70]
  wire [4:0] _floatMul_self_rec_rawIn_normDist_T_36 = floatMul_self_rec_rawIn_fractIn[15] ? 5'h6 :
    _floatMul_self_rec_rawIn_normDist_T_35; // @[Mux.scala 47:70]
  wire [4:0] _floatMul_self_rec_rawIn_normDist_T_37 = floatMul_self_rec_rawIn_fractIn[16] ? 5'h5 :
    _floatMul_self_rec_rawIn_normDist_T_36; // @[Mux.scala 47:70]
  wire [4:0] _floatMul_self_rec_rawIn_normDist_T_38 = floatMul_self_rec_rawIn_fractIn[17] ? 5'h4 :
    _floatMul_self_rec_rawIn_normDist_T_37; // @[Mux.scala 47:70]
  wire [4:0] _floatMul_self_rec_rawIn_normDist_T_39 = floatMul_self_rec_rawIn_fractIn[18] ? 5'h3 :
    _floatMul_self_rec_rawIn_normDist_T_38; // @[Mux.scala 47:70]
  wire [4:0] _floatMul_self_rec_rawIn_normDist_T_40 = floatMul_self_rec_rawIn_fractIn[19] ? 5'h2 :
    _floatMul_self_rec_rawIn_normDist_T_39; // @[Mux.scala 47:70]
  wire [4:0] _floatMul_self_rec_rawIn_normDist_T_41 = floatMul_self_rec_rawIn_fractIn[20] ? 5'h1 :
    _floatMul_self_rec_rawIn_normDist_T_40; // @[Mux.scala 47:70]
  wire [4:0] floatMul_self_rec_rawIn_normDist = floatMul_self_rec_rawIn_fractIn[21] ? 5'h0 :
    _floatMul_self_rec_rawIn_normDist_T_41; // @[Mux.scala 47:70]
  wire [52:0] _GEN_9 = {{31'd0}, floatMul_self_rec_rawIn_fractIn}; // @[rawFloatFromFN.scala 52:33]
  wire [52:0] _floatMul_self_rec_rawIn_subnormFract_T = _GEN_9 << floatMul_self_rec_rawIn_normDist; // @[rawFloatFromFN.scala 52:33]
  wire [21:0] floatMul_self_rec_rawIn_subnormFract = {_floatMul_self_rec_rawIn_subnormFract_T[20:0], 1'h0}; // @[rawFloatFromFN.scala 52:64]
  wire [8:0] _GEN_4 = {{4'd0}, floatMul_self_rec_rawIn_normDist}; // @[rawFloatFromFN.scala 55:18]
  wire [8:0] _floatMul_self_rec_rawIn_adjustedExp_T = _GEN_4 ^ 9'h1ff; // @[rawFloatFromFN.scala 55:18]
  wire [8:0] _floatMul_self_rec_rawIn_adjustedExp_T_1 = floatMul_self_rec_rawIn_isZeroExpIn ?
    _floatMul_self_rec_rawIn_adjustedExp_T : {{1'd0}, floatMul_self_rec_rawIn_expIn}; // @[rawFloatFromFN.scala 54:10]
  wire [1:0] _floatMul_self_rec_rawIn_adjustedExp_T_2 = floatMul_self_rec_rawIn_isZeroExpIn ? 2'h2 : 2'h1; // @[rawFloatFromFN.scala 58:14]
  wire [7:0] _GEN_5 = {{6'd0}, _floatMul_self_rec_rawIn_adjustedExp_T_2}; // @[rawFloatFromFN.scala 58:9]
  wire [7:0] _floatMul_self_rec_rawIn_adjustedExp_T_3 = 8'h80 | _GEN_5; // @[rawFloatFromFN.scala 58:9]
  wire [8:0] _GEN_6 = {{1'd0}, _floatMul_self_rec_rawIn_adjustedExp_T_3}; // @[rawFloatFromFN.scala 57:9]
  wire [8:0] floatMul_self_rec_rawIn_adjustedExp = _floatMul_self_rec_rawIn_adjustedExp_T_1 + _GEN_6; // @[rawFloatFromFN.scala 57:9]
  wire  floatMul_self_rec_rawIn_isZero = floatMul_self_rec_rawIn_isZeroExpIn & floatMul_self_rec_rawIn_isZeroFractIn; // @[rawFloatFromFN.scala 60:30]
  wire  floatMul_self_rec_rawIn_isSpecial = floatMul_self_rec_rawIn_adjustedExp[8:7] == 2'h3; // @[rawFloatFromFN.scala 61:57]
  wire  floatMul_self_rec_rawIn__isNaN = floatMul_self_rec_rawIn_isSpecial & ~floatMul_self_rec_rawIn_isZeroFractIn; // @[rawFloatFromFN.scala 64:28]
  wire [9:0] floatMul_self_rec_rawIn__sExp = {1'b0,$signed(floatMul_self_rec_rawIn_adjustedExp)}; // @[rawFloatFromFN.scala 68:42]
  wire  _floatMul_self_rec_rawIn_out_sig_T = ~floatMul_self_rec_rawIn_isZero; // @[rawFloatFromFN.scala 70:19]
  wire [21:0] _floatMul_self_rec_rawIn_out_sig_T_2 = floatMul_self_rec_rawIn_isZeroExpIn ?
    floatMul_self_rec_rawIn_subnormFract : floatMul_self_rec_rawIn_fractIn; // @[rawFloatFromFN.scala 70:33]
  wire [23:0] floatMul_self_rec_rawIn__sig = {1'h0,_floatMul_self_rec_rawIn_out_sig_T,
    _floatMul_self_rec_rawIn_out_sig_T_2}; // @[rawFloatFromFN.scala 70:27]
  wire [2:0] _floatMul_self_rec_T_1 = floatMul_self_rec_rawIn_isZero ? 3'h0 : floatMul_self_rec_rawIn__sExp[8:6]; // @[recFNFromFN.scala 48:15]
  wire [2:0] _GEN_7 = {{2'd0}, floatMul_self_rec_rawIn__isNaN}; // @[recFNFromFN.scala 48:76]
  wire [2:0] _floatMul_self_rec_T_3 = _floatMul_self_rec_T_1 | _GEN_7; // @[recFNFromFN.scala 48:76]
  wire [9:0] _floatMul_self_rec_T_6 = {floatMul_self_rec_rawIn_sign,_floatMul_self_rec_T_3,floatMul_self_rec_rawIn__sExp
    [5:0]}; // @[recFNFromFN.scala 49:45]
  wire [8:0] floatMul_out_bits_rawIn_exp = floatMul_muladder_io_out[30:22]; // @[rawFloatFromRecFN.scala 51:21]
  wire  floatMul_out_bits_rawIn_isZero = floatMul_out_bits_rawIn_exp[8:6] == 3'h0; // @[rawFloatFromRecFN.scala 52:53]
  wire  floatMul_out_bits_rawIn_isSpecial = floatMul_out_bits_rawIn_exp[8:7] == 2'h3; // @[rawFloatFromRecFN.scala 53:53]
  wire  floatMul_out_bits_rawIn__isNaN = floatMul_out_bits_rawIn_isSpecial & floatMul_out_bits_rawIn_exp[6]; // @[rawFloatFromRecFN.scala 56:33]
  wire  floatMul_out_bits_rawIn__isInf = floatMul_out_bits_rawIn_isSpecial & ~floatMul_out_bits_rawIn_exp[6]; // @[rawFloatFromRecFN.scala 57:33]
  wire  floatMul_out_bits_rawIn__sign = floatMul_muladder_io_out[31]; // @[rawFloatFromRecFN.scala 59:25]
  wire [9:0] floatMul_out_bits_rawIn__sExp = {1'b0,$signed(floatMul_out_bits_rawIn_exp)}; // @[rawFloatFromRecFN.scala 60:27]
  wire  _floatMul_out_bits_rawIn_out_sig_T = ~floatMul_out_bits_rawIn_isZero; // @[rawFloatFromRecFN.scala 61:35]
  wire [23:0] floatMul_out_bits_rawIn__sig = {1'h0,_floatMul_out_bits_rawIn_out_sig_T,floatMul_muladder_io_out[21:0]}; // @[rawFloatFromRecFN.scala 61:44]
  wire  floatMul_out_bits_isSubnormal = $signed(floatMul_out_bits_rawIn__sExp) < 10'sh82; // @[fNFromRecFN.scala 51:38]
  wire [4:0] floatMul_out_bits_denormShiftDist = 5'h1 - floatMul_out_bits_rawIn__sExp[4:0]; // @[fNFromRecFN.scala 52:35]
  wire [22:0] _floatMul_out_bits_denormFract_T_1 = floatMul_out_bits_rawIn__sig[23:1] >>
    floatMul_out_bits_denormShiftDist; // @[fNFromRecFN.scala 53:42]
  wire [21:0] floatMul_out_bits_denormFract = _floatMul_out_bits_denormFract_T_1[21:0]; // @[fNFromRecFN.scala 53:60]
  wire [7:0] _floatMul_out_bits_expOut_T_2 = floatMul_out_bits_rawIn__sExp[7:0] - 8'h81; // @[fNFromRecFN.scala 58:45]
  wire [7:0] _floatMul_out_bits_expOut_T_3 = floatMul_out_bits_isSubnormal ? 8'h0 : _floatMul_out_bits_expOut_T_2; // @[fNFromRecFN.scala 56:16]
  wire  _floatMul_out_bits_expOut_T_4 = floatMul_out_bits_rawIn__isNaN | floatMul_out_bits_rawIn__isInf; // @[fNFromRecFN.scala 60:44]
  wire [7:0] _floatMul_out_bits_expOut_T_6 = _floatMul_out_bits_expOut_T_4 ? 8'hff : 8'h0; // @[Bitwise.scala 77:12]
  wire [7:0] floatMul_out_bits_expOut = _floatMul_out_bits_expOut_T_3 | _floatMul_out_bits_expOut_T_6; // @[fNFromRecFN.scala 60:15]
  wire [21:0] _floatMul_out_bits_fractOut_T_1 = floatMul_out_bits_rawIn__isInf ? 22'h0 : floatMul_out_bits_rawIn__sig[21
    :0]; // @[fNFromRecFN.scala 64:20]
  wire [21:0] floatMul_out_bits_fractOut = floatMul_out_bits_isSubnormal ? floatMul_out_bits_denormFract :
    _floatMul_out_bits_fractOut_T_1; // @[fNFromRecFN.scala 62:16]
  wire [8:0] floatMul_out_bits_hi = {floatMul_out_bits_rawIn__sign,floatMul_out_bits_expOut}; // @[Cat.scala 33:92]
  RecFNToRecFN floatMul_t_resizer ( // @[Arithmetic.scala 337:32]
    .io_in(floatMul_t_resizer_io_in),
    .io_out(floatMul_t_resizer_io_out)
  );
  MulRecFN floatMul_muladder ( // @[Arithmetic.scala 343:30]
    .io_a(floatMul_muladder_io_a),
    .io_b(floatMul_muladder_io_b),
    .io_out(floatMul_muladder_io_out)
  );
  assign io_out_bits = {floatMul_out_bits_hi,floatMul_out_bits_fractOut}; // @[Cat.scala 33:92]
  assign floatMul_t_resizer_io_in = {_floatMul_t_rec_T_6,floatMul_t_rec_rawIn__sig[21:0]}; // @[recFNFromFN.scala 50:41]
  assign floatMul_muladder_io_a = {_floatMul_self_rec_T_6,floatMul_self_rec_rawIn__sig[21:0]}; // @[recFNFromFN.scala 50:41]
  assign floatMul_muladder_io_b = floatMul_t_resizer_io_out; // @[Arithmetic.scala 349:23]
endmodule
