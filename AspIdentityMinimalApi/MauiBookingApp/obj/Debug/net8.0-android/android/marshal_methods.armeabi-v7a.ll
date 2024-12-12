; ModuleID = 'marshal_methods.armeabi-v7a.ll'
source_filename = "marshal_methods.armeabi-v7a.ll"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "armv7-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [317 x ptr] zeroinitializer, align 4

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [628 x i32] [
	i32 2616222, ; 0: System.Net.NetworkInformation.dll => 0x27eb9e => 66
	i32 10166715, ; 1: System.Net.NameResolution.dll => 0x9b21bb => 65
	i32 15721112, ; 2: System.Runtime.Intrinsics.dll => 0xefe298 => 106
	i32 32687329, ; 3: Xamarin.AndroidX.Lifecycle.Runtime => 0x1f2c4e1 => 236
	i32 34715100, ; 4: Xamarin.Google.Guava.ListenableFuture.dll => 0x211b5dc => 270
	i32 34839235, ; 5: System.IO.FileSystem.DriveInfo => 0x2139ac3 => 47
	i32 38948123, ; 6: ar\Microsoft.Maui.Controls.resources.dll => 0x2524d1b => 278
	i32 39485524, ; 7: System.Net.WebSockets.dll => 0x25a8054 => 78
	i32 42244203, ; 8: he\Microsoft.Maui.Controls.resources.dll => 0x284986b => 287
	i32 42639949, ; 9: System.Threading.Thread => 0x28aa24d => 143
	i32 66541672, ; 10: System.Diagnostics.StackTrace => 0x3f75868 => 29
	i32 67008169, ; 11: zh-Hant\Microsoft.Maui.Controls.resources => 0x3fe76a9 => 311
	i32 68219467, ; 12: System.Security.Cryptography.Primitives => 0x410f24b => 122
	i32 72070932, ; 13: Microsoft.Maui.Graphics.dll => 0x44bb714 => 192
	i32 82292897, ; 14: System.Runtime.CompilerServices.VisualC.dll => 0x4e7b0a1 => 100
	i32 83839681, ; 15: ms\Microsoft.Maui.Controls.resources.dll => 0x4ff4ac1 => 295
	i32 98325684, ; 16: Microsoft.Extensions.Diagnostics.Abstractions => 0x5dc54b4 => 179
	i32 101534019, ; 17: Xamarin.AndroidX.SlidingPaneLayout => 0x60d4943 => 254
	i32 117431740, ; 18: System.Runtime.InteropServices => 0x6ffddbc => 105
	i32 120558881, ; 19: Xamarin.AndroidX.SlidingPaneLayout.dll => 0x72f9521 => 254
	i32 122350210, ; 20: System.Threading.Channels.dll => 0x74aea82 => 137
	i32 134690465, ; 21: Xamarin.Kotlin.StdLib.Jdk7.dll => 0x80736a1 => 274
	i32 136584136, ; 22: zh-Hans\Microsoft.Maui.Controls.resources.dll => 0x8241bc8 => 310
	i32 140062828, ; 23: sk\Microsoft.Maui.Controls.resources.dll => 0x859306c => 303
	i32 142721839, ; 24: System.Net.WebHeaderCollection => 0x881c32f => 75
	i32 149972175, ; 25: System.Security.Cryptography.Primitives.dll => 0x8f064cf => 122
	i32 159306688, ; 26: System.ComponentModel.Annotations => 0x97ed3c0 => 13
	i32 165246403, ; 27: Xamarin.AndroidX.Collection.dll => 0x9d975c3 => 210
	i32 176265551, ; 28: System.ServiceProcess => 0xa81994f => 130
	i32 182336117, ; 29: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 256
	i32 184328833, ; 30: System.ValueTuple.dll => 0xafca281 => 149
	i32 205061960, ; 31: System.ComponentModel => 0xc38ff48 => 18
	i32 209399409, ; 32: Xamarin.AndroidX.Browser.dll => 0xc7b2e71 => 208
	i32 220171995, ; 33: System.Diagnostics.Debug => 0xd1f8edb => 26
	i32 221958352, ; 34: Microsoft.Extensions.Diagnostics.dll => 0xd3ad0d0 => 178
	i32 230216969, ; 35: Xamarin.AndroidX.Legacy.Support.Core.Utils.dll => 0xdb8d509 => 230
	i32 230752869, ; 36: Microsoft.CSharp.dll => 0xdc10265 => 1
	i32 231409092, ; 37: System.Linq.Parallel => 0xdcb05c4 => 58
	i32 231814094, ; 38: System.Globalization => 0xdd133ce => 41
	i32 246610117, ; 39: System.Reflection.Emit.Lightweight => 0xeb2f8c5 => 89
	i32 261689757, ; 40: Xamarin.AndroidX.ConstraintLayout.dll => 0xf99119d => 213
	i32 276479776, ; 41: System.Threading.Timer.dll => 0x107abf20 => 145
	i32 278686392, ; 42: Xamarin.AndroidX.Lifecycle.LiveData.dll => 0x109c6ab8 => 232
	i32 280482487, ; 43: Xamarin.AndroidX.Interpolator => 0x10b7d2b7 => 229
	i32 291076382, ; 44: System.IO.Pipes.AccessControl.dll => 0x1159791e => 53
	i32 291275502, ; 45: Microsoft.Extensions.Http.dll => 0x115c82ee => 180
	i32 298918909, ; 46: System.Net.Ping.dll => 0x11d123fd => 67
	i32 317674968, ; 47: vi\Microsoft.Maui.Controls.resources => 0x12ef55d8 => 308
	i32 318968648, ; 48: Xamarin.AndroidX.Activity.dll => 0x13031348 => 199
	i32 321597661, ; 49: System.Numerics => 0x132b30dd => 81
	i32 321963286, ; 50: fr\Microsoft.Maui.Controls.resources.dll => 0x1330c516 => 286
	i32 342366114, ; 51: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 231
	i32 360082299, ; 52: System.ServiceModel.Web => 0x15766b7b => 129
	i32 367780167, ; 53: System.IO.Pipes => 0x15ebe147 => 54
	i32 374914964, ; 54: System.Transactions.Local => 0x1658bf94 => 147
	i32 375677976, ; 55: System.Net.ServicePoint.dll => 0x16646418 => 72
	i32 379916513, ; 56: System.Threading.Thread.dll => 0x16a510e1 => 143
	i32 385762202, ; 57: System.Memory.dll => 0x16fe439a => 61
	i32 392610295, ; 58: System.Threading.ThreadPool.dll => 0x1766c1f7 => 144
	i32 395744057, ; 59: _Microsoft.Android.Resource.Designer => 0x17969339 => 313
	i32 403441872, ; 60: WindowsBase => 0x180c08d0 => 163
	i32 409257351, ; 61: tr\Microsoft.Maui.Controls.resources.dll => 0x1864c587 => 306
	i32 441335492, ; 62: Xamarin.AndroidX.ConstraintLayout.Core => 0x1a4e3ec4 => 214
	i32 442565967, ; 63: System.Collections => 0x1a61054f => 12
	i32 450948140, ; 64: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 227
	i32 451504562, ; 65: System.Security.Cryptography.X509Certificates => 0x1ae969b2 => 123
	i32 456227837, ; 66: System.Web.HttpUtility.dll => 0x1b317bfd => 150
	i32 459347974, ; 67: System.Runtime.Serialization.Primitives.dll => 0x1b611806 => 111
	i32 465846621, ; 68: mscorlib => 0x1bc4415d => 164
	i32 469710990, ; 69: System.dll => 0x1bff388e => 162
	i32 476646585, ; 70: Xamarin.AndroidX.Interpolator.dll => 0x1c690cb9 => 229
	i32 486930444, ; 71: Xamarin.AndroidX.LocalBroadcastManager.dll => 0x1d05f80c => 242
	i32 489220957, ; 72: es\Microsoft.Maui.Controls.resources.dll => 0x1d28eb5d => 284
	i32 498788369, ; 73: System.ObjectModel => 0x1dbae811 => 82
	i32 513247710, ; 74: Microsoft.Extensions.Primitives.dll => 0x1e9789de => 186
	i32 526420162, ; 75: System.Transactions.dll => 0x1f6088c2 => 148
	i32 527452488, ; 76: Xamarin.Kotlin.StdLib.Jdk7 => 0x1f704948 => 274
	i32 530272170, ; 77: System.Linq.Queryable => 0x1f9b4faa => 59
	i32 538707440, ; 78: th\Microsoft.Maui.Controls.resources.dll => 0x201c05f0 => 305
	i32 539058512, ; 79: Microsoft.Extensions.Logging => 0x20216150 => 181
	i32 540030774, ; 80: System.IO.FileSystem.dll => 0x20303736 => 50
	i32 545304856, ; 81: System.Runtime.Extensions => 0x2080b118 => 101
	i32 546455878, ; 82: System.Runtime.Serialization.Xml => 0x20924146 => 112
	i32 549171840, ; 83: System.Globalization.Calendars => 0x20bbb280 => 39
	i32 557405415, ; 84: Jsr305Binding => 0x213954e7 => 267
	i32 569601784, ; 85: Xamarin.AndroidX.Window.Extensions.Core.Core => 0x21f36ef8 => 265
	i32 577335427, ; 86: System.Security.Cryptography.Cng => 0x22697083 => 118
	i32 601371474, ; 87: System.IO.IsolatedStorage.dll => 0x23d83352 => 51
	i32 605376203, ; 88: System.IO.Compression.FileSystem => 0x24154ecb => 43
	i32 613668793, ; 89: System.Security.Cryptography.Algorithms => 0x2493d7b9 => 117
	i32 627609679, ; 90: Xamarin.AndroidX.CustomView => 0x2568904f => 219
	i32 627931235, ; 91: nl\Microsoft.Maui.Controls.resources => 0x256d7863 => 297
	i32 639843206, ; 92: Xamarin.AndroidX.Emoji2.ViewsHelper.dll => 0x26233b86 => 225
	i32 643868501, ; 93: System.Net => 0x2660a755 => 79
	i32 662205335, ; 94: System.Text.Encodings.Web.dll => 0x27787397 => 134
	i32 663517072, ; 95: Xamarin.AndroidX.VersionedParcelable => 0x278c7790 => 261
	i32 666292255, ; 96: Xamarin.AndroidX.Arch.Core.Common.dll => 0x27b6d01f => 206
	i32 672442732, ; 97: System.Collections.Concurrent => 0x2814a96c => 8
	i32 683518922, ; 98: System.Net.Security => 0x28bdabca => 71
	i32 690569205, ; 99: System.Xml.Linq.dll => 0x29293ff5 => 153
	i32 691348768, ; 100: Xamarin.KotlinX.Coroutines.Android.dll => 0x29352520 => 276
	i32 693804605, ; 101: System.Windows => 0x295a9e3d => 152
	i32 699345723, ; 102: System.Reflection.Emit => 0x29af2b3b => 90
	i32 700284507, ; 103: Xamarin.Jetbrains.Annotations => 0x29bd7e5b => 271
	i32 700358131, ; 104: System.IO.Compression.ZipFile => 0x29be9df3 => 44
	i32 720511267, ; 105: Xamarin.Kotlin.StdLib.Jdk8 => 0x2af22123 => 275
	i32 722857257, ; 106: System.Runtime.Loader.dll => 0x2b15ed29 => 107
	i32 731701662, ; 107: Microsoft.Extensions.Options.ConfigurationExtensions => 0x2b9ce19e => 185
	i32 735137430, ; 108: System.Security.SecureString.dll => 0x2bd14e96 => 127
	i32 752232764, ; 109: System.Diagnostics.Contracts.dll => 0x2cd6293c => 25
	i32 755313932, ; 110: Xamarin.Android.Glide.Annotations.dll => 0x2d052d0c => 196
	i32 759454413, ; 111: System.Net.Requests => 0x2d445acd => 70
	i32 762598435, ; 112: System.IO.Pipes.dll => 0x2d745423 => 54
	i32 775507847, ; 113: System.IO.Compression => 0x2e394f87 => 45
	i32 777317022, ; 114: sk\Microsoft.Maui.Controls.resources => 0x2e54ea9e => 303
	i32 789151979, ; 115: Microsoft.Extensions.Options => 0x2f0980eb => 184
	i32 790371945, ; 116: Xamarin.AndroidX.CustomView.PoolingContainer.dll => 0x2f1c1e69 => 220
	i32 804715423, ; 117: System.Data.Common => 0x2ff6fb9f => 22
	i32 807930345, ; 118: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx.dll => 0x302809e9 => 234
	i32 823281589, ; 119: System.Private.Uri.dll => 0x311247b5 => 84
	i32 830298997, ; 120: System.IO.Compression.Brotli => 0x317d5b75 => 42
	i32 832635846, ; 121: System.Xml.XPath.dll => 0x31a103c6 => 158
	i32 834051424, ; 122: System.Net.Quic => 0x31b69d60 => 69
	i32 843511501, ; 123: Xamarin.AndroidX.Print => 0x3246f6cd => 247
	i32 869139383, ; 124: hi\Microsoft.Maui.Controls.resources.dll => 0x33ce03b7 => 288
	i32 873119928, ; 125: Microsoft.VisualBasic => 0x340ac0b8 => 3
	i32 877678880, ; 126: System.Globalization.dll => 0x34505120 => 41
	i32 878954865, ; 127: System.Net.Http.Json => 0x3463c971 => 194
	i32 880668424, ; 128: ru\Microsoft.Maui.Controls.resources.dll => 0x347def08 => 302
	i32 904024072, ; 129: System.ComponentModel.Primitives.dll => 0x35e25008 => 16
	i32 911108515, ; 130: System.IO.MemoryMappedFiles.dll => 0x364e69a3 => 52
	i32 918734561, ; 131: pt-BR\Microsoft.Maui.Controls.resources.dll => 0x36c2c6e1 => 299
	i32 928116545, ; 132: Xamarin.Google.Guava.ListenableFuture => 0x3751ef41 => 270
	i32 952186615, ; 133: System.Runtime.InteropServices.JavaScript.dll => 0x38c136f7 => 103
	i32 956575887, ; 134: Xamarin.Kotlin.StdLib.Jdk8.dll => 0x3904308f => 275
	i32 961460050, ; 135: it\Microsoft.Maui.Controls.resources.dll => 0x394eb752 => 292
	i32 966729478, ; 136: Xamarin.Google.Crypto.Tink.Android => 0x399f1f06 => 268
	i32 967690846, ; 137: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 231
	i32 975236339, ; 138: System.Diagnostics.Tracing => 0x3a20ecf3 => 33
	i32 975874589, ; 139: System.Xml.XDocument => 0x3a2aaa1d => 156
	i32 986514023, ; 140: System.Private.DataContractSerialization.dll => 0x3acd0267 => 83
	i32 987214855, ; 141: System.Diagnostics.Tools => 0x3ad7b407 => 31
	i32 990727110, ; 142: ro\Microsoft.Maui.Controls.resources.dll => 0x3b0d4bc6 => 301
	i32 992768348, ; 143: System.Collections.dll => 0x3b2c715c => 12
	i32 994442037, ; 144: System.IO.FileSystem => 0x3b45fb35 => 50
	i32 1001831731, ; 145: System.IO.UnmanagedMemoryStream.dll => 0x3bb6bd33 => 55
	i32 1012816738, ; 146: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 251
	i32 1019214401, ; 147: System.Drawing => 0x3cbffa41 => 35
	i32 1028951442, ; 148: Microsoft.Extensions.DependencyInjection.Abstractions => 0x3d548d92 => 177
	i32 1031528504, ; 149: Xamarin.Google.ErrorProne.Annotations.dll => 0x3d7be038 => 269
	i32 1035644815, ; 150: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 204
	i32 1036536393, ; 151: System.Drawing.Primitives.dll => 0x3dc84a49 => 34
	i32 1043950537, ; 152: de\Microsoft.Maui.Controls.resources.dll => 0x3e396bc9 => 282
	i32 1044663988, ; 153: System.Linq.Expressions.dll => 0x3e444eb4 => 57
	i32 1048992957, ; 154: Microsoft.Extensions.Diagnostics.Abstractions.dll => 0x3e865cbd => 179
	i32 1052210849, ; 155: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x3eb776a1 => 238
	i32 1067306892, ; 156: GoogleGson => 0x3f9dcf8c => 172
	i32 1082857460, ; 157: System.ComponentModel.TypeConverter => 0x408b17f4 => 17
	i32 1084122840, ; 158: Xamarin.Kotlin.StdLib => 0x409e66d8 => 272
	i32 1098259244, ; 159: System => 0x41761b2c => 162
	i32 1108272742, ; 160: sv\Microsoft.Maui.Controls.resources.dll => 0x420ee666 => 304
	i32 1117529484, ; 161: pl\Microsoft.Maui.Controls.resources.dll => 0x429c258c => 298
	i32 1118262833, ; 162: ko\Microsoft.Maui.Controls.resources => 0x42a75631 => 294
	i32 1121599056, ; 163: Xamarin.AndroidX.Lifecycle.Runtime.Ktx.dll => 0x42da3e50 => 237
	i32 1127624469, ; 164: Microsoft.Extensions.Logging.Debug => 0x43362f15 => 183
	i32 1149092582, ; 165: Xamarin.AndroidX.Window => 0x447dc2e6 => 264
	i32 1168523401, ; 166: pt\Microsoft.Maui.Controls.resources => 0x45a64089 => 300
	i32 1170634674, ; 167: System.Web.dll => 0x45c677b2 => 151
	i32 1175144683, ; 168: Xamarin.AndroidX.VectorDrawable.Animated => 0x460b48eb => 260
	i32 1178241025, ; 169: Xamarin.AndroidX.Navigation.Runtime.dll => 0x463a8801 => 245
	i32 1204270330, ; 170: Xamarin.AndroidX.Arch.Core.Common => 0x47c7b4fa => 206
	i32 1208641965, ; 171: System.Diagnostics.Process => 0x480a69ad => 28
	i32 1214827643, ; 172: CommunityToolkit.Mvvm => 0x4868cc7b => 171
	i32 1219128291, ; 173: System.IO.IsolatedStorage => 0x48aa6be3 => 51
	i32 1243150071, ; 174: Xamarin.AndroidX.Window.Extensions.Core.Core.dll => 0x4a18f6f7 => 265
	i32 1253011324, ; 175: Microsoft.Win32.Registry => 0x4aaf6f7c => 5
	i32 1260983243, ; 176: cs\Microsoft.Maui.Controls.resources => 0x4b2913cb => 280
	i32 1264511973, ; 177: Xamarin.AndroidX.Startup.StartupRuntime.dll => 0x4b5eebe5 => 255
	i32 1267360935, ; 178: Xamarin.AndroidX.VectorDrawable => 0x4b8a64a7 => 259
	i32 1273260888, ; 179: Xamarin.AndroidX.Collection.Ktx => 0x4be46b58 => 211
	i32 1275534314, ; 180: Xamarin.KotlinX.Coroutines.Android => 0x4c071bea => 276
	i32 1278448581, ; 181: Xamarin.AndroidX.Annotation.Jvm => 0x4c3393c5 => 203
	i32 1293217323, ; 182: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 222
	i32 1308624726, ; 183: hr\Microsoft.Maui.Controls.resources.dll => 0x4e000756 => 289
	i32 1309188875, ; 184: System.Private.DataContractSerialization => 0x4e08a30b => 83
	i32 1322716291, ; 185: Xamarin.AndroidX.Window.dll => 0x4ed70c83 => 264
	i32 1324164729, ; 186: System.Linq => 0x4eed2679 => 60
	i32 1335329327, ; 187: System.Runtime.Serialization.Json.dll => 0x4f97822f => 110
	i32 1336711579, ; 188: zh-HK\Microsoft.Maui.Controls.resources.dll => 0x4fac999b => 309
	i32 1364015309, ; 189: System.IO => 0x514d38cd => 56
	i32 1373134921, ; 190: zh-Hans\Microsoft.Maui.Controls.resources => 0x51d86049 => 310
	i32 1376866003, ; 191: Xamarin.AndroidX.SavedState => 0x52114ed3 => 251
	i32 1379779777, ; 192: System.Resources.ResourceManager => 0x523dc4c1 => 97
	i32 1402170036, ; 193: System.Configuration.dll => 0x53936ab4 => 19
	i32 1406073936, ; 194: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 215
	i32 1408764838, ; 195: System.Runtime.Serialization.Formatters.dll => 0x53f80ba6 => 109
	i32 1411638395, ; 196: System.Runtime.CompilerServices.Unsafe => 0x5423e47b => 99
	i32 1422545099, ; 197: System.Runtime.CompilerServices.VisualC => 0x54ca50cb => 100
	i32 1430672901, ; 198: ar\Microsoft.Maui.Controls.resources => 0x55465605 => 278
	i32 1434145427, ; 199: System.Runtime.Handles => 0x557b5293 => 102
	i32 1435222561, ; 200: Xamarin.Google.Crypto.Tink.Android.dll => 0x558bc221 => 268
	i32 1439761251, ; 201: System.Net.Quic.dll => 0x55d10363 => 69
	i32 1452070440, ; 202: System.Formats.Asn1.dll => 0x568cd628 => 37
	i32 1453312822, ; 203: System.Diagnostics.Tools.dll => 0x569fcb36 => 31
	i32 1457743152, ; 204: System.Runtime.Extensions.dll => 0x56e36530 => 101
	i32 1458022317, ; 205: System.Net.Security.dll => 0x56e7a7ad => 71
	i32 1461004990, ; 206: es\Microsoft.Maui.Controls.resources => 0x57152abe => 284
	i32 1461234159, ; 207: System.Collections.Immutable.dll => 0x5718a9ef => 9
	i32 1461719063, ; 208: System.Security.Cryptography.OpenSsl => 0x57201017 => 121
	i32 1462112819, ; 209: System.IO.Compression.dll => 0x57261233 => 45
	i32 1469204771, ; 210: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 205
	i32 1470490898, ; 211: Microsoft.Extensions.Primitives => 0x57a5e912 => 186
	i32 1479771757, ; 212: System.Collections.Immutable => 0x5833866d => 9
	i32 1480492111, ; 213: System.IO.Compression.Brotli.dll => 0x583e844f => 42
	i32 1487239319, ; 214: Microsoft.Win32.Primitives => 0x58a57897 => 4
	i32 1490025113, ; 215: Xamarin.AndroidX.SavedState.SavedState.Ktx.dll => 0x58cffa99 => 252
	i32 1505131794, ; 216: Microsoft.Extensions.Http => 0x59b67d12 => 180
	i32 1526286932, ; 217: vi\Microsoft.Maui.Controls.resources.dll => 0x5af94a54 => 308
	i32 1536373174, ; 218: System.Diagnostics.TextWriterTraceListener => 0x5b9331b6 => 30
	i32 1543031311, ; 219: System.Text.RegularExpressions.dll => 0x5bf8ca0f => 136
	i32 1543355203, ; 220: System.Reflection.Emit.dll => 0x5bfdbb43 => 90
	i32 1550322496, ; 221: System.Reflection.Extensions.dll => 0x5c680b40 => 91
	i32 1565862583, ; 222: System.IO.FileSystem.Primitives => 0x5d552ab7 => 48
	i32 1566207040, ; 223: System.Threading.Tasks.Dataflow.dll => 0x5d5a6c40 => 139
	i32 1573704789, ; 224: System.Runtime.Serialization.Json => 0x5dccd455 => 110
	i32 1580037396, ; 225: System.Threading.Overlapped => 0x5e2d7514 => 138
	i32 1582372066, ; 226: Xamarin.AndroidX.DocumentFile.dll => 0x5e5114e2 => 221
	i32 1592978981, ; 227: System.Runtime.Serialization.dll => 0x5ef2ee25 => 113
	i32 1597949149, ; 228: Xamarin.Google.ErrorProne.Annotations => 0x5f3ec4dd => 269
	i32 1601112923, ; 229: System.Xml.Serialization => 0x5f6f0b5b => 155
	i32 1604827217, ; 230: System.Net.WebClient => 0x5fa7b851 => 74
	i32 1618516317, ; 231: System.Net.WebSockets.Client.dll => 0x6078995d => 77
	i32 1622152042, ; 232: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 241
	i32 1622358360, ; 233: System.Dynamic.Runtime => 0x60b33958 => 36
	i32 1624863272, ; 234: Xamarin.AndroidX.ViewPager2 => 0x60d97228 => 263
	i32 1635184631, ; 235: Xamarin.AndroidX.Emoji2.ViewsHelper => 0x6176eff7 => 225
	i32 1636350590, ; 236: Xamarin.AndroidX.CursorAdapter => 0x6188ba7e => 218
	i32 1639515021, ; 237: System.Net.Http.dll => 0x61b9038d => 62
	i32 1639986890, ; 238: System.Text.RegularExpressions => 0x61c036ca => 136
	i32 1641389582, ; 239: System.ComponentModel.EventBasedAsync.dll => 0x61d59e0e => 15
	i32 1657153582, ; 240: System.Runtime => 0x62c6282e => 114
	i32 1658241508, ; 241: Xamarin.AndroidX.Tracing.Tracing.dll => 0x62d6c1e4 => 257
	i32 1658251792, ; 242: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 266
	i32 1670060433, ; 243: Xamarin.AndroidX.ConstraintLayout => 0x638b1991 => 213
	i32 1675553242, ; 244: System.IO.FileSystem.DriveInfo.dll => 0x63dee9da => 47
	i32 1677501392, ; 245: System.Net.Primitives.dll => 0x63fca3d0 => 68
	i32 1678508291, ; 246: System.Net.WebSockets => 0x640c0103 => 78
	i32 1679769178, ; 247: System.Security.Cryptography => 0x641f3e5a => 124
	i32 1691477237, ; 248: System.Reflection.Metadata => 0x64d1e4f5 => 92
	i32 1696967625, ; 249: System.Security.Cryptography.Csp => 0x6525abc9 => 119
	i32 1698840827, ; 250: Xamarin.Kotlin.StdLib.Common => 0x654240fb => 273
	i32 1701541528, ; 251: System.Diagnostics.Debug.dll => 0x656b7698 => 26
	i32 1720223769, ; 252: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx => 0x66888819 => 234
	i32 1726116996, ; 253: System.Reflection.dll => 0x66e27484 => 95
	i32 1728033016, ; 254: System.Diagnostics.FileVersionInfo.dll => 0x66ffb0f8 => 27
	i32 1729485958, ; 255: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 209
	i32 1743415430, ; 256: ca\Microsoft.Maui.Controls.resources => 0x67ea6886 => 279
	i32 1744735666, ; 257: System.Transactions.Local.dll => 0x67fe8db2 => 147
	i32 1746316138, ; 258: Mono.Android.Export => 0x6816ab6a => 167
	i32 1750313021, ; 259: Microsoft.Win32.Primitives.dll => 0x6853a83d => 4
	i32 1758240030, ; 260: System.Resources.Reader.dll => 0x68cc9d1e => 96
	i32 1763938596, ; 261: System.Diagnostics.TraceSource.dll => 0x69239124 => 32
	i32 1765942094, ; 262: System.Reflection.Extensions => 0x6942234e => 91
	i32 1766324549, ; 263: Xamarin.AndroidX.SwipeRefreshLayout => 0x6947f945 => 256
	i32 1770582343, ; 264: Microsoft.Extensions.Logging.dll => 0x6988f147 => 181
	i32 1776026572, ; 265: System.Core.dll => 0x69dc03cc => 21
	i32 1777075843, ; 266: System.Globalization.Extensions.dll => 0x69ec0683 => 40
	i32 1780572499, ; 267: Mono.Android.Runtime.dll => 0x6a216153 => 168
	i32 1782862114, ; 268: ms\Microsoft.Maui.Controls.resources => 0x6a445122 => 295
	i32 1788241197, ; 269: Xamarin.AndroidX.Fragment => 0x6a96652d => 227
	i32 1793755602, ; 270: he\Microsoft.Maui.Controls.resources => 0x6aea89d2 => 287
	i32 1808609942, ; 271: Xamarin.AndroidX.Loader => 0x6bcd3296 => 241
	i32 1813058853, ; 272: Xamarin.Kotlin.StdLib.dll => 0x6c111525 => 272
	i32 1813201214, ; 273: Xamarin.Google.Android.Material => 0x6c13413e => 266
	i32 1818569960, ; 274: Xamarin.AndroidX.Navigation.UI.dll => 0x6c652ce8 => 246
	i32 1818787751, ; 275: Microsoft.VisualBasic.Core => 0x6c687fa7 => 2
	i32 1824175904, ; 276: System.Text.Encoding.Extensions => 0x6cbab720 => 132
	i32 1824722060, ; 277: System.Runtime.Serialization.Formatters => 0x6cc30c8c => 109
	i32 1828688058, ; 278: Microsoft.Extensions.Logging.Abstractions.dll => 0x6cff90ba => 182
	i32 1847515442, ; 279: Xamarin.Android.Glide.Annotations => 0x6e1ed932 => 196
	i32 1853025655, ; 280: sv\Microsoft.Maui.Controls.resources => 0x6e72ed77 => 304
	i32 1858542181, ; 281: System.Linq.Expressions => 0x6ec71a65 => 57
	i32 1870277092, ; 282: System.Reflection.Primitives => 0x6f7a29e4 => 93
	i32 1875935024, ; 283: fr\Microsoft.Maui.Controls.resources => 0x6fd07f30 => 286
	i32 1879696579, ; 284: System.Formats.Tar.dll => 0x7009e4c3 => 38
	i32 1885316902, ; 285: Xamarin.AndroidX.Arch.Core.Runtime.dll => 0x705fa726 => 207
	i32 1888955245, ; 286: System.Diagnostics.Contracts => 0x70972b6d => 25
	i32 1889954781, ; 287: System.Reflection.Metadata.dll => 0x70a66bdd => 92
	i32 1893218855, ; 288: cs\Microsoft.Maui.Controls.resources.dll => 0x70d83a27 => 280
	i32 1898237753, ; 289: System.Reflection.DispatchProxy => 0x7124cf39 => 87
	i32 1900610850, ; 290: System.Resources.ResourceManager.dll => 0x71490522 => 97
	i32 1910275211, ; 291: System.Collections.NonGeneric.dll => 0x71dc7c8b => 10
	i32 1939592360, ; 292: System.Private.Xml.Linq => 0x739bd4a8 => 85
	i32 1953182387, ; 293: id\Microsoft.Maui.Controls.resources.dll => 0x746b32b3 => 291
	i32 1956758971, ; 294: System.Resources.Writer => 0x74a1c5bb => 98
	i32 1961813231, ; 295: Xamarin.AndroidX.Security.SecurityCrypto.dll => 0x74eee4ef => 253
	i32 1968388702, ; 296: Microsoft.Extensions.Configuration.dll => 0x75533a5e => 173
	i32 1983156543, ; 297: Xamarin.Kotlin.StdLib.Common.dll => 0x7634913f => 273
	i32 1985761444, ; 298: Xamarin.Android.Glide.GifDecoder => 0x765c50a4 => 198
	i32 2003115576, ; 299: el\Microsoft.Maui.Controls.resources => 0x77651e38 => 283
	i32 2011961780, ; 300: System.Buffers.dll => 0x77ec19b4 => 7
	i32 2019465201, ; 301: Xamarin.AndroidX.Lifecycle.ViewModel => 0x785e97f1 => 238
	i32 2031763787, ; 302: Xamarin.Android.Glide => 0x791a414b => 195
	i32 2045470958, ; 303: System.Private.Xml => 0x79eb68ee => 86
	i32 2048278909, ; 304: Microsoft.Extensions.Configuration.Binder.dll => 0x7a16417d => 175
	i32 2055257422, ; 305: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 233
	i32 2060060697, ; 306: System.Windows.dll => 0x7aca0819 => 152
	i32 2066184531, ; 307: de\Microsoft.Maui.Controls.resources => 0x7b277953 => 282
	i32 2070888862, ; 308: System.Diagnostics.TraceSource => 0x7b6f419e => 32
	i32 2079903147, ; 309: System.Runtime.dll => 0x7bf8cdab => 114
	i32 2090596640, ; 310: System.Numerics.Vectors => 0x7c9bf920 => 80
	i32 2127167465, ; 311: System.Console => 0x7ec9ffe9 => 20
	i32 2141982267, ; 312: MauiBookingApp => 0x7fac0e3b => 0
	i32 2142473426, ; 313: System.Collections.Specialized => 0x7fb38cd2 => 11
	i32 2143790110, ; 314: System.Xml.XmlSerializer.dll => 0x7fc7a41e => 160
	i32 2146852085, ; 315: Microsoft.VisualBasic.dll => 0x7ff65cf5 => 3
	i32 2159891885, ; 316: Microsoft.Maui => 0x80bd55ad => 190
	i32 2169148018, ; 317: hu\Microsoft.Maui.Controls.resources => 0x814a9272 => 290
	i32 2181898931, ; 318: Microsoft.Extensions.Options.dll => 0x820d22b3 => 184
	i32 2192057212, ; 319: Microsoft.Extensions.Logging.Abstractions => 0x82a8237c => 182
	i32 2193016926, ; 320: System.ObjectModel.dll => 0x82b6c85e => 82
	i32 2201107256, ; 321: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x83323b38 => 277
	i32 2201231467, ; 322: System.Net.Http => 0x8334206b => 62
	i32 2207618523, ; 323: it\Microsoft.Maui.Controls.resources => 0x839595db => 292
	i32 2217644978, ; 324: Xamarin.AndroidX.VectorDrawable.Animated.dll => 0x842e93b2 => 260
	i32 2222056684, ; 325: System.Threading.Tasks.Parallel => 0x8471e4ec => 141
	i32 2244775296, ; 326: Xamarin.AndroidX.LocalBroadcastManager => 0x85cc8d80 => 242
	i32 2252106437, ; 327: System.Xml.Serialization.dll => 0x863c6ac5 => 155
	i32 2256313426, ; 328: System.Globalization.Extensions => 0x867c9c52 => 40
	i32 2265110946, ; 329: System.Security.AccessControl.dll => 0x8702d9a2 => 115
	i32 2266799131, ; 330: Microsoft.Extensions.Configuration.Abstractions => 0x871c9c1b => 174
	i32 2267999099, ; 331: Xamarin.Android.Glide.DiskLruCache.dll => 0x872eeb7b => 197
	i32 2279755925, ; 332: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 249
	i32 2293034957, ; 333: System.ServiceModel.Web.dll => 0x88acefcd => 129
	i32 2295906218, ; 334: System.Net.Sockets => 0x88d8bfaa => 73
	i32 2298471582, ; 335: System.Net.Mail => 0x88ffe49e => 64
	i32 2303942373, ; 336: nb\Microsoft.Maui.Controls.resources => 0x89535ee5 => 296
	i32 2305521784, ; 337: System.Private.CoreLib.dll => 0x896b7878 => 170
	i32 2315684594, ; 338: Xamarin.AndroidX.Annotation.dll => 0x8a068af2 => 201
	i32 2320631194, ; 339: System.Threading.Tasks.Parallel.dll => 0x8a52059a => 141
	i32 2340441535, ; 340: System.Runtime.InteropServices.RuntimeInformation.dll => 0x8b804dbf => 104
	i32 2344264397, ; 341: System.ValueTuple => 0x8bbaa2cd => 149
	i32 2353062107, ; 342: System.Net.Primitives => 0x8c40e0db => 68
	i32 2366048013, ; 343: hu\Microsoft.Maui.Controls.resources.dll => 0x8d07070d => 290
	i32 2368005991, ; 344: System.Xml.ReaderWriter.dll => 0x8d24e767 => 154
	i32 2371007202, ; 345: Microsoft.Extensions.Configuration => 0x8d52b2e2 => 173
	i32 2378619854, ; 346: System.Security.Cryptography.Csp.dll => 0x8dc6dbce => 119
	i32 2383496789, ; 347: System.Security.Principal.Windows.dll => 0x8e114655 => 125
	i32 2395872292, ; 348: id\Microsoft.Maui.Controls.resources => 0x8ece1c24 => 291
	i32 2401565422, ; 349: System.Web.HttpUtility => 0x8f24faee => 150
	i32 2403452196, ; 350: Xamarin.AndroidX.Emoji2.dll => 0x8f41c524 => 224
	i32 2421380589, ; 351: System.Threading.Tasks.Dataflow => 0x905355ed => 139
	i32 2423080555, ; 352: Xamarin.AndroidX.Collection.Ktx.dll => 0x906d466b => 211
	i32 2427813419, ; 353: hi\Microsoft.Maui.Controls.resources => 0x90b57e2b => 288
	i32 2435356389, ; 354: System.Console.dll => 0x912896e5 => 20
	i32 2435904999, ; 355: System.ComponentModel.DataAnnotations.dll => 0x9130f5e7 => 14
	i32 2454642406, ; 356: System.Text.Encoding.dll => 0x924edee6 => 133
	i32 2458678730, ; 357: System.Net.Sockets.dll => 0x928c75ca => 73
	i32 2459001652, ; 358: System.Linq.Parallel.dll => 0x92916334 => 58
	i32 2465532216, ; 359: Xamarin.AndroidX.ConstraintLayout.Core.dll => 0x92f50938 => 214
	i32 2471841756, ; 360: netstandard.dll => 0x93554fdc => 165
	i32 2475788418, ; 361: Java.Interop.dll => 0x93918882 => 166
	i32 2480646305, ; 362: Microsoft.Maui.Controls => 0x93dba8a1 => 188
	i32 2483903535, ; 363: System.ComponentModel.EventBasedAsync => 0x940d5c2f => 15
	i32 2484371297, ; 364: System.Net.ServicePoint => 0x94147f61 => 72
	i32 2490993605, ; 365: System.AppContext.dll => 0x94798bc5 => 6
	i32 2501346920, ; 366: System.Data.DataSetExtensions => 0x95178668 => 23
	i32 2503351294, ; 367: ko\Microsoft.Maui.Controls.resources.dll => 0x95361bfe => 294
	i32 2505896520, ; 368: Xamarin.AndroidX.Lifecycle.Runtime.dll => 0x955cf248 => 236
	i32 2511589265, ; 369: App.ApiClient => 0x95b3cf91 => 312
	i32 2522472828, ; 370: Xamarin.Android.Glide.dll => 0x9659e17c => 195
	i32 2538310050, ; 371: System.Reflection.Emit.Lightweight.dll => 0x974b89a2 => 89
	i32 2550873716, ; 372: hr\Microsoft.Maui.Controls.resources => 0x980b3e74 => 289
	i32 2562349572, ; 373: Microsoft.CSharp => 0x98ba5a04 => 1
	i32 2570120770, ; 374: System.Text.Encodings.Web => 0x9930ee42 => 134
	i32 2576534780, ; 375: ja\Microsoft.Maui.Controls.resources.dll => 0x9992ccfc => 293
	i32 2581783588, ; 376: Xamarin.AndroidX.Lifecycle.Runtime.Ktx => 0x99e2e424 => 237
	i32 2581819634, ; 377: Xamarin.AndroidX.VectorDrawable.dll => 0x99e370f2 => 259
	i32 2585220780, ; 378: System.Text.Encoding.Extensions.dll => 0x9a1756ac => 132
	i32 2585805581, ; 379: System.Net.Ping => 0x9a20430d => 67
	i32 2589602615, ; 380: System.Threading.ThreadPool => 0x9a5a3337 => 144
	i32 2593496499, ; 381: pl\Microsoft.Maui.Controls.resources => 0x9a959db3 => 298
	i32 2605712449, ; 382: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x9b500441 => 277
	i32 2615233544, ; 383: Xamarin.AndroidX.Fragment.Ktx => 0x9be14c08 => 228
	i32 2616218305, ; 384: Microsoft.Extensions.Logging.Debug.dll => 0x9bf052c1 => 183
	i32 2617129537, ; 385: System.Private.Xml.dll => 0x9bfe3a41 => 86
	i32 2618712057, ; 386: System.Reflection.TypeExtensions.dll => 0x9c165ff9 => 94
	i32 2620871830, ; 387: Xamarin.AndroidX.CursorAdapter.dll => 0x9c375496 => 218
	i32 2624644809, ; 388: Xamarin.AndroidX.DynamicAnimation => 0x9c70e6c9 => 223
	i32 2626831493, ; 389: ja\Microsoft.Maui.Controls.resources => 0x9c924485 => 293
	i32 2627185994, ; 390: System.Diagnostics.TextWriterTraceListener.dll => 0x9c97ad4a => 30
	i32 2629843544, ; 391: System.IO.Compression.ZipFile.dll => 0x9cc03a58 => 44
	i32 2633051222, ; 392: Xamarin.AndroidX.Lifecycle.LiveData => 0x9cf12c56 => 232
	i32 2663391936, ; 393: Xamarin.Android.Glide.DiskLruCache => 0x9ec022c0 => 197
	i32 2663698177, ; 394: System.Runtime.Loader => 0x9ec4cf01 => 107
	i32 2664396074, ; 395: System.Xml.XDocument.dll => 0x9ecf752a => 156
	i32 2665622720, ; 396: System.Drawing.Primitives => 0x9ee22cc0 => 34
	i32 2676780864, ; 397: System.Data.Common.dll => 0x9f8c6f40 => 22
	i32 2686887180, ; 398: System.Runtime.Serialization.Xml.dll => 0xa026a50c => 112
	i32 2693849962, ; 399: System.IO.dll => 0xa090e36a => 56
	i32 2701096212, ; 400: Xamarin.AndroidX.Tracing.Tracing => 0xa0ff7514 => 257
	i32 2715334215, ; 401: System.Threading.Tasks.dll => 0xa1d8b647 => 142
	i32 2717744543, ; 402: System.Security.Claims => 0xa1fd7d9f => 116
	i32 2719963679, ; 403: System.Security.Cryptography.Cng.dll => 0xa21f5a1f => 118
	i32 2724373263, ; 404: System.Runtime.Numerics.dll => 0xa262a30f => 108
	i32 2732626843, ; 405: Xamarin.AndroidX.Activity => 0xa2e0939b => 199
	i32 2735172069, ; 406: System.Threading.Channels => 0xa30769e5 => 137
	i32 2737747696, ; 407: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 205
	i32 2740698338, ; 408: ca\Microsoft.Maui.Controls.resources.dll => 0xa35bbce2 => 279
	i32 2740948882, ; 409: System.IO.Pipes.AccessControl => 0xa35f8f92 => 53
	i32 2748088231, ; 410: System.Runtime.InteropServices.JavaScript => 0xa3cc7fa7 => 103
	i32 2752995522, ; 411: pt-BR\Microsoft.Maui.Controls.resources => 0xa41760c2 => 299
	i32 2758225723, ; 412: Microsoft.Maui.Controls.Xaml => 0xa4672f3b => 189
	i32 2764765095, ; 413: Microsoft.Maui.dll => 0xa4caf7a7 => 190
	i32 2765824710, ; 414: System.Text.Encoding.CodePages.dll => 0xa4db22c6 => 131
	i32 2770495804, ; 415: Xamarin.Jetbrains.Annotations.dll => 0xa522693c => 271
	i32 2778768386, ; 416: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 262
	i32 2779977773, ; 417: Xamarin.AndroidX.ResourceInspection.Annotation.dll => 0xa5b3182d => 250
	i32 2785988530, ; 418: th\Microsoft.Maui.Controls.resources => 0xa60ecfb2 => 305
	i32 2788224221, ; 419: Xamarin.AndroidX.Fragment.Ktx.dll => 0xa630ecdd => 228
	i32 2801831435, ; 420: Microsoft.Maui.Graphics => 0xa7008e0b => 192
	i32 2803228030, ; 421: System.Xml.XPath.XDocument.dll => 0xa715dd7e => 157
	i32 2810250172, ; 422: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 215
	i32 2819470561, ; 423: System.Xml.dll => 0xa80db4e1 => 161
	i32 2821205001, ; 424: System.ServiceProcess.dll => 0xa8282c09 => 130
	i32 2821294376, ; 425: Xamarin.AndroidX.ResourceInspection.Annotation => 0xa8298928 => 250
	i32 2824502124, ; 426: System.Xml.XmlDocument => 0xa85a7b6c => 159
	i32 2838993487, ; 427: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx.dll => 0xa9379a4f => 239
	i32 2849599387, ; 428: System.Threading.Overlapped.dll => 0xa9d96f9b => 138
	i32 2853208004, ; 429: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 262
	i32 2855708567, ; 430: Xamarin.AndroidX.Transition => 0xaa36a797 => 258
	i32 2861098320, ; 431: Mono.Android.Export.dll => 0xaa88e550 => 167
	i32 2861189240, ; 432: Microsoft.Maui.Essentials => 0xaa8a4878 => 191
	i32 2870099610, ; 433: Xamarin.AndroidX.Activity.Ktx.dll => 0xab123e9a => 200
	i32 2875164099, ; 434: Jsr305Binding.dll => 0xab5f85c3 => 267
	i32 2875220617, ; 435: System.Globalization.Calendars.dll => 0xab606289 => 39
	i32 2884993177, ; 436: Xamarin.AndroidX.ExifInterface => 0xabf58099 => 226
	i32 2887636118, ; 437: System.Net.dll => 0xac1dd496 => 79
	i32 2899753641, ; 438: System.IO.UnmanagedMemoryStream => 0xacd6baa9 => 55
	i32 2900621748, ; 439: System.Dynamic.Runtime.dll => 0xace3f9b4 => 36
	i32 2901442782, ; 440: System.Reflection => 0xacf080de => 95
	i32 2905242038, ; 441: mscorlib.dll => 0xad2a79b6 => 164
	i32 2909740682, ; 442: System.Private.CoreLib => 0xad6f1e8a => 170
	i32 2916838712, ; 443: Xamarin.AndroidX.ViewPager2.dll => 0xaddb6d38 => 263
	i32 2919462931, ; 444: System.Numerics.Vectors.dll => 0xae037813 => 80
	i32 2921128767, ; 445: Xamarin.AndroidX.Annotation.Experimental.dll => 0xae1ce33f => 202
	i32 2936416060, ; 446: System.Resources.Reader => 0xaf06273c => 96
	i32 2940926066, ; 447: System.Diagnostics.StackTrace.dll => 0xaf4af872 => 29
	i32 2942453041, ; 448: System.Xml.XPath.XDocument => 0xaf624531 => 157
	i32 2959614098, ; 449: System.ComponentModel.dll => 0xb0682092 => 18
	i32 2968338931, ; 450: System.Security.Principal.Windows => 0xb0ed41f3 => 125
	i32 2971004615, ; 451: Microsoft.Extensions.Options.ConfigurationExtensions.dll => 0xb115eec7 => 185
	i32 2972252294, ; 452: System.Security.Cryptography.Algorithms.dll => 0xb128f886 => 117
	i32 2978675010, ; 453: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 222
	i32 2987532451, ; 454: Xamarin.AndroidX.Security.SecurityCrypto => 0xb21220a3 => 253
	i32 2996846495, ; 455: Xamarin.AndroidX.Lifecycle.Process.dll => 0xb2a03f9f => 235
	i32 3016983068, ; 456: Xamarin.AndroidX.Startup.StartupRuntime => 0xb3d3821c => 255
	i32 3020703001, ; 457: Microsoft.Extensions.Diagnostics => 0xb40c4519 => 178
	i32 3023353419, ; 458: WindowsBase.dll => 0xb434b64b => 163
	i32 3024354802, ; 459: Xamarin.AndroidX.Legacy.Support.Core.Utils => 0xb443fdf2 => 230
	i32 3038032645, ; 460: _Microsoft.Android.Resource.Designer.dll => 0xb514b305 => 313
	i32 3053864966, ; 461: fi\Microsoft.Maui.Controls.resources.dll => 0xb6064806 => 285
	i32 3056245963, ; 462: Xamarin.AndroidX.SavedState.SavedState.Ktx => 0xb62a9ccb => 252
	i32 3057625584, ; 463: Xamarin.AndroidX.Navigation.Common => 0xb63fa9f0 => 243
	i32 3059408633, ; 464: Mono.Android.Runtime => 0xb65adef9 => 168
	i32 3059793426, ; 465: System.ComponentModel.Primitives => 0xb660be12 => 16
	i32 3075834255, ; 466: System.Threading.Tasks => 0xb755818f => 142
	i32 3090735792, ; 467: System.Security.Cryptography.X509Certificates.dll => 0xb838e2b0 => 123
	i32 3099732863, ; 468: System.Security.Claims.dll => 0xb8c22b7f => 116
	i32 3103600923, ; 469: System.Formats.Asn1 => 0xb8fd311b => 37
	i32 3111772706, ; 470: System.Runtime.Serialization => 0xb979e222 => 113
	i32 3121463068, ; 471: System.IO.FileSystem.AccessControl.dll => 0xba0dbf1c => 46
	i32 3124832203, ; 472: System.Threading.Tasks.Extensions => 0xba4127cb => 140
	i32 3132293585, ; 473: System.Security.AccessControl => 0xbab301d1 => 115
	i32 3147165239, ; 474: System.Diagnostics.Tracing.dll => 0xbb95ee37 => 33
	i32 3148237826, ; 475: GoogleGson.dll => 0xbba64c02 => 172
	i32 3159123045, ; 476: System.Reflection.Primitives.dll => 0xbc4c6465 => 93
	i32 3160747431, ; 477: System.IO.MemoryMappedFiles => 0xbc652da7 => 52
	i32 3178803400, ; 478: Xamarin.AndroidX.Navigation.Fragment.dll => 0xbd78b0c8 => 244
	i32 3192346100, ; 479: System.Security.SecureString => 0xbe4755f4 => 127
	i32 3193515020, ; 480: System.Web => 0xbe592c0c => 151
	i32 3204380047, ; 481: System.Data.dll => 0xbefef58f => 24
	i32 3209718065, ; 482: System.Xml.XmlDocument.dll => 0xbf506931 => 159
	i32 3211777861, ; 483: Xamarin.AndroidX.DocumentFile => 0xbf6fd745 => 221
	i32 3220365878, ; 484: System.Threading => 0xbff2e236 => 146
	i32 3226221578, ; 485: System.Runtime.Handles.dll => 0xc04c3c0a => 102
	i32 3251039220, ; 486: System.Reflection.DispatchProxy.dll => 0xc1c6ebf4 => 87
	i32 3258312781, ; 487: Xamarin.AndroidX.CardView => 0xc235e84d => 209
	i32 3265493905, ; 488: System.Linq.Queryable.dll => 0xc2a37b91 => 59
	i32 3265893370, ; 489: System.Threading.Tasks.Extensions.dll => 0xc2a993fa => 140
	i32 3277815716, ; 490: System.Resources.Writer.dll => 0xc35f7fa4 => 98
	i32 3279906254, ; 491: Microsoft.Win32.Registry.dll => 0xc37f65ce => 5
	i32 3280506390, ; 492: System.ComponentModel.Annotations.dll => 0xc3888e16 => 13
	i32 3290767353, ; 493: System.Security.Cryptography.Encoding => 0xc4251ff9 => 120
	i32 3299363146, ; 494: System.Text.Encoding => 0xc4a8494a => 133
	i32 3303498502, ; 495: System.Diagnostics.FileVersionInfo => 0xc4e76306 => 27
	i32 3305363605, ; 496: fi\Microsoft.Maui.Controls.resources => 0xc503d895 => 285
	i32 3316684772, ; 497: System.Net.Requests.dll => 0xc5b097e4 => 70
	i32 3317135071, ; 498: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 219
	i32 3317144872, ; 499: System.Data => 0xc5b79d28 => 24
	i32 3332097420, ; 500: MauiBookingApp.dll => 0xc69bc58c => 0
	i32 3340431453, ; 501: Xamarin.AndroidX.Arch.Core.Runtime => 0xc71af05d => 207
	i32 3345895724, ; 502: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller.dll => 0xc76e512c => 248
	i32 3346324047, ; 503: Xamarin.AndroidX.Navigation.Runtime => 0xc774da4f => 245
	i32 3357674450, ; 504: ru\Microsoft.Maui.Controls.resources => 0xc8220bd2 => 302
	i32 3358260929, ; 505: System.Text.Json => 0xc82afec1 => 135
	i32 3362336904, ; 506: Xamarin.AndroidX.Activity.Ktx => 0xc8693088 => 200
	i32 3362522851, ; 507: Xamarin.AndroidX.Core => 0xc86c06e3 => 216
	i32 3366347497, ; 508: Java.Interop => 0xc8a662e9 => 166
	i32 3374999561, ; 509: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 249
	i32 3381016424, ; 510: da\Microsoft.Maui.Controls.resources => 0xc9863768 => 281
	i32 3395150330, ; 511: System.Runtime.CompilerServices.Unsafe.dll => 0xca5de1fa => 99
	i32 3403906625, ; 512: System.Security.Cryptography.OpenSsl.dll => 0xcae37e41 => 121
	i32 3405233483, ; 513: Xamarin.AndroidX.CustomView.PoolingContainer => 0xcaf7bd4b => 220
	i32 3421170118, ; 514: Microsoft.Extensions.Configuration.Binder => 0xcbeae9c6 => 175
	i32 3428513518, ; 515: Microsoft.Extensions.DependencyInjection.dll => 0xcc5af6ee => 176
	i32 3429136800, ; 516: System.Xml => 0xcc6479a0 => 161
	i32 3430777524, ; 517: netstandard => 0xcc7d82b4 => 165
	i32 3441283291, ; 518: Xamarin.AndroidX.DynamicAnimation.dll => 0xcd1dd0db => 223
	i32 3445260447, ; 519: System.Formats.Tar => 0xcd5a809f => 38
	i32 3452344032, ; 520: Microsoft.Maui.Controls.Compatibility.dll => 0xcdc696e0 => 187
	i32 3458724246, ; 521: pt\Microsoft.Maui.Controls.resources.dll => 0xce27f196 => 300
	i32 3471940407, ; 522: System.ComponentModel.TypeConverter.dll => 0xcef19b37 => 17
	i32 3476120550, ; 523: Mono.Android => 0xcf3163e6 => 169
	i32 3484440000, ; 524: ro\Microsoft.Maui.Controls.resources => 0xcfb055c0 => 301
	i32 3485117614, ; 525: System.Text.Json.dll => 0xcfbaacae => 135
	i32 3486566296, ; 526: System.Transactions => 0xcfd0c798 => 148
	i32 3493954962, ; 527: Xamarin.AndroidX.Concurrent.Futures.dll => 0xd0418592 => 212
	i32 3509114376, ; 528: System.Xml.Linq => 0xd128d608 => 153
	i32 3515174580, ; 529: System.Security.dll => 0xd1854eb4 => 128
	i32 3530912306, ; 530: System.Configuration => 0xd2757232 => 19
	i32 3539954161, ; 531: System.Net.HttpListener => 0xd2ff69f1 => 63
	i32 3560100363, ; 532: System.Threading.Timer => 0xd432d20b => 145
	i32 3570554715, ; 533: System.IO.FileSystem.AccessControl => 0xd4d2575b => 46
	i32 3580758918, ; 534: zh-HK\Microsoft.Maui.Controls.resources => 0xd56e0b86 => 309
	i32 3592228221, ; 535: zh-Hant\Microsoft.Maui.Controls.resources.dll => 0xd61d0d7d => 311
	i32 3597029428, ; 536: Xamarin.Android.Glide.GifDecoder.dll => 0xd6665034 => 198
	i32 3598340787, ; 537: System.Net.WebSockets.Client => 0xd67a52b3 => 77
	i32 3608519521, ; 538: System.Linq.dll => 0xd715a361 => 60
	i32 3624195450, ; 539: System.Runtime.InteropServices.RuntimeInformation => 0xd804d57a => 104
	i32 3627220390, ; 540: Xamarin.AndroidX.Print.dll => 0xd832fda6 => 247
	i32 3633644679, ; 541: Xamarin.AndroidX.Annotation.Experimental => 0xd8950487 => 202
	i32 3638274909, ; 542: System.IO.FileSystem.Primitives.dll => 0xd8dbab5d => 48
	i32 3641597786, ; 543: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 233
	i32 3643446276, ; 544: tr\Microsoft.Maui.Controls.resources => 0xd92a9404 => 306
	i32 3643854240, ; 545: Xamarin.AndroidX.Navigation.Fragment => 0xd930cda0 => 244
	i32 3645089577, ; 546: System.ComponentModel.DataAnnotations => 0xd943a729 => 14
	i32 3657292374, ; 547: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd9fdda56 => 174
	i32 3660523487, ; 548: System.Net.NetworkInformation => 0xda2f27df => 66
	i32 3672681054, ; 549: Mono.Android.dll => 0xdae8aa5e => 169
	i32 3682565725, ; 550: Xamarin.AndroidX.Browser => 0xdb7f7e5d => 208
	i32 3684561358, ; 551: Xamarin.AndroidX.Concurrent.Futures => 0xdb9df1ce => 212
	i32 3700866549, ; 552: System.Net.WebProxy.dll => 0xdc96bdf5 => 76
	i32 3706696989, ; 553: Xamarin.AndroidX.Core.Core.Ktx.dll => 0xdcefb51d => 217
	i32 3716563718, ; 554: System.Runtime.Intrinsics => 0xdd864306 => 106
	i32 3718780102, ; 555: Xamarin.AndroidX.Annotation => 0xdda814c6 => 201
	i32 3724971120, ; 556: Xamarin.AndroidX.Navigation.Common.dll => 0xde068c70 => 243
	i32 3732100267, ; 557: System.Net.NameResolution => 0xde7354ab => 65
	i32 3737834244, ; 558: System.Net.Http.Json.dll => 0xdecad304 => 194
	i32 3748608112, ; 559: System.Diagnostics.DiagnosticSource => 0xdf6f3870 => 193
	i32 3751444290, ; 560: System.Xml.XPath => 0xdf9a7f42 => 158
	i32 3751619990, ; 561: da\Microsoft.Maui.Controls.resources.dll => 0xdf9d2d96 => 281
	i32 3777185015, ; 562: App.ApiClient.dll => 0xe12344f7 => 312
	i32 3786282454, ; 563: Xamarin.AndroidX.Collection => 0xe1ae15d6 => 210
	i32 3792276235, ; 564: System.Collections.NonGeneric => 0xe2098b0b => 10
	i32 3800979733, ; 565: Microsoft.Maui.Controls.Compatibility => 0xe28e5915 => 187
	i32 3802395368, ; 566: System.Collections.Specialized.dll => 0xe2a3f2e8 => 11
	i32 3819260425, ; 567: System.Net.WebProxy => 0xe3a54a09 => 76
	i32 3823082795, ; 568: System.Security.Cryptography.dll => 0xe3df9d2b => 124
	i32 3829621856, ; 569: System.Numerics.dll => 0xe4436460 => 81
	i32 3841636137, ; 570: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xe4fab729 => 177
	i32 3844307129, ; 571: System.Net.Mail.dll => 0xe52378b9 => 64
	i32 3849253459, ; 572: System.Runtime.InteropServices.dll => 0xe56ef253 => 105
	i32 3870376305, ; 573: System.Net.HttpListener.dll => 0xe6b14171 => 63
	i32 3873536506, ; 574: System.Security.Principal => 0xe6e179fa => 126
	i32 3875112723, ; 575: System.Security.Cryptography.Encoding.dll => 0xe6f98713 => 120
	i32 3885497537, ; 576: System.Net.WebHeaderCollection.dll => 0xe797fcc1 => 75
	i32 3885922214, ; 577: Xamarin.AndroidX.Transition.dll => 0xe79e77a6 => 258
	i32 3888767677, ; 578: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller => 0xe7c9e2bd => 248
	i32 3896106733, ; 579: System.Collections.Concurrent.dll => 0xe839deed => 8
	i32 3896760992, ; 580: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 216
	i32 3901907137, ; 581: Microsoft.VisualBasic.Core.dll => 0xe89260c1 => 2
	i32 3920221145, ; 582: nl\Microsoft.Maui.Controls.resources.dll => 0xe9a9d3d9 => 297
	i32 3920810846, ; 583: System.IO.Compression.FileSystem.dll => 0xe9b2d35e => 43
	i32 3921031405, ; 584: Xamarin.AndroidX.VersionedParcelable.dll => 0xe9b630ed => 261
	i32 3928044579, ; 585: System.Xml.ReaderWriter => 0xea213423 => 154
	i32 3930554604, ; 586: System.Security.Principal.dll => 0xea4780ec => 126
	i32 3931092270, ; 587: Xamarin.AndroidX.Navigation.UI => 0xea4fb52e => 246
	i32 3945713374, ; 588: System.Data.DataSetExtensions.dll => 0xeb2ecede => 23
	i32 3953953790, ; 589: System.Text.Encoding.CodePages => 0xebac8bfe => 131
	i32 3955647286, ; 590: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 204
	i32 3959773229, ; 591: Xamarin.AndroidX.Lifecycle.Process => 0xec05582d => 235
	i32 4003436829, ; 592: System.Diagnostics.Process.dll => 0xee9f991d => 28
	i32 4015948917, ; 593: Xamarin.AndroidX.Annotation.Jvm.dll => 0xef5e8475 => 203
	i32 4025784931, ; 594: System.Memory => 0xeff49a63 => 61
	i32 4046471985, ; 595: Microsoft.Maui.Controls.Xaml.dll => 0xf1304331 => 189
	i32 4054681211, ; 596: System.Reflection.Emit.ILGeneration => 0xf1ad867b => 88
	i32 4068434129, ; 597: System.Private.Xml.Linq.dll => 0xf27f60d1 => 85
	i32 4073602200, ; 598: System.Threading.dll => 0xf2ce3c98 => 146
	i32 4091086043, ; 599: el\Microsoft.Maui.Controls.resources.dll => 0xf3d904db => 283
	i32 4094352644, ; 600: Microsoft.Maui.Essentials.dll => 0xf40add04 => 191
	i32 4099507663, ; 601: System.Drawing.dll => 0xf45985cf => 35
	i32 4100113165, ; 602: System.Private.Uri => 0xf462c30d => 84
	i32 4101593132, ; 603: Xamarin.AndroidX.Emoji2 => 0xf479582c => 224
	i32 4103439459, ; 604: uk\Microsoft.Maui.Controls.resources.dll => 0xf4958463 => 307
	i32 4126470640, ; 605: Microsoft.Extensions.DependencyInjection => 0xf5f4f1f0 => 176
	i32 4127667938, ; 606: System.IO.FileSystem.Watcher => 0xf60736e2 => 49
	i32 4130442656, ; 607: System.AppContext => 0xf6318da0 => 6
	i32 4147896353, ; 608: System.Reflection.Emit.ILGeneration.dll => 0xf73be021 => 88
	i32 4150914736, ; 609: uk\Microsoft.Maui.Controls.resources => 0xf769eeb0 => 307
	i32 4151237749, ; 610: System.Core => 0xf76edc75 => 21
	i32 4159265925, ; 611: System.Xml.XmlSerializer => 0xf7e95c85 => 160
	i32 4161255271, ; 612: System.Reflection.TypeExtensions => 0xf807b767 => 94
	i32 4164802419, ; 613: System.IO.FileSystem.Watcher.dll => 0xf83dd773 => 49
	i32 4181436372, ; 614: System.Runtime.Serialization.Primitives => 0xf93ba7d4 => 111
	i32 4182413190, ; 615: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0xf94a8f86 => 240
	i32 4185676441, ; 616: System.Security => 0xf97c5a99 => 128
	i32 4196529839, ; 617: System.Net.WebClient.dll => 0xfa21f6af => 74
	i32 4213026141, ; 618: System.Diagnostics.DiagnosticSource.dll => 0xfb1dad5d => 193
	i32 4249188766, ; 619: nb\Microsoft.Maui.Controls.resources.dll => 0xfd45799e => 296
	i32 4256097574, ; 620: Xamarin.AndroidX.Core.Core.Ktx => 0xfdaee526 => 217
	i32 4258378803, ; 621: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx => 0xfdd1b433 => 239
	i32 4260525087, ; 622: System.Buffers => 0xfdf2741f => 7
	i32 4271975918, ; 623: Microsoft.Maui.Controls.dll => 0xfea12dee => 188
	i32 4274623895, ; 624: CommunityToolkit.Mvvm.dll => 0xfec99597 => 171
	i32 4274976490, ; 625: System.Runtime.Numerics => 0xfecef6ea => 108
	i32 4292120959, ; 626: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xffd4917f => 240
	i32 4294763496 ; 627: Xamarin.AndroidX.ExifInterface.dll => 0xfffce3e8 => 226
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [628 x i32] [
	i32 66, ; 0
	i32 65, ; 1
	i32 106, ; 2
	i32 236, ; 3
	i32 270, ; 4
	i32 47, ; 5
	i32 278, ; 6
	i32 78, ; 7
	i32 287, ; 8
	i32 143, ; 9
	i32 29, ; 10
	i32 311, ; 11
	i32 122, ; 12
	i32 192, ; 13
	i32 100, ; 14
	i32 295, ; 15
	i32 179, ; 16
	i32 254, ; 17
	i32 105, ; 18
	i32 254, ; 19
	i32 137, ; 20
	i32 274, ; 21
	i32 310, ; 22
	i32 303, ; 23
	i32 75, ; 24
	i32 122, ; 25
	i32 13, ; 26
	i32 210, ; 27
	i32 130, ; 28
	i32 256, ; 29
	i32 149, ; 30
	i32 18, ; 31
	i32 208, ; 32
	i32 26, ; 33
	i32 178, ; 34
	i32 230, ; 35
	i32 1, ; 36
	i32 58, ; 37
	i32 41, ; 38
	i32 89, ; 39
	i32 213, ; 40
	i32 145, ; 41
	i32 232, ; 42
	i32 229, ; 43
	i32 53, ; 44
	i32 180, ; 45
	i32 67, ; 46
	i32 308, ; 47
	i32 199, ; 48
	i32 81, ; 49
	i32 286, ; 50
	i32 231, ; 51
	i32 129, ; 52
	i32 54, ; 53
	i32 147, ; 54
	i32 72, ; 55
	i32 143, ; 56
	i32 61, ; 57
	i32 144, ; 58
	i32 313, ; 59
	i32 163, ; 60
	i32 306, ; 61
	i32 214, ; 62
	i32 12, ; 63
	i32 227, ; 64
	i32 123, ; 65
	i32 150, ; 66
	i32 111, ; 67
	i32 164, ; 68
	i32 162, ; 69
	i32 229, ; 70
	i32 242, ; 71
	i32 284, ; 72
	i32 82, ; 73
	i32 186, ; 74
	i32 148, ; 75
	i32 274, ; 76
	i32 59, ; 77
	i32 305, ; 78
	i32 181, ; 79
	i32 50, ; 80
	i32 101, ; 81
	i32 112, ; 82
	i32 39, ; 83
	i32 267, ; 84
	i32 265, ; 85
	i32 118, ; 86
	i32 51, ; 87
	i32 43, ; 88
	i32 117, ; 89
	i32 219, ; 90
	i32 297, ; 91
	i32 225, ; 92
	i32 79, ; 93
	i32 134, ; 94
	i32 261, ; 95
	i32 206, ; 96
	i32 8, ; 97
	i32 71, ; 98
	i32 153, ; 99
	i32 276, ; 100
	i32 152, ; 101
	i32 90, ; 102
	i32 271, ; 103
	i32 44, ; 104
	i32 275, ; 105
	i32 107, ; 106
	i32 185, ; 107
	i32 127, ; 108
	i32 25, ; 109
	i32 196, ; 110
	i32 70, ; 111
	i32 54, ; 112
	i32 45, ; 113
	i32 303, ; 114
	i32 184, ; 115
	i32 220, ; 116
	i32 22, ; 117
	i32 234, ; 118
	i32 84, ; 119
	i32 42, ; 120
	i32 158, ; 121
	i32 69, ; 122
	i32 247, ; 123
	i32 288, ; 124
	i32 3, ; 125
	i32 41, ; 126
	i32 194, ; 127
	i32 302, ; 128
	i32 16, ; 129
	i32 52, ; 130
	i32 299, ; 131
	i32 270, ; 132
	i32 103, ; 133
	i32 275, ; 134
	i32 292, ; 135
	i32 268, ; 136
	i32 231, ; 137
	i32 33, ; 138
	i32 156, ; 139
	i32 83, ; 140
	i32 31, ; 141
	i32 301, ; 142
	i32 12, ; 143
	i32 50, ; 144
	i32 55, ; 145
	i32 251, ; 146
	i32 35, ; 147
	i32 177, ; 148
	i32 269, ; 149
	i32 204, ; 150
	i32 34, ; 151
	i32 282, ; 152
	i32 57, ; 153
	i32 179, ; 154
	i32 238, ; 155
	i32 172, ; 156
	i32 17, ; 157
	i32 272, ; 158
	i32 162, ; 159
	i32 304, ; 160
	i32 298, ; 161
	i32 294, ; 162
	i32 237, ; 163
	i32 183, ; 164
	i32 264, ; 165
	i32 300, ; 166
	i32 151, ; 167
	i32 260, ; 168
	i32 245, ; 169
	i32 206, ; 170
	i32 28, ; 171
	i32 171, ; 172
	i32 51, ; 173
	i32 265, ; 174
	i32 5, ; 175
	i32 280, ; 176
	i32 255, ; 177
	i32 259, ; 178
	i32 211, ; 179
	i32 276, ; 180
	i32 203, ; 181
	i32 222, ; 182
	i32 289, ; 183
	i32 83, ; 184
	i32 264, ; 185
	i32 60, ; 186
	i32 110, ; 187
	i32 309, ; 188
	i32 56, ; 189
	i32 310, ; 190
	i32 251, ; 191
	i32 97, ; 192
	i32 19, ; 193
	i32 215, ; 194
	i32 109, ; 195
	i32 99, ; 196
	i32 100, ; 197
	i32 278, ; 198
	i32 102, ; 199
	i32 268, ; 200
	i32 69, ; 201
	i32 37, ; 202
	i32 31, ; 203
	i32 101, ; 204
	i32 71, ; 205
	i32 284, ; 206
	i32 9, ; 207
	i32 121, ; 208
	i32 45, ; 209
	i32 205, ; 210
	i32 186, ; 211
	i32 9, ; 212
	i32 42, ; 213
	i32 4, ; 214
	i32 252, ; 215
	i32 180, ; 216
	i32 308, ; 217
	i32 30, ; 218
	i32 136, ; 219
	i32 90, ; 220
	i32 91, ; 221
	i32 48, ; 222
	i32 139, ; 223
	i32 110, ; 224
	i32 138, ; 225
	i32 221, ; 226
	i32 113, ; 227
	i32 269, ; 228
	i32 155, ; 229
	i32 74, ; 230
	i32 77, ; 231
	i32 241, ; 232
	i32 36, ; 233
	i32 263, ; 234
	i32 225, ; 235
	i32 218, ; 236
	i32 62, ; 237
	i32 136, ; 238
	i32 15, ; 239
	i32 114, ; 240
	i32 257, ; 241
	i32 266, ; 242
	i32 213, ; 243
	i32 47, ; 244
	i32 68, ; 245
	i32 78, ; 246
	i32 124, ; 247
	i32 92, ; 248
	i32 119, ; 249
	i32 273, ; 250
	i32 26, ; 251
	i32 234, ; 252
	i32 95, ; 253
	i32 27, ; 254
	i32 209, ; 255
	i32 279, ; 256
	i32 147, ; 257
	i32 167, ; 258
	i32 4, ; 259
	i32 96, ; 260
	i32 32, ; 261
	i32 91, ; 262
	i32 256, ; 263
	i32 181, ; 264
	i32 21, ; 265
	i32 40, ; 266
	i32 168, ; 267
	i32 295, ; 268
	i32 227, ; 269
	i32 287, ; 270
	i32 241, ; 271
	i32 272, ; 272
	i32 266, ; 273
	i32 246, ; 274
	i32 2, ; 275
	i32 132, ; 276
	i32 109, ; 277
	i32 182, ; 278
	i32 196, ; 279
	i32 304, ; 280
	i32 57, ; 281
	i32 93, ; 282
	i32 286, ; 283
	i32 38, ; 284
	i32 207, ; 285
	i32 25, ; 286
	i32 92, ; 287
	i32 280, ; 288
	i32 87, ; 289
	i32 97, ; 290
	i32 10, ; 291
	i32 85, ; 292
	i32 291, ; 293
	i32 98, ; 294
	i32 253, ; 295
	i32 173, ; 296
	i32 273, ; 297
	i32 198, ; 298
	i32 283, ; 299
	i32 7, ; 300
	i32 238, ; 301
	i32 195, ; 302
	i32 86, ; 303
	i32 175, ; 304
	i32 233, ; 305
	i32 152, ; 306
	i32 282, ; 307
	i32 32, ; 308
	i32 114, ; 309
	i32 80, ; 310
	i32 20, ; 311
	i32 0, ; 312
	i32 11, ; 313
	i32 160, ; 314
	i32 3, ; 315
	i32 190, ; 316
	i32 290, ; 317
	i32 184, ; 318
	i32 182, ; 319
	i32 82, ; 320
	i32 277, ; 321
	i32 62, ; 322
	i32 292, ; 323
	i32 260, ; 324
	i32 141, ; 325
	i32 242, ; 326
	i32 155, ; 327
	i32 40, ; 328
	i32 115, ; 329
	i32 174, ; 330
	i32 197, ; 331
	i32 249, ; 332
	i32 129, ; 333
	i32 73, ; 334
	i32 64, ; 335
	i32 296, ; 336
	i32 170, ; 337
	i32 201, ; 338
	i32 141, ; 339
	i32 104, ; 340
	i32 149, ; 341
	i32 68, ; 342
	i32 290, ; 343
	i32 154, ; 344
	i32 173, ; 345
	i32 119, ; 346
	i32 125, ; 347
	i32 291, ; 348
	i32 150, ; 349
	i32 224, ; 350
	i32 139, ; 351
	i32 211, ; 352
	i32 288, ; 353
	i32 20, ; 354
	i32 14, ; 355
	i32 133, ; 356
	i32 73, ; 357
	i32 58, ; 358
	i32 214, ; 359
	i32 165, ; 360
	i32 166, ; 361
	i32 188, ; 362
	i32 15, ; 363
	i32 72, ; 364
	i32 6, ; 365
	i32 23, ; 366
	i32 294, ; 367
	i32 236, ; 368
	i32 312, ; 369
	i32 195, ; 370
	i32 89, ; 371
	i32 289, ; 372
	i32 1, ; 373
	i32 134, ; 374
	i32 293, ; 375
	i32 237, ; 376
	i32 259, ; 377
	i32 132, ; 378
	i32 67, ; 379
	i32 144, ; 380
	i32 298, ; 381
	i32 277, ; 382
	i32 228, ; 383
	i32 183, ; 384
	i32 86, ; 385
	i32 94, ; 386
	i32 218, ; 387
	i32 223, ; 388
	i32 293, ; 389
	i32 30, ; 390
	i32 44, ; 391
	i32 232, ; 392
	i32 197, ; 393
	i32 107, ; 394
	i32 156, ; 395
	i32 34, ; 396
	i32 22, ; 397
	i32 112, ; 398
	i32 56, ; 399
	i32 257, ; 400
	i32 142, ; 401
	i32 116, ; 402
	i32 118, ; 403
	i32 108, ; 404
	i32 199, ; 405
	i32 137, ; 406
	i32 205, ; 407
	i32 279, ; 408
	i32 53, ; 409
	i32 103, ; 410
	i32 299, ; 411
	i32 189, ; 412
	i32 190, ; 413
	i32 131, ; 414
	i32 271, ; 415
	i32 262, ; 416
	i32 250, ; 417
	i32 305, ; 418
	i32 228, ; 419
	i32 192, ; 420
	i32 157, ; 421
	i32 215, ; 422
	i32 161, ; 423
	i32 130, ; 424
	i32 250, ; 425
	i32 159, ; 426
	i32 239, ; 427
	i32 138, ; 428
	i32 262, ; 429
	i32 258, ; 430
	i32 167, ; 431
	i32 191, ; 432
	i32 200, ; 433
	i32 267, ; 434
	i32 39, ; 435
	i32 226, ; 436
	i32 79, ; 437
	i32 55, ; 438
	i32 36, ; 439
	i32 95, ; 440
	i32 164, ; 441
	i32 170, ; 442
	i32 263, ; 443
	i32 80, ; 444
	i32 202, ; 445
	i32 96, ; 446
	i32 29, ; 447
	i32 157, ; 448
	i32 18, ; 449
	i32 125, ; 450
	i32 185, ; 451
	i32 117, ; 452
	i32 222, ; 453
	i32 253, ; 454
	i32 235, ; 455
	i32 255, ; 456
	i32 178, ; 457
	i32 163, ; 458
	i32 230, ; 459
	i32 313, ; 460
	i32 285, ; 461
	i32 252, ; 462
	i32 243, ; 463
	i32 168, ; 464
	i32 16, ; 465
	i32 142, ; 466
	i32 123, ; 467
	i32 116, ; 468
	i32 37, ; 469
	i32 113, ; 470
	i32 46, ; 471
	i32 140, ; 472
	i32 115, ; 473
	i32 33, ; 474
	i32 172, ; 475
	i32 93, ; 476
	i32 52, ; 477
	i32 244, ; 478
	i32 127, ; 479
	i32 151, ; 480
	i32 24, ; 481
	i32 159, ; 482
	i32 221, ; 483
	i32 146, ; 484
	i32 102, ; 485
	i32 87, ; 486
	i32 209, ; 487
	i32 59, ; 488
	i32 140, ; 489
	i32 98, ; 490
	i32 5, ; 491
	i32 13, ; 492
	i32 120, ; 493
	i32 133, ; 494
	i32 27, ; 495
	i32 285, ; 496
	i32 70, ; 497
	i32 219, ; 498
	i32 24, ; 499
	i32 0, ; 500
	i32 207, ; 501
	i32 248, ; 502
	i32 245, ; 503
	i32 302, ; 504
	i32 135, ; 505
	i32 200, ; 506
	i32 216, ; 507
	i32 166, ; 508
	i32 249, ; 509
	i32 281, ; 510
	i32 99, ; 511
	i32 121, ; 512
	i32 220, ; 513
	i32 175, ; 514
	i32 176, ; 515
	i32 161, ; 516
	i32 165, ; 517
	i32 223, ; 518
	i32 38, ; 519
	i32 187, ; 520
	i32 300, ; 521
	i32 17, ; 522
	i32 169, ; 523
	i32 301, ; 524
	i32 135, ; 525
	i32 148, ; 526
	i32 212, ; 527
	i32 153, ; 528
	i32 128, ; 529
	i32 19, ; 530
	i32 63, ; 531
	i32 145, ; 532
	i32 46, ; 533
	i32 309, ; 534
	i32 311, ; 535
	i32 198, ; 536
	i32 77, ; 537
	i32 60, ; 538
	i32 104, ; 539
	i32 247, ; 540
	i32 202, ; 541
	i32 48, ; 542
	i32 233, ; 543
	i32 306, ; 544
	i32 244, ; 545
	i32 14, ; 546
	i32 174, ; 547
	i32 66, ; 548
	i32 169, ; 549
	i32 208, ; 550
	i32 212, ; 551
	i32 76, ; 552
	i32 217, ; 553
	i32 106, ; 554
	i32 201, ; 555
	i32 243, ; 556
	i32 65, ; 557
	i32 194, ; 558
	i32 193, ; 559
	i32 158, ; 560
	i32 281, ; 561
	i32 312, ; 562
	i32 210, ; 563
	i32 10, ; 564
	i32 187, ; 565
	i32 11, ; 566
	i32 76, ; 567
	i32 124, ; 568
	i32 81, ; 569
	i32 177, ; 570
	i32 64, ; 571
	i32 105, ; 572
	i32 63, ; 573
	i32 126, ; 574
	i32 120, ; 575
	i32 75, ; 576
	i32 258, ; 577
	i32 248, ; 578
	i32 8, ; 579
	i32 216, ; 580
	i32 2, ; 581
	i32 297, ; 582
	i32 43, ; 583
	i32 261, ; 584
	i32 154, ; 585
	i32 126, ; 586
	i32 246, ; 587
	i32 23, ; 588
	i32 131, ; 589
	i32 204, ; 590
	i32 235, ; 591
	i32 28, ; 592
	i32 203, ; 593
	i32 61, ; 594
	i32 189, ; 595
	i32 88, ; 596
	i32 85, ; 597
	i32 146, ; 598
	i32 283, ; 599
	i32 191, ; 600
	i32 35, ; 601
	i32 84, ; 602
	i32 224, ; 603
	i32 307, ; 604
	i32 176, ; 605
	i32 49, ; 606
	i32 6, ; 607
	i32 88, ; 608
	i32 307, ; 609
	i32 21, ; 610
	i32 160, ; 611
	i32 94, ; 612
	i32 49, ; 613
	i32 111, ; 614
	i32 240, ; 615
	i32 128, ; 616
	i32 74, ; 617
	i32 193, ; 618
	i32 296, ; 619
	i32 217, ; 620
	i32 239, ; 621
	i32 7, ; 622
	i32 188, ; 623
	i32 171, ; 624
	i32 108, ; 625
	i32 240, ; 626
	i32 226 ; 627
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 4

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 4

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 4

; Functions

; Function attributes: "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" uwtable willreturn
define void @xamarin_app_init(ptr nocapture noundef readnone %env, ptr noundef %fn) local_unnamed_addr #0
{
	%fnIsNull = icmp eq ptr %fn, null
	br i1 %fnIsNull, label %1, label %2

1: ; preds = %0
	%putsResult = call noundef i32 @puts(ptr @.str.0)
	call void @abort()
	unreachable 

2: ; preds = %1, %0
	store ptr %fn, ptr @get_function_pointer, align 4, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 1

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-aes,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-sha2,-thumb-mode,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-aes,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-sha2,-thumb-mode,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" }

; Metadata
!llvm.module.flags = !{!0, !1, !7}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.1xx @ f1b7113872c8db3dfee70d11925e81bb752dc8d0"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"min_enum_size", i32 4}
