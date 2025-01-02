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

@assembly_image_cache = dso_local local_unnamed_addr global [320 x ptr] zeroinitializer, align 4

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [634 x i32] [
	i32 2616222, ; 0: System.Net.NetworkInformation.dll => 0x27eb9e => 66
	i32 10166715, ; 1: System.Net.NameResolution.dll => 0x9b21bb => 65
	i32 15721112, ; 2: System.Runtime.Intrinsics.dll => 0xefe298 => 106
	i32 32687329, ; 3: Xamarin.AndroidX.Lifecycle.Runtime => 0x1f2c4e1 => 239
	i32 34715100, ; 4: Xamarin.Google.Guava.ListenableFuture.dll => 0x211b5dc => 273
	i32 34839235, ; 5: System.IO.FileSystem.DriveInfo => 0x2139ac3 => 47
	i32 38948123, ; 6: ar\Microsoft.Maui.Controls.resources.dll => 0x2524d1b => 281
	i32 39109920, ; 7: Newtonsoft.Json.dll => 0x254c520 => 195
	i32 39485524, ; 8: System.Net.WebSockets.dll => 0x25a8054 => 78
	i32 42244203, ; 9: he\Microsoft.Maui.Controls.resources.dll => 0x284986b => 290
	i32 42639949, ; 10: System.Threading.Thread => 0x28aa24d => 143
	i32 66541672, ; 11: System.Diagnostics.StackTrace => 0x3f75868 => 29
	i32 67008169, ; 12: zh-Hant\Microsoft.Maui.Controls.resources => 0x3fe76a9 => 314
	i32 68219467, ; 13: System.Security.Cryptography.Primitives => 0x410f24b => 122
	i32 72070932, ; 14: Microsoft.Maui.Graphics.dll => 0x44bb714 => 194
	i32 82292897, ; 15: System.Runtime.CompilerServices.VisualC.dll => 0x4e7b0a1 => 100
	i32 83839681, ; 16: ms\Microsoft.Maui.Controls.resources.dll => 0x4ff4ac1 => 298
	i32 98325684, ; 17: Microsoft.Extensions.Diagnostics.Abstractions => 0x5dc54b4 => 181
	i32 101534019, ; 18: Xamarin.AndroidX.SlidingPaneLayout => 0x60d4943 => 257
	i32 117431740, ; 19: System.Runtime.InteropServices => 0x6ffddbc => 105
	i32 120558881, ; 20: Xamarin.AndroidX.SlidingPaneLayout.dll => 0x72f9521 => 257
	i32 122350210, ; 21: System.Threading.Channels.dll => 0x74aea82 => 137
	i32 134690465, ; 22: Xamarin.Kotlin.StdLib.Jdk7.dll => 0x80736a1 => 277
	i32 136584136, ; 23: zh-Hans\Microsoft.Maui.Controls.resources.dll => 0x8241bc8 => 313
	i32 140062828, ; 24: sk\Microsoft.Maui.Controls.resources.dll => 0x859306c => 306
	i32 142721839, ; 25: System.Net.WebHeaderCollection => 0x881c32f => 75
	i32 149972175, ; 26: System.Security.Cryptography.Primitives.dll => 0x8f064cf => 122
	i32 159306688, ; 27: System.ComponentModel.Annotations => 0x97ed3c0 => 13
	i32 165246403, ; 28: Xamarin.AndroidX.Collection.dll => 0x9d975c3 => 213
	i32 176265551, ; 29: System.ServiceProcess => 0xa81994f => 130
	i32 182336117, ; 30: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 259
	i32 184328833, ; 31: System.ValueTuple.dll => 0xafca281 => 149
	i32 205061960, ; 32: System.ComponentModel => 0xc38ff48 => 18
	i32 209399409, ; 33: Xamarin.AndroidX.Browser.dll => 0xc7b2e71 => 211
	i32 220171995, ; 34: System.Diagnostics.Debug => 0xd1f8edb => 26
	i32 221958352, ; 35: Microsoft.Extensions.Diagnostics.dll => 0xd3ad0d0 => 180
	i32 230216969, ; 36: Xamarin.AndroidX.Legacy.Support.Core.Utils.dll => 0xdb8d509 => 233
	i32 230752869, ; 37: Microsoft.CSharp.dll => 0xdc10265 => 1
	i32 231409092, ; 38: System.Linq.Parallel => 0xdcb05c4 => 58
	i32 231814094, ; 39: System.Globalization => 0xdd133ce => 41
	i32 246610117, ; 40: System.Reflection.Emit.Lightweight => 0xeb2f8c5 => 89
	i32 261689757, ; 41: Xamarin.AndroidX.ConstraintLayout.dll => 0xf99119d => 216
	i32 276479776, ; 42: System.Threading.Timer.dll => 0x107abf20 => 145
	i32 278686392, ; 43: Xamarin.AndroidX.Lifecycle.LiveData.dll => 0x109c6ab8 => 235
	i32 280482487, ; 44: Xamarin.AndroidX.Interpolator => 0x10b7d2b7 => 232
	i32 291076382, ; 45: System.IO.Pipes.AccessControl.dll => 0x1159791e => 53
	i32 291275502, ; 46: Microsoft.Extensions.Http.dll => 0x115c82ee => 182
	i32 298918909, ; 47: System.Net.Ping.dll => 0x11d123fd => 67
	i32 317674968, ; 48: vi\Microsoft.Maui.Controls.resources => 0x12ef55d8 => 311
	i32 318968648, ; 49: Xamarin.AndroidX.Activity.dll => 0x13031348 => 202
	i32 321597661, ; 50: System.Numerics => 0x132b30dd => 81
	i32 321963286, ; 51: fr\Microsoft.Maui.Controls.resources.dll => 0x1330c516 => 289
	i32 342366114, ; 52: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 234
	i32 360082299, ; 53: System.ServiceModel.Web => 0x15766b7b => 129
	i32 367780167, ; 54: System.IO.Pipes => 0x15ebe147 => 54
	i32 374914964, ; 55: System.Transactions.Local => 0x1658bf94 => 147
	i32 375677976, ; 56: System.Net.ServicePoint.dll => 0x16646418 => 72
	i32 379916513, ; 57: System.Threading.Thread.dll => 0x16a510e1 => 143
	i32 385762202, ; 58: System.Memory.dll => 0x16fe439a => 61
	i32 392610295, ; 59: System.Threading.ThreadPool.dll => 0x1766c1f7 => 144
	i32 395744057, ; 60: _Microsoft.Android.Resource.Designer => 0x17969339 => 316
	i32 403441872, ; 61: WindowsBase => 0x180c08d0 => 163
	i32 409257351, ; 62: tr\Microsoft.Maui.Controls.resources.dll => 0x1864c587 => 309
	i32 441335492, ; 63: Xamarin.AndroidX.ConstraintLayout.Core => 0x1a4e3ec4 => 217
	i32 442565967, ; 64: System.Collections => 0x1a61054f => 12
	i32 450948140, ; 65: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 230
	i32 451504562, ; 66: System.Security.Cryptography.X509Certificates => 0x1ae969b2 => 123
	i32 456227837, ; 67: System.Web.HttpUtility.dll => 0x1b317bfd => 150
	i32 459347974, ; 68: System.Runtime.Serialization.Primitives.dll => 0x1b611806 => 111
	i32 465846621, ; 69: mscorlib => 0x1bc4415d => 164
	i32 469710990, ; 70: System.dll => 0x1bff388e => 162
	i32 476646585, ; 71: Xamarin.AndroidX.Interpolator.dll => 0x1c690cb9 => 232
	i32 486930444, ; 72: Xamarin.AndroidX.LocalBroadcastManager.dll => 0x1d05f80c => 245
	i32 489220957, ; 73: es\Microsoft.Maui.Controls.resources.dll => 0x1d28eb5d => 287
	i32 498788369, ; 74: System.ObjectModel => 0x1dbae811 => 82
	i32 513247710, ; 75: Microsoft.Extensions.Primitives.dll => 0x1e9789de => 188
	i32 526420162, ; 76: System.Transactions.dll => 0x1f6088c2 => 148
	i32 527452488, ; 77: Xamarin.Kotlin.StdLib.Jdk7 => 0x1f704948 => 277
	i32 530272170, ; 78: System.Linq.Queryable => 0x1f9b4faa => 59
	i32 538707440, ; 79: th\Microsoft.Maui.Controls.resources.dll => 0x201c05f0 => 308
	i32 539058512, ; 80: Microsoft.Extensions.Logging => 0x20216150 => 183
	i32 540030774, ; 81: System.IO.FileSystem.dll => 0x20303736 => 50
	i32 545304856, ; 82: System.Runtime.Extensions => 0x2080b118 => 101
	i32 546455878, ; 83: System.Runtime.Serialization.Xml => 0x20924146 => 112
	i32 549171840, ; 84: System.Globalization.Calendars => 0x20bbb280 => 39
	i32 557405415, ; 85: Jsr305Binding => 0x213954e7 => 270
	i32 569601784, ; 86: Xamarin.AndroidX.Window.Extensions.Core.Core => 0x21f36ef8 => 268
	i32 577335427, ; 87: System.Security.Cryptography.Cng => 0x22697083 => 118
	i32 597488923, ; 88: CommunityToolkit.Maui => 0x239cf51b => 171
	i32 601371474, ; 89: System.IO.IsolatedStorage.dll => 0x23d83352 => 51
	i32 605376203, ; 90: System.IO.Compression.FileSystem => 0x24154ecb => 43
	i32 613668793, ; 91: System.Security.Cryptography.Algorithms => 0x2493d7b9 => 117
	i32 627609679, ; 92: Xamarin.AndroidX.CustomView => 0x2568904f => 222
	i32 627931235, ; 93: nl\Microsoft.Maui.Controls.resources => 0x256d7863 => 300
	i32 639843206, ; 94: Xamarin.AndroidX.Emoji2.ViewsHelper.dll => 0x26233b86 => 228
	i32 643868501, ; 95: System.Net => 0x2660a755 => 79
	i32 662205335, ; 96: System.Text.Encodings.Web.dll => 0x27787397 => 134
	i32 663517072, ; 97: Xamarin.AndroidX.VersionedParcelable => 0x278c7790 => 264
	i32 666292255, ; 98: Xamarin.AndroidX.Arch.Core.Common.dll => 0x27b6d01f => 209
	i32 672442732, ; 99: System.Collections.Concurrent => 0x2814a96c => 8
	i32 683518922, ; 100: System.Net.Security => 0x28bdabca => 71
	i32 690569205, ; 101: System.Xml.Linq.dll => 0x29293ff5 => 153
	i32 691348768, ; 102: Xamarin.KotlinX.Coroutines.Android.dll => 0x29352520 => 279
	i32 693804605, ; 103: System.Windows => 0x295a9e3d => 152
	i32 699345723, ; 104: System.Reflection.Emit => 0x29af2b3b => 90
	i32 700284507, ; 105: Xamarin.Jetbrains.Annotations => 0x29bd7e5b => 274
	i32 700358131, ; 106: System.IO.Compression.ZipFile => 0x29be9df3 => 44
	i32 720511267, ; 107: Xamarin.Kotlin.StdLib.Jdk8 => 0x2af22123 => 278
	i32 722857257, ; 108: System.Runtime.Loader.dll => 0x2b15ed29 => 107
	i32 731701662, ; 109: Microsoft.Extensions.Options.ConfigurationExtensions => 0x2b9ce19e => 187
	i32 735137430, ; 110: System.Security.SecureString.dll => 0x2bd14e96 => 127
	i32 752232764, ; 111: System.Diagnostics.Contracts.dll => 0x2cd6293c => 25
	i32 755313932, ; 112: Xamarin.Android.Glide.Annotations.dll => 0x2d052d0c => 199
	i32 759454413, ; 113: System.Net.Requests => 0x2d445acd => 70
	i32 762598435, ; 114: System.IO.Pipes.dll => 0x2d745423 => 54
	i32 775507847, ; 115: System.IO.Compression => 0x2e394f87 => 45
	i32 777317022, ; 116: sk\Microsoft.Maui.Controls.resources => 0x2e54ea9e => 306
	i32 789151979, ; 117: Microsoft.Extensions.Options => 0x2f0980eb => 186
	i32 790371945, ; 118: Xamarin.AndroidX.CustomView.PoolingContainer.dll => 0x2f1c1e69 => 223
	i32 804715423, ; 119: System.Data.Common => 0x2ff6fb9f => 22
	i32 807930345, ; 120: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx.dll => 0x302809e9 => 237
	i32 823281589, ; 121: System.Private.Uri.dll => 0x311247b5 => 84
	i32 830298997, ; 122: System.IO.Compression.Brotli => 0x317d5b75 => 42
	i32 832635846, ; 123: System.Xml.XPath.dll => 0x31a103c6 => 158
	i32 834051424, ; 124: System.Net.Quic => 0x31b69d60 => 69
	i32 843511501, ; 125: Xamarin.AndroidX.Print => 0x3246f6cd => 250
	i32 869139383, ; 126: hi\Microsoft.Maui.Controls.resources.dll => 0x33ce03b7 => 291
	i32 873119928, ; 127: Microsoft.VisualBasic => 0x340ac0b8 => 3
	i32 877678880, ; 128: System.Globalization.dll => 0x34505120 => 41
	i32 878954865, ; 129: System.Net.Http.Json => 0x3463c971 => 197
	i32 880668424, ; 130: ru\Microsoft.Maui.Controls.resources.dll => 0x347def08 => 305
	i32 904024072, ; 131: System.ComponentModel.Primitives.dll => 0x35e25008 => 16
	i32 911108515, ; 132: System.IO.MemoryMappedFiles.dll => 0x364e69a3 => 52
	i32 918734561, ; 133: pt-BR\Microsoft.Maui.Controls.resources.dll => 0x36c2c6e1 => 302
	i32 928116545, ; 134: Xamarin.Google.Guava.ListenableFuture => 0x3751ef41 => 273
	i32 952186615, ; 135: System.Runtime.InteropServices.JavaScript.dll => 0x38c136f7 => 103
	i32 955402788, ; 136: Newtonsoft.Json => 0x38f24a24 => 195
	i32 956575887, ; 137: Xamarin.Kotlin.StdLib.Jdk8.dll => 0x3904308f => 278
	i32 961460050, ; 138: it\Microsoft.Maui.Controls.resources.dll => 0x394eb752 => 295
	i32 966729478, ; 139: Xamarin.Google.Crypto.Tink.Android => 0x399f1f06 => 271
	i32 967690846, ; 140: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 234
	i32 975236339, ; 141: System.Diagnostics.Tracing => 0x3a20ecf3 => 33
	i32 975874589, ; 142: System.Xml.XDocument => 0x3a2aaa1d => 156
	i32 986514023, ; 143: System.Private.DataContractSerialization.dll => 0x3acd0267 => 83
	i32 987214855, ; 144: System.Diagnostics.Tools => 0x3ad7b407 => 31
	i32 990727110, ; 145: ro\Microsoft.Maui.Controls.resources.dll => 0x3b0d4bc6 => 304
	i32 992768348, ; 146: System.Collections.dll => 0x3b2c715c => 12
	i32 994442037, ; 147: System.IO.FileSystem => 0x3b45fb35 => 50
	i32 1001831731, ; 148: System.IO.UnmanagedMemoryStream.dll => 0x3bb6bd33 => 55
	i32 1012816738, ; 149: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 254
	i32 1019214401, ; 150: System.Drawing => 0x3cbffa41 => 35
	i32 1028951442, ; 151: Microsoft.Extensions.DependencyInjection.Abstractions => 0x3d548d92 => 179
	i32 1031528504, ; 152: Xamarin.Google.ErrorProne.Annotations.dll => 0x3d7be038 => 272
	i32 1035644815, ; 153: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 207
	i32 1036536393, ; 154: System.Drawing.Primitives.dll => 0x3dc84a49 => 34
	i32 1043950537, ; 155: de\Microsoft.Maui.Controls.resources.dll => 0x3e396bc9 => 285
	i32 1044663988, ; 156: System.Linq.Expressions.dll => 0x3e444eb4 => 57
	i32 1048992957, ; 157: Microsoft.Extensions.Diagnostics.Abstractions.dll => 0x3e865cbd => 181
	i32 1052210849, ; 158: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x3eb776a1 => 241
	i32 1067306892, ; 159: GoogleGson => 0x3f9dcf8c => 174
	i32 1082857460, ; 160: System.ComponentModel.TypeConverter => 0x408b17f4 => 17
	i32 1084122840, ; 161: Xamarin.Kotlin.StdLib => 0x409e66d8 => 275
	i32 1098259244, ; 162: System => 0x41761b2c => 162
	i32 1108272742, ; 163: sv\Microsoft.Maui.Controls.resources.dll => 0x420ee666 => 307
	i32 1117529484, ; 164: pl\Microsoft.Maui.Controls.resources.dll => 0x429c258c => 301
	i32 1118262833, ; 165: ko\Microsoft.Maui.Controls.resources => 0x42a75631 => 297
	i32 1121599056, ; 166: Xamarin.AndroidX.Lifecycle.Runtime.Ktx.dll => 0x42da3e50 => 240
	i32 1127624469, ; 167: Microsoft.Extensions.Logging.Debug => 0x43362f15 => 185
	i32 1149092582, ; 168: Xamarin.AndroidX.Window => 0x447dc2e6 => 267
	i32 1168523401, ; 169: pt\Microsoft.Maui.Controls.resources => 0x45a64089 => 303
	i32 1170634674, ; 170: System.Web.dll => 0x45c677b2 => 151
	i32 1175144683, ; 171: Xamarin.AndroidX.VectorDrawable.Animated => 0x460b48eb => 263
	i32 1178241025, ; 172: Xamarin.AndroidX.Navigation.Runtime.dll => 0x463a8801 => 248
	i32 1204270330, ; 173: Xamarin.AndroidX.Arch.Core.Common => 0x47c7b4fa => 209
	i32 1208641965, ; 174: System.Diagnostics.Process => 0x480a69ad => 28
	i32 1214827643, ; 175: CommunityToolkit.Mvvm => 0x4868cc7b => 173
	i32 1219128291, ; 176: System.IO.IsolatedStorage => 0x48aa6be3 => 51
	i32 1243150071, ; 177: Xamarin.AndroidX.Window.Extensions.Core.Core.dll => 0x4a18f6f7 => 268
	i32 1253011324, ; 178: Microsoft.Win32.Registry => 0x4aaf6f7c => 5
	i32 1260983243, ; 179: cs\Microsoft.Maui.Controls.resources => 0x4b2913cb => 283
	i32 1264511973, ; 180: Xamarin.AndroidX.Startup.StartupRuntime.dll => 0x4b5eebe5 => 258
	i32 1267360935, ; 181: Xamarin.AndroidX.VectorDrawable => 0x4b8a64a7 => 262
	i32 1273260888, ; 182: Xamarin.AndroidX.Collection.Ktx => 0x4be46b58 => 214
	i32 1275534314, ; 183: Xamarin.KotlinX.Coroutines.Android => 0x4c071bea => 279
	i32 1278448581, ; 184: Xamarin.AndroidX.Annotation.Jvm => 0x4c3393c5 => 206
	i32 1293217323, ; 185: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 225
	i32 1308624726, ; 186: hr\Microsoft.Maui.Controls.resources.dll => 0x4e000756 => 292
	i32 1309188875, ; 187: System.Private.DataContractSerialization => 0x4e08a30b => 83
	i32 1322716291, ; 188: Xamarin.AndroidX.Window.dll => 0x4ed70c83 => 267
	i32 1324164729, ; 189: System.Linq => 0x4eed2679 => 60
	i32 1335329327, ; 190: System.Runtime.Serialization.Json.dll => 0x4f97822f => 110
	i32 1336711579, ; 191: zh-HK\Microsoft.Maui.Controls.resources.dll => 0x4fac999b => 312
	i32 1364015309, ; 192: System.IO => 0x514d38cd => 56
	i32 1373134921, ; 193: zh-Hans\Microsoft.Maui.Controls.resources => 0x51d86049 => 313
	i32 1376866003, ; 194: Xamarin.AndroidX.SavedState => 0x52114ed3 => 254
	i32 1379779777, ; 195: System.Resources.ResourceManager => 0x523dc4c1 => 97
	i32 1402170036, ; 196: System.Configuration.dll => 0x53936ab4 => 19
	i32 1406073936, ; 197: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 218
	i32 1408764838, ; 198: System.Runtime.Serialization.Formatters.dll => 0x53f80ba6 => 109
	i32 1411638395, ; 199: System.Runtime.CompilerServices.Unsafe => 0x5423e47b => 99
	i32 1422545099, ; 200: System.Runtime.CompilerServices.VisualC => 0x54ca50cb => 100
	i32 1430672901, ; 201: ar\Microsoft.Maui.Controls.resources => 0x55465605 => 281
	i32 1434145427, ; 202: System.Runtime.Handles => 0x557b5293 => 102
	i32 1435222561, ; 203: Xamarin.Google.Crypto.Tink.Android.dll => 0x558bc221 => 271
	i32 1439761251, ; 204: System.Net.Quic.dll => 0x55d10363 => 69
	i32 1452070440, ; 205: System.Formats.Asn1.dll => 0x568cd628 => 37
	i32 1453312822, ; 206: System.Diagnostics.Tools.dll => 0x569fcb36 => 31
	i32 1457743152, ; 207: System.Runtime.Extensions.dll => 0x56e36530 => 101
	i32 1458022317, ; 208: System.Net.Security.dll => 0x56e7a7ad => 71
	i32 1461004990, ; 209: es\Microsoft.Maui.Controls.resources => 0x57152abe => 287
	i32 1461234159, ; 210: System.Collections.Immutable.dll => 0x5718a9ef => 9
	i32 1461719063, ; 211: System.Security.Cryptography.OpenSsl => 0x57201017 => 121
	i32 1462112819, ; 212: System.IO.Compression.dll => 0x57261233 => 45
	i32 1469204771, ; 213: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 208
	i32 1470490898, ; 214: Microsoft.Extensions.Primitives => 0x57a5e912 => 188
	i32 1479771757, ; 215: System.Collections.Immutable => 0x5833866d => 9
	i32 1480492111, ; 216: System.IO.Compression.Brotli.dll => 0x583e844f => 42
	i32 1487239319, ; 217: Microsoft.Win32.Primitives => 0x58a57897 => 4
	i32 1490025113, ; 218: Xamarin.AndroidX.SavedState.SavedState.Ktx.dll => 0x58cffa99 => 255
	i32 1505131794, ; 219: Microsoft.Extensions.Http => 0x59b67d12 => 182
	i32 1526286932, ; 220: vi\Microsoft.Maui.Controls.resources.dll => 0x5af94a54 => 311
	i32 1536373174, ; 221: System.Diagnostics.TextWriterTraceListener => 0x5b9331b6 => 30
	i32 1543031311, ; 222: System.Text.RegularExpressions.dll => 0x5bf8ca0f => 136
	i32 1543355203, ; 223: System.Reflection.Emit.dll => 0x5bfdbb43 => 90
	i32 1550322496, ; 224: System.Reflection.Extensions.dll => 0x5c680b40 => 91
	i32 1565862583, ; 225: System.IO.FileSystem.Primitives => 0x5d552ab7 => 48
	i32 1566207040, ; 226: System.Threading.Tasks.Dataflow.dll => 0x5d5a6c40 => 139
	i32 1573704789, ; 227: System.Runtime.Serialization.Json => 0x5dccd455 => 110
	i32 1580037396, ; 228: System.Threading.Overlapped => 0x5e2d7514 => 138
	i32 1582372066, ; 229: Xamarin.AndroidX.DocumentFile.dll => 0x5e5114e2 => 224
	i32 1592978981, ; 230: System.Runtime.Serialization.dll => 0x5ef2ee25 => 113
	i32 1597949149, ; 231: Xamarin.Google.ErrorProne.Annotations => 0x5f3ec4dd => 272
	i32 1601112923, ; 232: System.Xml.Serialization => 0x5f6f0b5b => 155
	i32 1604827217, ; 233: System.Net.WebClient => 0x5fa7b851 => 74
	i32 1618516317, ; 234: System.Net.WebSockets.Client.dll => 0x6078995d => 77
	i32 1622152042, ; 235: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 244
	i32 1622358360, ; 236: System.Dynamic.Runtime => 0x60b33958 => 36
	i32 1624863272, ; 237: Xamarin.AndroidX.ViewPager2 => 0x60d97228 => 266
	i32 1634654947, ; 238: CommunityToolkit.Maui.Core.dll => 0x616edae3 => 172
	i32 1635184631, ; 239: Xamarin.AndroidX.Emoji2.ViewsHelper => 0x6176eff7 => 228
	i32 1636350590, ; 240: Xamarin.AndroidX.CursorAdapter => 0x6188ba7e => 221
	i32 1639515021, ; 241: System.Net.Http.dll => 0x61b9038d => 62
	i32 1639986890, ; 242: System.Text.RegularExpressions => 0x61c036ca => 136
	i32 1641389582, ; 243: System.ComponentModel.EventBasedAsync.dll => 0x61d59e0e => 15
	i32 1657153582, ; 244: System.Runtime => 0x62c6282e => 114
	i32 1658241508, ; 245: Xamarin.AndroidX.Tracing.Tracing.dll => 0x62d6c1e4 => 260
	i32 1658251792, ; 246: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 269
	i32 1670060433, ; 247: Xamarin.AndroidX.ConstraintLayout => 0x638b1991 => 216
	i32 1675553242, ; 248: System.IO.FileSystem.DriveInfo.dll => 0x63dee9da => 47
	i32 1677501392, ; 249: System.Net.Primitives.dll => 0x63fca3d0 => 68
	i32 1678508291, ; 250: System.Net.WebSockets => 0x640c0103 => 78
	i32 1679769178, ; 251: System.Security.Cryptography => 0x641f3e5a => 124
	i32 1691477237, ; 252: System.Reflection.Metadata => 0x64d1e4f5 => 92
	i32 1696967625, ; 253: System.Security.Cryptography.Csp => 0x6525abc9 => 119
	i32 1698840827, ; 254: Xamarin.Kotlin.StdLib.Common => 0x654240fb => 276
	i32 1701541528, ; 255: System.Diagnostics.Debug.dll => 0x656b7698 => 26
	i32 1720223769, ; 256: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx => 0x66888819 => 237
	i32 1726116996, ; 257: System.Reflection.dll => 0x66e27484 => 95
	i32 1728033016, ; 258: System.Diagnostics.FileVersionInfo.dll => 0x66ffb0f8 => 27
	i32 1729485958, ; 259: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 212
	i32 1743415430, ; 260: ca\Microsoft.Maui.Controls.resources => 0x67ea6886 => 282
	i32 1744735666, ; 261: System.Transactions.Local.dll => 0x67fe8db2 => 147
	i32 1746316138, ; 262: Mono.Android.Export => 0x6816ab6a => 167
	i32 1750313021, ; 263: Microsoft.Win32.Primitives.dll => 0x6853a83d => 4
	i32 1758240030, ; 264: System.Resources.Reader.dll => 0x68cc9d1e => 96
	i32 1763938596, ; 265: System.Diagnostics.TraceSource.dll => 0x69239124 => 32
	i32 1765942094, ; 266: System.Reflection.Extensions => 0x6942234e => 91
	i32 1766324549, ; 267: Xamarin.AndroidX.SwipeRefreshLayout => 0x6947f945 => 259
	i32 1770582343, ; 268: Microsoft.Extensions.Logging.dll => 0x6988f147 => 183
	i32 1776026572, ; 269: System.Core.dll => 0x69dc03cc => 21
	i32 1777075843, ; 270: System.Globalization.Extensions.dll => 0x69ec0683 => 40
	i32 1780572499, ; 271: Mono.Android.Runtime.dll => 0x6a216153 => 168
	i32 1782862114, ; 272: ms\Microsoft.Maui.Controls.resources => 0x6a445122 => 298
	i32 1788241197, ; 273: Xamarin.AndroidX.Fragment => 0x6a96652d => 230
	i32 1793755602, ; 274: he\Microsoft.Maui.Controls.resources => 0x6aea89d2 => 290
	i32 1808609942, ; 275: Xamarin.AndroidX.Loader => 0x6bcd3296 => 244
	i32 1813058853, ; 276: Xamarin.Kotlin.StdLib.dll => 0x6c111525 => 275
	i32 1813201214, ; 277: Xamarin.Google.Android.Material => 0x6c13413e => 269
	i32 1818569960, ; 278: Xamarin.AndroidX.Navigation.UI.dll => 0x6c652ce8 => 249
	i32 1818787751, ; 279: Microsoft.VisualBasic.Core => 0x6c687fa7 => 2
	i32 1824175904, ; 280: System.Text.Encoding.Extensions => 0x6cbab720 => 132
	i32 1824722060, ; 281: System.Runtime.Serialization.Formatters => 0x6cc30c8c => 109
	i32 1828688058, ; 282: Microsoft.Extensions.Logging.Abstractions.dll => 0x6cff90ba => 184
	i32 1847515442, ; 283: Xamarin.Android.Glide.Annotations => 0x6e1ed932 => 199
	i32 1853025655, ; 284: sv\Microsoft.Maui.Controls.resources => 0x6e72ed77 => 307
	i32 1858542181, ; 285: System.Linq.Expressions => 0x6ec71a65 => 57
	i32 1870277092, ; 286: System.Reflection.Primitives => 0x6f7a29e4 => 93
	i32 1875935024, ; 287: fr\Microsoft.Maui.Controls.resources => 0x6fd07f30 => 289
	i32 1879696579, ; 288: System.Formats.Tar.dll => 0x7009e4c3 => 38
	i32 1885316902, ; 289: Xamarin.AndroidX.Arch.Core.Runtime.dll => 0x705fa726 => 210
	i32 1888955245, ; 290: System.Diagnostics.Contracts => 0x70972b6d => 25
	i32 1889954781, ; 291: System.Reflection.Metadata.dll => 0x70a66bdd => 92
	i32 1893218855, ; 292: cs\Microsoft.Maui.Controls.resources.dll => 0x70d83a27 => 283
	i32 1898237753, ; 293: System.Reflection.DispatchProxy => 0x7124cf39 => 87
	i32 1900610850, ; 294: System.Resources.ResourceManager.dll => 0x71490522 => 97
	i32 1910275211, ; 295: System.Collections.NonGeneric.dll => 0x71dc7c8b => 10
	i32 1939592360, ; 296: System.Private.Xml.Linq => 0x739bd4a8 => 85
	i32 1953182387, ; 297: id\Microsoft.Maui.Controls.resources.dll => 0x746b32b3 => 294
	i32 1956758971, ; 298: System.Resources.Writer => 0x74a1c5bb => 98
	i32 1961813231, ; 299: Xamarin.AndroidX.Security.SecurityCrypto.dll => 0x74eee4ef => 256
	i32 1968388702, ; 300: Microsoft.Extensions.Configuration.dll => 0x75533a5e => 175
	i32 1983156543, ; 301: Xamarin.Kotlin.StdLib.Common.dll => 0x7634913f => 276
	i32 1985761444, ; 302: Xamarin.Android.Glide.GifDecoder => 0x765c50a4 => 201
	i32 2003115576, ; 303: el\Microsoft.Maui.Controls.resources => 0x77651e38 => 286
	i32 2011961780, ; 304: System.Buffers.dll => 0x77ec19b4 => 7
	i32 2019465201, ; 305: Xamarin.AndroidX.Lifecycle.ViewModel => 0x785e97f1 => 241
	i32 2031763787, ; 306: Xamarin.Android.Glide => 0x791a414b => 198
	i32 2045470958, ; 307: System.Private.Xml => 0x79eb68ee => 86
	i32 2048278909, ; 308: Microsoft.Extensions.Configuration.Binder.dll => 0x7a16417d => 177
	i32 2055257422, ; 309: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 236
	i32 2060060697, ; 310: System.Windows.dll => 0x7aca0819 => 152
	i32 2066184531, ; 311: de\Microsoft.Maui.Controls.resources => 0x7b277953 => 285
	i32 2070888862, ; 312: System.Diagnostics.TraceSource => 0x7b6f419e => 32
	i32 2079903147, ; 313: System.Runtime.dll => 0x7bf8cdab => 114
	i32 2090596640, ; 314: System.Numerics.Vectors => 0x7c9bf920 => 80
	i32 2127167465, ; 315: System.Console => 0x7ec9ffe9 => 20
	i32 2141982267, ; 316: MauiBookingApp => 0x7fac0e3b => 0
	i32 2142473426, ; 317: System.Collections.Specialized => 0x7fb38cd2 => 11
	i32 2143790110, ; 318: System.Xml.XmlSerializer.dll => 0x7fc7a41e => 160
	i32 2146852085, ; 319: Microsoft.VisualBasic.dll => 0x7ff65cf5 => 3
	i32 2159891885, ; 320: Microsoft.Maui => 0x80bd55ad => 192
	i32 2169148018, ; 321: hu\Microsoft.Maui.Controls.resources => 0x814a9272 => 293
	i32 2181898931, ; 322: Microsoft.Extensions.Options.dll => 0x820d22b3 => 186
	i32 2192057212, ; 323: Microsoft.Extensions.Logging.Abstractions => 0x82a8237c => 184
	i32 2193016926, ; 324: System.ObjectModel.dll => 0x82b6c85e => 82
	i32 2201107256, ; 325: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x83323b38 => 280
	i32 2201231467, ; 326: System.Net.Http => 0x8334206b => 62
	i32 2207618523, ; 327: it\Microsoft.Maui.Controls.resources => 0x839595db => 295
	i32 2217644978, ; 328: Xamarin.AndroidX.VectorDrawable.Animated.dll => 0x842e93b2 => 263
	i32 2222056684, ; 329: System.Threading.Tasks.Parallel => 0x8471e4ec => 141
	i32 2244775296, ; 330: Xamarin.AndroidX.LocalBroadcastManager => 0x85cc8d80 => 245
	i32 2252106437, ; 331: System.Xml.Serialization.dll => 0x863c6ac5 => 155
	i32 2256313426, ; 332: System.Globalization.Extensions => 0x867c9c52 => 40
	i32 2265110946, ; 333: System.Security.AccessControl.dll => 0x8702d9a2 => 115
	i32 2266799131, ; 334: Microsoft.Extensions.Configuration.Abstractions => 0x871c9c1b => 176
	i32 2267999099, ; 335: Xamarin.Android.Glide.DiskLruCache.dll => 0x872eeb7b => 200
	i32 2279755925, ; 336: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 252
	i32 2293034957, ; 337: System.ServiceModel.Web.dll => 0x88acefcd => 129
	i32 2295906218, ; 338: System.Net.Sockets => 0x88d8bfaa => 73
	i32 2298471582, ; 339: System.Net.Mail => 0x88ffe49e => 64
	i32 2303942373, ; 340: nb\Microsoft.Maui.Controls.resources => 0x89535ee5 => 299
	i32 2305521784, ; 341: System.Private.CoreLib.dll => 0x896b7878 => 170
	i32 2315684594, ; 342: Xamarin.AndroidX.Annotation.dll => 0x8a068af2 => 204
	i32 2320631194, ; 343: System.Threading.Tasks.Parallel.dll => 0x8a52059a => 141
	i32 2340441535, ; 344: System.Runtime.InteropServices.RuntimeInformation.dll => 0x8b804dbf => 104
	i32 2344264397, ; 345: System.ValueTuple => 0x8bbaa2cd => 149
	i32 2353062107, ; 346: System.Net.Primitives => 0x8c40e0db => 68
	i32 2366048013, ; 347: hu\Microsoft.Maui.Controls.resources.dll => 0x8d07070d => 293
	i32 2368005991, ; 348: System.Xml.ReaderWriter.dll => 0x8d24e767 => 154
	i32 2371007202, ; 349: Microsoft.Extensions.Configuration => 0x8d52b2e2 => 175
	i32 2378619854, ; 350: System.Security.Cryptography.Csp.dll => 0x8dc6dbce => 119
	i32 2383496789, ; 351: System.Security.Principal.Windows.dll => 0x8e114655 => 125
	i32 2395872292, ; 352: id\Microsoft.Maui.Controls.resources => 0x8ece1c24 => 294
	i32 2401565422, ; 353: System.Web.HttpUtility => 0x8f24faee => 150
	i32 2403452196, ; 354: Xamarin.AndroidX.Emoji2.dll => 0x8f41c524 => 227
	i32 2421380589, ; 355: System.Threading.Tasks.Dataflow => 0x905355ed => 139
	i32 2423080555, ; 356: Xamarin.AndroidX.Collection.Ktx.dll => 0x906d466b => 214
	i32 2427813419, ; 357: hi\Microsoft.Maui.Controls.resources => 0x90b57e2b => 291
	i32 2435356389, ; 358: System.Console.dll => 0x912896e5 => 20
	i32 2435904999, ; 359: System.ComponentModel.DataAnnotations.dll => 0x9130f5e7 => 14
	i32 2454642406, ; 360: System.Text.Encoding.dll => 0x924edee6 => 133
	i32 2458678730, ; 361: System.Net.Sockets.dll => 0x928c75ca => 73
	i32 2459001652, ; 362: System.Linq.Parallel.dll => 0x92916334 => 58
	i32 2465532216, ; 363: Xamarin.AndroidX.ConstraintLayout.Core.dll => 0x92f50938 => 217
	i32 2471841756, ; 364: netstandard.dll => 0x93554fdc => 165
	i32 2475788418, ; 365: Java.Interop.dll => 0x93918882 => 166
	i32 2480646305, ; 366: Microsoft.Maui.Controls => 0x93dba8a1 => 190
	i32 2483903535, ; 367: System.ComponentModel.EventBasedAsync => 0x940d5c2f => 15
	i32 2484371297, ; 368: System.Net.ServicePoint => 0x94147f61 => 72
	i32 2490993605, ; 369: System.AppContext.dll => 0x94798bc5 => 6
	i32 2501346920, ; 370: System.Data.DataSetExtensions => 0x95178668 => 23
	i32 2503351294, ; 371: ko\Microsoft.Maui.Controls.resources.dll => 0x95361bfe => 297
	i32 2505896520, ; 372: Xamarin.AndroidX.Lifecycle.Runtime.dll => 0x955cf248 => 239
	i32 2511589265, ; 373: App.ApiClient => 0x95b3cf91 => 315
	i32 2522472828, ; 374: Xamarin.Android.Glide.dll => 0x9659e17c => 198
	i32 2538310050, ; 375: System.Reflection.Emit.Lightweight.dll => 0x974b89a2 => 89
	i32 2550873716, ; 376: hr\Microsoft.Maui.Controls.resources => 0x980b3e74 => 292
	i32 2562349572, ; 377: Microsoft.CSharp => 0x98ba5a04 => 1
	i32 2570120770, ; 378: System.Text.Encodings.Web => 0x9930ee42 => 134
	i32 2576534780, ; 379: ja\Microsoft.Maui.Controls.resources.dll => 0x9992ccfc => 296
	i32 2581783588, ; 380: Xamarin.AndroidX.Lifecycle.Runtime.Ktx => 0x99e2e424 => 240
	i32 2581819634, ; 381: Xamarin.AndroidX.VectorDrawable.dll => 0x99e370f2 => 262
	i32 2585220780, ; 382: System.Text.Encoding.Extensions.dll => 0x9a1756ac => 132
	i32 2585805581, ; 383: System.Net.Ping => 0x9a20430d => 67
	i32 2589602615, ; 384: System.Threading.ThreadPool => 0x9a5a3337 => 144
	i32 2593496499, ; 385: pl\Microsoft.Maui.Controls.resources => 0x9a959db3 => 301
	i32 2605712449, ; 386: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x9b500441 => 280
	i32 2615233544, ; 387: Xamarin.AndroidX.Fragment.Ktx => 0x9be14c08 => 231
	i32 2616218305, ; 388: Microsoft.Extensions.Logging.Debug.dll => 0x9bf052c1 => 185
	i32 2617129537, ; 389: System.Private.Xml.dll => 0x9bfe3a41 => 86
	i32 2618712057, ; 390: System.Reflection.TypeExtensions.dll => 0x9c165ff9 => 94
	i32 2620871830, ; 391: Xamarin.AndroidX.CursorAdapter.dll => 0x9c375496 => 221
	i32 2624644809, ; 392: Xamarin.AndroidX.DynamicAnimation => 0x9c70e6c9 => 226
	i32 2626831493, ; 393: ja\Microsoft.Maui.Controls.resources => 0x9c924485 => 296
	i32 2627185994, ; 394: System.Diagnostics.TextWriterTraceListener.dll => 0x9c97ad4a => 30
	i32 2629843544, ; 395: System.IO.Compression.ZipFile.dll => 0x9cc03a58 => 44
	i32 2633051222, ; 396: Xamarin.AndroidX.Lifecycle.LiveData => 0x9cf12c56 => 235
	i32 2663391936, ; 397: Xamarin.Android.Glide.DiskLruCache => 0x9ec022c0 => 200
	i32 2663698177, ; 398: System.Runtime.Loader => 0x9ec4cf01 => 107
	i32 2664396074, ; 399: System.Xml.XDocument.dll => 0x9ecf752a => 156
	i32 2665622720, ; 400: System.Drawing.Primitives => 0x9ee22cc0 => 34
	i32 2676780864, ; 401: System.Data.Common.dll => 0x9f8c6f40 => 22
	i32 2686887180, ; 402: System.Runtime.Serialization.Xml.dll => 0xa026a50c => 112
	i32 2693849962, ; 403: System.IO.dll => 0xa090e36a => 56
	i32 2701096212, ; 404: Xamarin.AndroidX.Tracing.Tracing => 0xa0ff7514 => 260
	i32 2715334215, ; 405: System.Threading.Tasks.dll => 0xa1d8b647 => 142
	i32 2717744543, ; 406: System.Security.Claims => 0xa1fd7d9f => 116
	i32 2719963679, ; 407: System.Security.Cryptography.Cng.dll => 0xa21f5a1f => 118
	i32 2724373263, ; 408: System.Runtime.Numerics.dll => 0xa262a30f => 108
	i32 2732626843, ; 409: Xamarin.AndroidX.Activity => 0xa2e0939b => 202
	i32 2735172069, ; 410: System.Threading.Channels => 0xa30769e5 => 137
	i32 2737747696, ; 411: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 208
	i32 2740698338, ; 412: ca\Microsoft.Maui.Controls.resources.dll => 0xa35bbce2 => 282
	i32 2740948882, ; 413: System.IO.Pipes.AccessControl => 0xa35f8f92 => 53
	i32 2748088231, ; 414: System.Runtime.InteropServices.JavaScript => 0xa3cc7fa7 => 103
	i32 2752995522, ; 415: pt-BR\Microsoft.Maui.Controls.resources => 0xa41760c2 => 302
	i32 2758225723, ; 416: Microsoft.Maui.Controls.Xaml => 0xa4672f3b => 191
	i32 2764765095, ; 417: Microsoft.Maui.dll => 0xa4caf7a7 => 192
	i32 2765824710, ; 418: System.Text.Encoding.CodePages.dll => 0xa4db22c6 => 131
	i32 2770495804, ; 419: Xamarin.Jetbrains.Annotations.dll => 0xa522693c => 274
	i32 2778768386, ; 420: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 265
	i32 2779977773, ; 421: Xamarin.AndroidX.ResourceInspection.Annotation.dll => 0xa5b3182d => 253
	i32 2785988530, ; 422: th\Microsoft.Maui.Controls.resources => 0xa60ecfb2 => 308
	i32 2788224221, ; 423: Xamarin.AndroidX.Fragment.Ktx.dll => 0xa630ecdd => 231
	i32 2801831435, ; 424: Microsoft.Maui.Graphics => 0xa7008e0b => 194
	i32 2803228030, ; 425: System.Xml.XPath.XDocument.dll => 0xa715dd7e => 157
	i32 2810250172, ; 426: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 218
	i32 2819470561, ; 427: System.Xml.dll => 0xa80db4e1 => 161
	i32 2821205001, ; 428: System.ServiceProcess.dll => 0xa8282c09 => 130
	i32 2821294376, ; 429: Xamarin.AndroidX.ResourceInspection.Annotation => 0xa8298928 => 253
	i32 2824502124, ; 430: System.Xml.XmlDocument => 0xa85a7b6c => 159
	i32 2838993487, ; 431: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx.dll => 0xa9379a4f => 242
	i32 2849599387, ; 432: System.Threading.Overlapped.dll => 0xa9d96f9b => 138
	i32 2853208004, ; 433: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 265
	i32 2855708567, ; 434: Xamarin.AndroidX.Transition => 0xaa36a797 => 261
	i32 2861098320, ; 435: Mono.Android.Export.dll => 0xaa88e550 => 167
	i32 2861189240, ; 436: Microsoft.Maui.Essentials => 0xaa8a4878 => 193
	i32 2868488919, ; 437: CommunityToolkit.Maui.Core => 0xaaf9aad7 => 172
	i32 2870099610, ; 438: Xamarin.AndroidX.Activity.Ktx.dll => 0xab123e9a => 203
	i32 2875164099, ; 439: Jsr305Binding.dll => 0xab5f85c3 => 270
	i32 2875220617, ; 440: System.Globalization.Calendars.dll => 0xab606289 => 39
	i32 2884993177, ; 441: Xamarin.AndroidX.ExifInterface => 0xabf58099 => 229
	i32 2887636118, ; 442: System.Net.dll => 0xac1dd496 => 79
	i32 2899753641, ; 443: System.IO.UnmanagedMemoryStream => 0xacd6baa9 => 55
	i32 2900621748, ; 444: System.Dynamic.Runtime.dll => 0xace3f9b4 => 36
	i32 2901442782, ; 445: System.Reflection => 0xacf080de => 95
	i32 2905242038, ; 446: mscorlib.dll => 0xad2a79b6 => 164
	i32 2909740682, ; 447: System.Private.CoreLib => 0xad6f1e8a => 170
	i32 2916838712, ; 448: Xamarin.AndroidX.ViewPager2.dll => 0xaddb6d38 => 266
	i32 2919462931, ; 449: System.Numerics.Vectors.dll => 0xae037813 => 80
	i32 2921128767, ; 450: Xamarin.AndroidX.Annotation.Experimental.dll => 0xae1ce33f => 205
	i32 2936416060, ; 451: System.Resources.Reader => 0xaf06273c => 96
	i32 2940926066, ; 452: System.Diagnostics.StackTrace.dll => 0xaf4af872 => 29
	i32 2942453041, ; 453: System.Xml.XPath.XDocument => 0xaf624531 => 157
	i32 2959614098, ; 454: System.ComponentModel.dll => 0xb0682092 => 18
	i32 2968338931, ; 455: System.Security.Principal.Windows => 0xb0ed41f3 => 125
	i32 2971004615, ; 456: Microsoft.Extensions.Options.ConfigurationExtensions.dll => 0xb115eec7 => 187
	i32 2972252294, ; 457: System.Security.Cryptography.Algorithms.dll => 0xb128f886 => 117
	i32 2978675010, ; 458: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 225
	i32 2987532451, ; 459: Xamarin.AndroidX.Security.SecurityCrypto => 0xb21220a3 => 256
	i32 2996846495, ; 460: Xamarin.AndroidX.Lifecycle.Process.dll => 0xb2a03f9f => 238
	i32 3016983068, ; 461: Xamarin.AndroidX.Startup.StartupRuntime => 0xb3d3821c => 258
	i32 3020703001, ; 462: Microsoft.Extensions.Diagnostics => 0xb40c4519 => 180
	i32 3023353419, ; 463: WindowsBase.dll => 0xb434b64b => 163
	i32 3024354802, ; 464: Xamarin.AndroidX.Legacy.Support.Core.Utils => 0xb443fdf2 => 233
	i32 3038032645, ; 465: _Microsoft.Android.Resource.Designer.dll => 0xb514b305 => 316
	i32 3053864966, ; 466: fi\Microsoft.Maui.Controls.resources.dll => 0xb6064806 => 288
	i32 3056245963, ; 467: Xamarin.AndroidX.SavedState.SavedState.Ktx => 0xb62a9ccb => 255
	i32 3057625584, ; 468: Xamarin.AndroidX.Navigation.Common => 0xb63fa9f0 => 246
	i32 3059408633, ; 469: Mono.Android.Runtime => 0xb65adef9 => 168
	i32 3059793426, ; 470: System.ComponentModel.Primitives => 0xb660be12 => 16
	i32 3075834255, ; 471: System.Threading.Tasks => 0xb755818f => 142
	i32 3090735792, ; 472: System.Security.Cryptography.X509Certificates.dll => 0xb838e2b0 => 123
	i32 3099732863, ; 473: System.Security.Claims.dll => 0xb8c22b7f => 116
	i32 3103600923, ; 474: System.Formats.Asn1 => 0xb8fd311b => 37
	i32 3111772706, ; 475: System.Runtime.Serialization => 0xb979e222 => 113
	i32 3121463068, ; 476: System.IO.FileSystem.AccessControl.dll => 0xba0dbf1c => 46
	i32 3124832203, ; 477: System.Threading.Tasks.Extensions => 0xba4127cb => 140
	i32 3132293585, ; 478: System.Security.AccessControl => 0xbab301d1 => 115
	i32 3147165239, ; 479: System.Diagnostics.Tracing.dll => 0xbb95ee37 => 33
	i32 3148237826, ; 480: GoogleGson.dll => 0xbba64c02 => 174
	i32 3159123045, ; 481: System.Reflection.Primitives.dll => 0xbc4c6465 => 93
	i32 3160747431, ; 482: System.IO.MemoryMappedFiles => 0xbc652da7 => 52
	i32 3178803400, ; 483: Xamarin.AndroidX.Navigation.Fragment.dll => 0xbd78b0c8 => 247
	i32 3192346100, ; 484: System.Security.SecureString => 0xbe4755f4 => 127
	i32 3193515020, ; 485: System.Web => 0xbe592c0c => 151
	i32 3204380047, ; 486: System.Data.dll => 0xbefef58f => 24
	i32 3209718065, ; 487: System.Xml.XmlDocument.dll => 0xbf506931 => 159
	i32 3211777861, ; 488: Xamarin.AndroidX.DocumentFile => 0xbf6fd745 => 224
	i32 3220365878, ; 489: System.Threading => 0xbff2e236 => 146
	i32 3226221578, ; 490: System.Runtime.Handles.dll => 0xc04c3c0a => 102
	i32 3251039220, ; 491: System.Reflection.DispatchProxy.dll => 0xc1c6ebf4 => 87
	i32 3258312781, ; 492: Xamarin.AndroidX.CardView => 0xc235e84d => 212
	i32 3265493905, ; 493: System.Linq.Queryable.dll => 0xc2a37b91 => 59
	i32 3265893370, ; 494: System.Threading.Tasks.Extensions.dll => 0xc2a993fa => 140
	i32 3277815716, ; 495: System.Resources.Writer.dll => 0xc35f7fa4 => 98
	i32 3279906254, ; 496: Microsoft.Win32.Registry.dll => 0xc37f65ce => 5
	i32 3280506390, ; 497: System.ComponentModel.Annotations.dll => 0xc3888e16 => 13
	i32 3290767353, ; 498: System.Security.Cryptography.Encoding => 0xc4251ff9 => 120
	i32 3299363146, ; 499: System.Text.Encoding => 0xc4a8494a => 133
	i32 3303498502, ; 500: System.Diagnostics.FileVersionInfo => 0xc4e76306 => 27
	i32 3305363605, ; 501: fi\Microsoft.Maui.Controls.resources => 0xc503d895 => 288
	i32 3316684772, ; 502: System.Net.Requests.dll => 0xc5b097e4 => 70
	i32 3317135071, ; 503: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 222
	i32 3317144872, ; 504: System.Data => 0xc5b79d28 => 24
	i32 3332097420, ; 505: MauiBookingApp.dll => 0xc69bc58c => 0
	i32 3340431453, ; 506: Xamarin.AndroidX.Arch.Core.Runtime => 0xc71af05d => 210
	i32 3345895724, ; 507: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller.dll => 0xc76e512c => 251
	i32 3346324047, ; 508: Xamarin.AndroidX.Navigation.Runtime => 0xc774da4f => 248
	i32 3357674450, ; 509: ru\Microsoft.Maui.Controls.resources => 0xc8220bd2 => 305
	i32 3358260929, ; 510: System.Text.Json => 0xc82afec1 => 135
	i32 3362336904, ; 511: Xamarin.AndroidX.Activity.Ktx => 0xc8693088 => 203
	i32 3362522851, ; 512: Xamarin.AndroidX.Core => 0xc86c06e3 => 219
	i32 3366347497, ; 513: Java.Interop => 0xc8a662e9 => 166
	i32 3374999561, ; 514: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 252
	i32 3381016424, ; 515: da\Microsoft.Maui.Controls.resources => 0xc9863768 => 284
	i32 3395150330, ; 516: System.Runtime.CompilerServices.Unsafe.dll => 0xca5de1fa => 99
	i32 3403906625, ; 517: System.Security.Cryptography.OpenSsl.dll => 0xcae37e41 => 121
	i32 3405233483, ; 518: Xamarin.AndroidX.CustomView.PoolingContainer => 0xcaf7bd4b => 223
	i32 3421170118, ; 519: Microsoft.Extensions.Configuration.Binder => 0xcbeae9c6 => 177
	i32 3428513518, ; 520: Microsoft.Extensions.DependencyInjection.dll => 0xcc5af6ee => 178
	i32 3429136800, ; 521: System.Xml => 0xcc6479a0 => 161
	i32 3430777524, ; 522: netstandard => 0xcc7d82b4 => 165
	i32 3441283291, ; 523: Xamarin.AndroidX.DynamicAnimation.dll => 0xcd1dd0db => 226
	i32 3445260447, ; 524: System.Formats.Tar => 0xcd5a809f => 38
	i32 3452344032, ; 525: Microsoft.Maui.Controls.Compatibility.dll => 0xcdc696e0 => 189
	i32 3458724246, ; 526: pt\Microsoft.Maui.Controls.resources.dll => 0xce27f196 => 303
	i32 3471940407, ; 527: System.ComponentModel.TypeConverter.dll => 0xcef19b37 => 17
	i32 3476120550, ; 528: Mono.Android => 0xcf3163e6 => 169
	i32 3484440000, ; 529: ro\Microsoft.Maui.Controls.resources => 0xcfb055c0 => 304
	i32 3485117614, ; 530: System.Text.Json.dll => 0xcfbaacae => 135
	i32 3486566296, ; 531: System.Transactions => 0xcfd0c798 => 148
	i32 3493954962, ; 532: Xamarin.AndroidX.Concurrent.Futures.dll => 0xd0418592 => 215
	i32 3509114376, ; 533: System.Xml.Linq => 0xd128d608 => 153
	i32 3515174580, ; 534: System.Security.dll => 0xd1854eb4 => 128
	i32 3530912306, ; 535: System.Configuration => 0xd2757232 => 19
	i32 3539954161, ; 536: System.Net.HttpListener => 0xd2ff69f1 => 63
	i32 3560100363, ; 537: System.Threading.Timer => 0xd432d20b => 145
	i32 3570554715, ; 538: System.IO.FileSystem.AccessControl => 0xd4d2575b => 46
	i32 3580758918, ; 539: zh-HK\Microsoft.Maui.Controls.resources => 0xd56e0b86 => 312
	i32 3592228221, ; 540: zh-Hant\Microsoft.Maui.Controls.resources.dll => 0xd61d0d7d => 314
	i32 3597029428, ; 541: Xamarin.Android.Glide.GifDecoder.dll => 0xd6665034 => 201
	i32 3598340787, ; 542: System.Net.WebSockets.Client => 0xd67a52b3 => 77
	i32 3608519521, ; 543: System.Linq.dll => 0xd715a361 => 60
	i32 3624195450, ; 544: System.Runtime.InteropServices.RuntimeInformation => 0xd804d57a => 104
	i32 3627220390, ; 545: Xamarin.AndroidX.Print.dll => 0xd832fda6 => 250
	i32 3633644679, ; 546: Xamarin.AndroidX.Annotation.Experimental => 0xd8950487 => 205
	i32 3638274909, ; 547: System.IO.FileSystem.Primitives.dll => 0xd8dbab5d => 48
	i32 3641597786, ; 548: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 236
	i32 3643446276, ; 549: tr\Microsoft.Maui.Controls.resources => 0xd92a9404 => 309
	i32 3643854240, ; 550: Xamarin.AndroidX.Navigation.Fragment => 0xd930cda0 => 247
	i32 3645089577, ; 551: System.ComponentModel.DataAnnotations => 0xd943a729 => 14
	i32 3657292374, ; 552: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd9fdda56 => 176
	i32 3660523487, ; 553: System.Net.NetworkInformation => 0xda2f27df => 66
	i32 3672681054, ; 554: Mono.Android.dll => 0xdae8aa5e => 169
	i32 3682565725, ; 555: Xamarin.AndroidX.Browser => 0xdb7f7e5d => 211
	i32 3684561358, ; 556: Xamarin.AndroidX.Concurrent.Futures => 0xdb9df1ce => 215
	i32 3700866549, ; 557: System.Net.WebProxy.dll => 0xdc96bdf5 => 76
	i32 3706696989, ; 558: Xamarin.AndroidX.Core.Core.Ktx.dll => 0xdcefb51d => 220
	i32 3716563718, ; 559: System.Runtime.Intrinsics => 0xdd864306 => 106
	i32 3718780102, ; 560: Xamarin.AndroidX.Annotation => 0xdda814c6 => 204
	i32 3724971120, ; 561: Xamarin.AndroidX.Navigation.Common.dll => 0xde068c70 => 246
	i32 3732100267, ; 562: System.Net.NameResolution => 0xde7354ab => 65
	i32 3737834244, ; 563: System.Net.Http.Json.dll => 0xdecad304 => 197
	i32 3748608112, ; 564: System.Diagnostics.DiagnosticSource => 0xdf6f3870 => 196
	i32 3751444290, ; 565: System.Xml.XPath => 0xdf9a7f42 => 158
	i32 3751619990, ; 566: da\Microsoft.Maui.Controls.resources.dll => 0xdf9d2d96 => 284
	i32 3777185015, ; 567: App.ApiClient.dll => 0xe12344f7 => 315
	i32 3786282454, ; 568: Xamarin.AndroidX.Collection => 0xe1ae15d6 => 213
	i32 3792276235, ; 569: System.Collections.NonGeneric => 0xe2098b0b => 10
	i32 3800979733, ; 570: Microsoft.Maui.Controls.Compatibility => 0xe28e5915 => 189
	i32 3802395368, ; 571: System.Collections.Specialized.dll => 0xe2a3f2e8 => 11
	i32 3817368567, ; 572: CommunityToolkit.Maui.dll => 0xe3886bf7 => 171
	i32 3819260425, ; 573: System.Net.WebProxy => 0xe3a54a09 => 76
	i32 3823082795, ; 574: System.Security.Cryptography.dll => 0xe3df9d2b => 124
	i32 3829621856, ; 575: System.Numerics.dll => 0xe4436460 => 81
	i32 3841636137, ; 576: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xe4fab729 => 179
	i32 3844307129, ; 577: System.Net.Mail.dll => 0xe52378b9 => 64
	i32 3849253459, ; 578: System.Runtime.InteropServices.dll => 0xe56ef253 => 105
	i32 3870376305, ; 579: System.Net.HttpListener.dll => 0xe6b14171 => 63
	i32 3873536506, ; 580: System.Security.Principal => 0xe6e179fa => 126
	i32 3875112723, ; 581: System.Security.Cryptography.Encoding.dll => 0xe6f98713 => 120
	i32 3885497537, ; 582: System.Net.WebHeaderCollection.dll => 0xe797fcc1 => 75
	i32 3885922214, ; 583: Xamarin.AndroidX.Transition.dll => 0xe79e77a6 => 261
	i32 3888767677, ; 584: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller => 0xe7c9e2bd => 251
	i32 3896106733, ; 585: System.Collections.Concurrent.dll => 0xe839deed => 8
	i32 3896760992, ; 586: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 219
	i32 3901907137, ; 587: Microsoft.VisualBasic.Core.dll => 0xe89260c1 => 2
	i32 3920221145, ; 588: nl\Microsoft.Maui.Controls.resources.dll => 0xe9a9d3d9 => 300
	i32 3920810846, ; 589: System.IO.Compression.FileSystem.dll => 0xe9b2d35e => 43
	i32 3921031405, ; 590: Xamarin.AndroidX.VersionedParcelable.dll => 0xe9b630ed => 264
	i32 3928044579, ; 591: System.Xml.ReaderWriter => 0xea213423 => 154
	i32 3930554604, ; 592: System.Security.Principal.dll => 0xea4780ec => 126
	i32 3931092270, ; 593: Xamarin.AndroidX.Navigation.UI => 0xea4fb52e => 249
	i32 3945713374, ; 594: System.Data.DataSetExtensions.dll => 0xeb2ecede => 23
	i32 3953953790, ; 595: System.Text.Encoding.CodePages => 0xebac8bfe => 131
	i32 3955647286, ; 596: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 207
	i32 3959773229, ; 597: Xamarin.AndroidX.Lifecycle.Process => 0xec05582d => 238
	i32 4003436829, ; 598: System.Diagnostics.Process.dll => 0xee9f991d => 28
	i32 4015948917, ; 599: Xamarin.AndroidX.Annotation.Jvm.dll => 0xef5e8475 => 206
	i32 4025784931, ; 600: System.Memory => 0xeff49a63 => 61
	i32 4046471985, ; 601: Microsoft.Maui.Controls.Xaml.dll => 0xf1304331 => 191
	i32 4054681211, ; 602: System.Reflection.Emit.ILGeneration => 0xf1ad867b => 88
	i32 4068434129, ; 603: System.Private.Xml.Linq.dll => 0xf27f60d1 => 85
	i32 4073602200, ; 604: System.Threading.dll => 0xf2ce3c98 => 146
	i32 4091086043, ; 605: el\Microsoft.Maui.Controls.resources.dll => 0xf3d904db => 286
	i32 4094352644, ; 606: Microsoft.Maui.Essentials.dll => 0xf40add04 => 193
	i32 4099507663, ; 607: System.Drawing.dll => 0xf45985cf => 35
	i32 4100113165, ; 608: System.Private.Uri => 0xf462c30d => 84
	i32 4101593132, ; 609: Xamarin.AndroidX.Emoji2 => 0xf479582c => 227
	i32 4103439459, ; 610: uk\Microsoft.Maui.Controls.resources.dll => 0xf4958463 => 310
	i32 4126470640, ; 611: Microsoft.Extensions.DependencyInjection => 0xf5f4f1f0 => 178
	i32 4127667938, ; 612: System.IO.FileSystem.Watcher => 0xf60736e2 => 49
	i32 4130442656, ; 613: System.AppContext => 0xf6318da0 => 6
	i32 4147896353, ; 614: System.Reflection.Emit.ILGeneration.dll => 0xf73be021 => 88
	i32 4150914736, ; 615: uk\Microsoft.Maui.Controls.resources => 0xf769eeb0 => 310
	i32 4151237749, ; 616: System.Core => 0xf76edc75 => 21
	i32 4159265925, ; 617: System.Xml.XmlSerializer => 0xf7e95c85 => 160
	i32 4161255271, ; 618: System.Reflection.TypeExtensions => 0xf807b767 => 94
	i32 4164802419, ; 619: System.IO.FileSystem.Watcher.dll => 0xf83dd773 => 49
	i32 4181436372, ; 620: System.Runtime.Serialization.Primitives => 0xf93ba7d4 => 111
	i32 4182413190, ; 621: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0xf94a8f86 => 243
	i32 4185676441, ; 622: System.Security => 0xf97c5a99 => 128
	i32 4196529839, ; 623: System.Net.WebClient.dll => 0xfa21f6af => 74
	i32 4213026141, ; 624: System.Diagnostics.DiagnosticSource.dll => 0xfb1dad5d => 196
	i32 4249188766, ; 625: nb\Microsoft.Maui.Controls.resources.dll => 0xfd45799e => 299
	i32 4256097574, ; 626: Xamarin.AndroidX.Core.Core.Ktx => 0xfdaee526 => 220
	i32 4258378803, ; 627: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx => 0xfdd1b433 => 242
	i32 4260525087, ; 628: System.Buffers => 0xfdf2741f => 7
	i32 4271975918, ; 629: Microsoft.Maui.Controls.dll => 0xfea12dee => 190
	i32 4274623895, ; 630: CommunityToolkit.Mvvm.dll => 0xfec99597 => 173
	i32 4274976490, ; 631: System.Runtime.Numerics => 0xfecef6ea => 108
	i32 4292120959, ; 632: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xffd4917f => 243
	i32 4294763496 ; 633: Xamarin.AndroidX.ExifInterface.dll => 0xfffce3e8 => 229
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [634 x i32] [
	i32 66, ; 0
	i32 65, ; 1
	i32 106, ; 2
	i32 239, ; 3
	i32 273, ; 4
	i32 47, ; 5
	i32 281, ; 6
	i32 195, ; 7
	i32 78, ; 8
	i32 290, ; 9
	i32 143, ; 10
	i32 29, ; 11
	i32 314, ; 12
	i32 122, ; 13
	i32 194, ; 14
	i32 100, ; 15
	i32 298, ; 16
	i32 181, ; 17
	i32 257, ; 18
	i32 105, ; 19
	i32 257, ; 20
	i32 137, ; 21
	i32 277, ; 22
	i32 313, ; 23
	i32 306, ; 24
	i32 75, ; 25
	i32 122, ; 26
	i32 13, ; 27
	i32 213, ; 28
	i32 130, ; 29
	i32 259, ; 30
	i32 149, ; 31
	i32 18, ; 32
	i32 211, ; 33
	i32 26, ; 34
	i32 180, ; 35
	i32 233, ; 36
	i32 1, ; 37
	i32 58, ; 38
	i32 41, ; 39
	i32 89, ; 40
	i32 216, ; 41
	i32 145, ; 42
	i32 235, ; 43
	i32 232, ; 44
	i32 53, ; 45
	i32 182, ; 46
	i32 67, ; 47
	i32 311, ; 48
	i32 202, ; 49
	i32 81, ; 50
	i32 289, ; 51
	i32 234, ; 52
	i32 129, ; 53
	i32 54, ; 54
	i32 147, ; 55
	i32 72, ; 56
	i32 143, ; 57
	i32 61, ; 58
	i32 144, ; 59
	i32 316, ; 60
	i32 163, ; 61
	i32 309, ; 62
	i32 217, ; 63
	i32 12, ; 64
	i32 230, ; 65
	i32 123, ; 66
	i32 150, ; 67
	i32 111, ; 68
	i32 164, ; 69
	i32 162, ; 70
	i32 232, ; 71
	i32 245, ; 72
	i32 287, ; 73
	i32 82, ; 74
	i32 188, ; 75
	i32 148, ; 76
	i32 277, ; 77
	i32 59, ; 78
	i32 308, ; 79
	i32 183, ; 80
	i32 50, ; 81
	i32 101, ; 82
	i32 112, ; 83
	i32 39, ; 84
	i32 270, ; 85
	i32 268, ; 86
	i32 118, ; 87
	i32 171, ; 88
	i32 51, ; 89
	i32 43, ; 90
	i32 117, ; 91
	i32 222, ; 92
	i32 300, ; 93
	i32 228, ; 94
	i32 79, ; 95
	i32 134, ; 96
	i32 264, ; 97
	i32 209, ; 98
	i32 8, ; 99
	i32 71, ; 100
	i32 153, ; 101
	i32 279, ; 102
	i32 152, ; 103
	i32 90, ; 104
	i32 274, ; 105
	i32 44, ; 106
	i32 278, ; 107
	i32 107, ; 108
	i32 187, ; 109
	i32 127, ; 110
	i32 25, ; 111
	i32 199, ; 112
	i32 70, ; 113
	i32 54, ; 114
	i32 45, ; 115
	i32 306, ; 116
	i32 186, ; 117
	i32 223, ; 118
	i32 22, ; 119
	i32 237, ; 120
	i32 84, ; 121
	i32 42, ; 122
	i32 158, ; 123
	i32 69, ; 124
	i32 250, ; 125
	i32 291, ; 126
	i32 3, ; 127
	i32 41, ; 128
	i32 197, ; 129
	i32 305, ; 130
	i32 16, ; 131
	i32 52, ; 132
	i32 302, ; 133
	i32 273, ; 134
	i32 103, ; 135
	i32 195, ; 136
	i32 278, ; 137
	i32 295, ; 138
	i32 271, ; 139
	i32 234, ; 140
	i32 33, ; 141
	i32 156, ; 142
	i32 83, ; 143
	i32 31, ; 144
	i32 304, ; 145
	i32 12, ; 146
	i32 50, ; 147
	i32 55, ; 148
	i32 254, ; 149
	i32 35, ; 150
	i32 179, ; 151
	i32 272, ; 152
	i32 207, ; 153
	i32 34, ; 154
	i32 285, ; 155
	i32 57, ; 156
	i32 181, ; 157
	i32 241, ; 158
	i32 174, ; 159
	i32 17, ; 160
	i32 275, ; 161
	i32 162, ; 162
	i32 307, ; 163
	i32 301, ; 164
	i32 297, ; 165
	i32 240, ; 166
	i32 185, ; 167
	i32 267, ; 168
	i32 303, ; 169
	i32 151, ; 170
	i32 263, ; 171
	i32 248, ; 172
	i32 209, ; 173
	i32 28, ; 174
	i32 173, ; 175
	i32 51, ; 176
	i32 268, ; 177
	i32 5, ; 178
	i32 283, ; 179
	i32 258, ; 180
	i32 262, ; 181
	i32 214, ; 182
	i32 279, ; 183
	i32 206, ; 184
	i32 225, ; 185
	i32 292, ; 186
	i32 83, ; 187
	i32 267, ; 188
	i32 60, ; 189
	i32 110, ; 190
	i32 312, ; 191
	i32 56, ; 192
	i32 313, ; 193
	i32 254, ; 194
	i32 97, ; 195
	i32 19, ; 196
	i32 218, ; 197
	i32 109, ; 198
	i32 99, ; 199
	i32 100, ; 200
	i32 281, ; 201
	i32 102, ; 202
	i32 271, ; 203
	i32 69, ; 204
	i32 37, ; 205
	i32 31, ; 206
	i32 101, ; 207
	i32 71, ; 208
	i32 287, ; 209
	i32 9, ; 210
	i32 121, ; 211
	i32 45, ; 212
	i32 208, ; 213
	i32 188, ; 214
	i32 9, ; 215
	i32 42, ; 216
	i32 4, ; 217
	i32 255, ; 218
	i32 182, ; 219
	i32 311, ; 220
	i32 30, ; 221
	i32 136, ; 222
	i32 90, ; 223
	i32 91, ; 224
	i32 48, ; 225
	i32 139, ; 226
	i32 110, ; 227
	i32 138, ; 228
	i32 224, ; 229
	i32 113, ; 230
	i32 272, ; 231
	i32 155, ; 232
	i32 74, ; 233
	i32 77, ; 234
	i32 244, ; 235
	i32 36, ; 236
	i32 266, ; 237
	i32 172, ; 238
	i32 228, ; 239
	i32 221, ; 240
	i32 62, ; 241
	i32 136, ; 242
	i32 15, ; 243
	i32 114, ; 244
	i32 260, ; 245
	i32 269, ; 246
	i32 216, ; 247
	i32 47, ; 248
	i32 68, ; 249
	i32 78, ; 250
	i32 124, ; 251
	i32 92, ; 252
	i32 119, ; 253
	i32 276, ; 254
	i32 26, ; 255
	i32 237, ; 256
	i32 95, ; 257
	i32 27, ; 258
	i32 212, ; 259
	i32 282, ; 260
	i32 147, ; 261
	i32 167, ; 262
	i32 4, ; 263
	i32 96, ; 264
	i32 32, ; 265
	i32 91, ; 266
	i32 259, ; 267
	i32 183, ; 268
	i32 21, ; 269
	i32 40, ; 270
	i32 168, ; 271
	i32 298, ; 272
	i32 230, ; 273
	i32 290, ; 274
	i32 244, ; 275
	i32 275, ; 276
	i32 269, ; 277
	i32 249, ; 278
	i32 2, ; 279
	i32 132, ; 280
	i32 109, ; 281
	i32 184, ; 282
	i32 199, ; 283
	i32 307, ; 284
	i32 57, ; 285
	i32 93, ; 286
	i32 289, ; 287
	i32 38, ; 288
	i32 210, ; 289
	i32 25, ; 290
	i32 92, ; 291
	i32 283, ; 292
	i32 87, ; 293
	i32 97, ; 294
	i32 10, ; 295
	i32 85, ; 296
	i32 294, ; 297
	i32 98, ; 298
	i32 256, ; 299
	i32 175, ; 300
	i32 276, ; 301
	i32 201, ; 302
	i32 286, ; 303
	i32 7, ; 304
	i32 241, ; 305
	i32 198, ; 306
	i32 86, ; 307
	i32 177, ; 308
	i32 236, ; 309
	i32 152, ; 310
	i32 285, ; 311
	i32 32, ; 312
	i32 114, ; 313
	i32 80, ; 314
	i32 20, ; 315
	i32 0, ; 316
	i32 11, ; 317
	i32 160, ; 318
	i32 3, ; 319
	i32 192, ; 320
	i32 293, ; 321
	i32 186, ; 322
	i32 184, ; 323
	i32 82, ; 324
	i32 280, ; 325
	i32 62, ; 326
	i32 295, ; 327
	i32 263, ; 328
	i32 141, ; 329
	i32 245, ; 330
	i32 155, ; 331
	i32 40, ; 332
	i32 115, ; 333
	i32 176, ; 334
	i32 200, ; 335
	i32 252, ; 336
	i32 129, ; 337
	i32 73, ; 338
	i32 64, ; 339
	i32 299, ; 340
	i32 170, ; 341
	i32 204, ; 342
	i32 141, ; 343
	i32 104, ; 344
	i32 149, ; 345
	i32 68, ; 346
	i32 293, ; 347
	i32 154, ; 348
	i32 175, ; 349
	i32 119, ; 350
	i32 125, ; 351
	i32 294, ; 352
	i32 150, ; 353
	i32 227, ; 354
	i32 139, ; 355
	i32 214, ; 356
	i32 291, ; 357
	i32 20, ; 358
	i32 14, ; 359
	i32 133, ; 360
	i32 73, ; 361
	i32 58, ; 362
	i32 217, ; 363
	i32 165, ; 364
	i32 166, ; 365
	i32 190, ; 366
	i32 15, ; 367
	i32 72, ; 368
	i32 6, ; 369
	i32 23, ; 370
	i32 297, ; 371
	i32 239, ; 372
	i32 315, ; 373
	i32 198, ; 374
	i32 89, ; 375
	i32 292, ; 376
	i32 1, ; 377
	i32 134, ; 378
	i32 296, ; 379
	i32 240, ; 380
	i32 262, ; 381
	i32 132, ; 382
	i32 67, ; 383
	i32 144, ; 384
	i32 301, ; 385
	i32 280, ; 386
	i32 231, ; 387
	i32 185, ; 388
	i32 86, ; 389
	i32 94, ; 390
	i32 221, ; 391
	i32 226, ; 392
	i32 296, ; 393
	i32 30, ; 394
	i32 44, ; 395
	i32 235, ; 396
	i32 200, ; 397
	i32 107, ; 398
	i32 156, ; 399
	i32 34, ; 400
	i32 22, ; 401
	i32 112, ; 402
	i32 56, ; 403
	i32 260, ; 404
	i32 142, ; 405
	i32 116, ; 406
	i32 118, ; 407
	i32 108, ; 408
	i32 202, ; 409
	i32 137, ; 410
	i32 208, ; 411
	i32 282, ; 412
	i32 53, ; 413
	i32 103, ; 414
	i32 302, ; 415
	i32 191, ; 416
	i32 192, ; 417
	i32 131, ; 418
	i32 274, ; 419
	i32 265, ; 420
	i32 253, ; 421
	i32 308, ; 422
	i32 231, ; 423
	i32 194, ; 424
	i32 157, ; 425
	i32 218, ; 426
	i32 161, ; 427
	i32 130, ; 428
	i32 253, ; 429
	i32 159, ; 430
	i32 242, ; 431
	i32 138, ; 432
	i32 265, ; 433
	i32 261, ; 434
	i32 167, ; 435
	i32 193, ; 436
	i32 172, ; 437
	i32 203, ; 438
	i32 270, ; 439
	i32 39, ; 440
	i32 229, ; 441
	i32 79, ; 442
	i32 55, ; 443
	i32 36, ; 444
	i32 95, ; 445
	i32 164, ; 446
	i32 170, ; 447
	i32 266, ; 448
	i32 80, ; 449
	i32 205, ; 450
	i32 96, ; 451
	i32 29, ; 452
	i32 157, ; 453
	i32 18, ; 454
	i32 125, ; 455
	i32 187, ; 456
	i32 117, ; 457
	i32 225, ; 458
	i32 256, ; 459
	i32 238, ; 460
	i32 258, ; 461
	i32 180, ; 462
	i32 163, ; 463
	i32 233, ; 464
	i32 316, ; 465
	i32 288, ; 466
	i32 255, ; 467
	i32 246, ; 468
	i32 168, ; 469
	i32 16, ; 470
	i32 142, ; 471
	i32 123, ; 472
	i32 116, ; 473
	i32 37, ; 474
	i32 113, ; 475
	i32 46, ; 476
	i32 140, ; 477
	i32 115, ; 478
	i32 33, ; 479
	i32 174, ; 480
	i32 93, ; 481
	i32 52, ; 482
	i32 247, ; 483
	i32 127, ; 484
	i32 151, ; 485
	i32 24, ; 486
	i32 159, ; 487
	i32 224, ; 488
	i32 146, ; 489
	i32 102, ; 490
	i32 87, ; 491
	i32 212, ; 492
	i32 59, ; 493
	i32 140, ; 494
	i32 98, ; 495
	i32 5, ; 496
	i32 13, ; 497
	i32 120, ; 498
	i32 133, ; 499
	i32 27, ; 500
	i32 288, ; 501
	i32 70, ; 502
	i32 222, ; 503
	i32 24, ; 504
	i32 0, ; 505
	i32 210, ; 506
	i32 251, ; 507
	i32 248, ; 508
	i32 305, ; 509
	i32 135, ; 510
	i32 203, ; 511
	i32 219, ; 512
	i32 166, ; 513
	i32 252, ; 514
	i32 284, ; 515
	i32 99, ; 516
	i32 121, ; 517
	i32 223, ; 518
	i32 177, ; 519
	i32 178, ; 520
	i32 161, ; 521
	i32 165, ; 522
	i32 226, ; 523
	i32 38, ; 524
	i32 189, ; 525
	i32 303, ; 526
	i32 17, ; 527
	i32 169, ; 528
	i32 304, ; 529
	i32 135, ; 530
	i32 148, ; 531
	i32 215, ; 532
	i32 153, ; 533
	i32 128, ; 534
	i32 19, ; 535
	i32 63, ; 536
	i32 145, ; 537
	i32 46, ; 538
	i32 312, ; 539
	i32 314, ; 540
	i32 201, ; 541
	i32 77, ; 542
	i32 60, ; 543
	i32 104, ; 544
	i32 250, ; 545
	i32 205, ; 546
	i32 48, ; 547
	i32 236, ; 548
	i32 309, ; 549
	i32 247, ; 550
	i32 14, ; 551
	i32 176, ; 552
	i32 66, ; 553
	i32 169, ; 554
	i32 211, ; 555
	i32 215, ; 556
	i32 76, ; 557
	i32 220, ; 558
	i32 106, ; 559
	i32 204, ; 560
	i32 246, ; 561
	i32 65, ; 562
	i32 197, ; 563
	i32 196, ; 564
	i32 158, ; 565
	i32 284, ; 566
	i32 315, ; 567
	i32 213, ; 568
	i32 10, ; 569
	i32 189, ; 570
	i32 11, ; 571
	i32 171, ; 572
	i32 76, ; 573
	i32 124, ; 574
	i32 81, ; 575
	i32 179, ; 576
	i32 64, ; 577
	i32 105, ; 578
	i32 63, ; 579
	i32 126, ; 580
	i32 120, ; 581
	i32 75, ; 582
	i32 261, ; 583
	i32 251, ; 584
	i32 8, ; 585
	i32 219, ; 586
	i32 2, ; 587
	i32 300, ; 588
	i32 43, ; 589
	i32 264, ; 590
	i32 154, ; 591
	i32 126, ; 592
	i32 249, ; 593
	i32 23, ; 594
	i32 131, ; 595
	i32 207, ; 596
	i32 238, ; 597
	i32 28, ; 598
	i32 206, ; 599
	i32 61, ; 600
	i32 191, ; 601
	i32 88, ; 602
	i32 85, ; 603
	i32 146, ; 604
	i32 286, ; 605
	i32 193, ; 606
	i32 35, ; 607
	i32 84, ; 608
	i32 227, ; 609
	i32 310, ; 610
	i32 178, ; 611
	i32 49, ; 612
	i32 6, ; 613
	i32 88, ; 614
	i32 310, ; 615
	i32 21, ; 616
	i32 160, ; 617
	i32 94, ; 618
	i32 49, ; 619
	i32 111, ; 620
	i32 243, ; 621
	i32 128, ; 622
	i32 74, ; 623
	i32 196, ; 624
	i32 299, ; 625
	i32 220, ; 626
	i32 242, ; 627
	i32 7, ; 628
	i32 190, ; 629
	i32 173, ; 630
	i32 108, ; 631
	i32 243, ; 632
	i32 229 ; 633
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
