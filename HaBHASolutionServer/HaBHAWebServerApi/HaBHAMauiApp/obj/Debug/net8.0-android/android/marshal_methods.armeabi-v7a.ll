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

@assembly_image_cache = dso_local local_unnamed_addr global [338 x ptr] zeroinitializer, align 4

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [670 x i32] [
	i32 2616222, ; 0: System.Net.NetworkInformation.dll => 0x27eb9e => 67
	i32 10166715, ; 1: System.Net.NameResolution.dll => 0x9b21bb => 66
	i32 10266594, ; 2: LiveChartsCore.SkiaSharpView.dll => 0x9ca7e2 => 175
	i32 15721112, ; 3: System.Runtime.Intrinsics.dll => 0xefe298 => 107
	i32 32687329, ; 4: Xamarin.AndroidX.Lifecycle.Runtime => 0x1f2c4e1 => 253
	i32 34715100, ; 5: Xamarin.Google.Guava.ListenableFuture.dll => 0x211b5dc => 287
	i32 34839235, ; 6: System.IO.FileSystem.DriveInfo => 0x2139ac3 => 48
	i32 38948123, ; 7: ar\Microsoft.Maui.Controls.resources.dll => 0x2524d1b => 299
	i32 39109920, ; 8: Newtonsoft.Json.dll => 0x254c520 => 200
	i32 39485524, ; 9: System.Net.WebSockets.dll => 0x25a8054 => 79
	i32 42244203, ; 10: he\Microsoft.Maui.Controls.resources.dll => 0x284986b => 308
	i32 42639949, ; 11: System.Threading.Thread => 0x28aa24d => 142
	i32 66541672, ; 12: System.Diagnostics.StackTrace => 0x3f75868 => 30
	i32 67008169, ; 13: zh-Hant\Microsoft.Maui.Controls.resources => 0x3fe76a9 => 332
	i32 68219467, ; 14: System.Security.Cryptography.Primitives => 0x410f24b => 123
	i32 72070932, ; 15: Microsoft.Maui.Graphics.dll => 0x44bb714 => 198
	i32 82292897, ; 16: System.Runtime.CompilerServices.VisualC.dll => 0x4e7b0a1 => 101
	i32 83839681, ; 17: ms\Microsoft.Maui.Controls.resources.dll => 0x4ff4ac1 => 316
	i32 98325684, ; 18: Microsoft.Extensions.Diagnostics.Abstractions => 0x5dc54b4 => 184
	i32 101534019, ; 19: Xamarin.AndroidX.SlidingPaneLayout => 0x60d4943 => 271
	i32 117431740, ; 20: System.Runtime.InteropServices => 0x6ffddbc => 106
	i32 120558881, ; 21: Xamarin.AndroidX.SlidingPaneLayout.dll => 0x72f9521 => 271
	i32 122350210, ; 22: System.Threading.Channels.dll => 0x74aea82 => 136
	i32 134690465, ; 23: Xamarin.Kotlin.StdLib.Jdk7.dll => 0x80736a1 => 295
	i32 135327312, ; 24: HaBHAMauiApp.dll => 0x810ee50 => 0
	i32 136584136, ; 25: zh-Hans\Microsoft.Maui.Controls.resources.dll => 0x8241bc8 => 331
	i32 140062828, ; 26: sk\Microsoft.Maui.Controls.resources.dll => 0x859306c => 324
	i32 142721839, ; 27: System.Net.WebHeaderCollection => 0x881c32f => 76
	i32 149972175, ; 28: System.Security.Cryptography.Primitives.dll => 0x8f064cf => 123
	i32 159306688, ; 29: System.ComponentModel.Annotations => 0x97ed3c0 => 13
	i32 165246403, ; 30: Xamarin.AndroidX.Collection.dll => 0x9d975c3 => 227
	i32 176265551, ; 31: System.ServiceProcess => 0xa81994f => 131
	i32 182336117, ; 32: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 273
	i32 184328833, ; 33: System.ValueTuple.dll => 0xafca281 => 148
	i32 205061960, ; 34: System.ComponentModel => 0xc38ff48 => 18
	i32 208260720, ; 35: ApiLibrary => 0xc69ce70 => 333
	i32 209399409, ; 36: Xamarin.AndroidX.Browser.dll => 0xc7b2e71 => 225
	i32 220171995, ; 37: System.Diagnostics.Debug => 0xd1f8edb => 26
	i32 221958352, ; 38: Microsoft.Extensions.Diagnostics.dll => 0xd3ad0d0 => 183
	i32 230216969, ; 39: Xamarin.AndroidX.Legacy.Support.Core.Utils.dll => 0xdb8d509 => 247
	i32 230752869, ; 40: Microsoft.CSharp.dll => 0xdc10265 => 1
	i32 231409092, ; 41: System.Linq.Parallel => 0xdcb05c4 => 59
	i32 231814094, ; 42: System.Globalization => 0xdd133ce => 42
	i32 246610117, ; 43: System.Reflection.Emit.Lightweight => 0xeb2f8c5 => 90
	i32 261689757, ; 44: Xamarin.AndroidX.ConstraintLayout.dll => 0xf99119d => 230
	i32 276479776, ; 45: System.Threading.Timer.dll => 0x107abf20 => 144
	i32 278686392, ; 46: Xamarin.AndroidX.Lifecycle.LiveData.dll => 0x109c6ab8 => 249
	i32 280482487, ; 47: Xamarin.AndroidX.Interpolator => 0x10b7d2b7 => 246
	i32 291076382, ; 48: System.IO.Pipes.AccessControl.dll => 0x1159791e => 54
	i32 291275502, ; 49: Microsoft.Extensions.Http.dll => 0x115c82ee => 185
	i32 298918909, ; 50: System.Net.Ping.dll => 0x11d123fd => 68
	i32 317674968, ; 51: vi\Microsoft.Maui.Controls.resources => 0x12ef55d8 => 329
	i32 318968648, ; 52: Xamarin.AndroidX.Activity.dll => 0x13031348 => 216
	i32 321597661, ; 53: System.Numerics => 0x132b30dd => 82
	i32 321963286, ; 54: fr\Microsoft.Maui.Controls.resources.dll => 0x1330c516 => 307
	i32 342366114, ; 55: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 248
	i32 360082299, ; 56: System.ServiceModel.Web => 0x15766b7b => 130
	i32 367780167, ; 57: System.IO.Pipes => 0x15ebe147 => 55
	i32 374914964, ; 58: System.Transactions.Local => 0x1658bf94 => 146
	i32 375677976, ; 59: System.Net.ServicePoint.dll => 0x16646418 => 73
	i32 379916513, ; 60: System.Threading.Thread.dll => 0x16a510e1 => 142
	i32 385762202, ; 61: System.Memory.dll => 0x16fe439a => 62
	i32 392610295, ; 62: System.Threading.ThreadPool.dll => 0x1766c1f7 => 143
	i32 395744057, ; 63: _Microsoft.Android.Resource.Designer => 0x17969339 => 334
	i32 403441872, ; 64: WindowsBase => 0x180c08d0 => 162
	i32 409257351, ; 65: tr\Microsoft.Maui.Controls.resources.dll => 0x1864c587 => 327
	i32 441335492, ; 66: Xamarin.AndroidX.ConstraintLayout.Core => 0x1a4e3ec4 => 231
	i32 442565967, ; 67: System.Collections => 0x1a61054f => 12
	i32 450948140, ; 68: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 244
	i32 451504562, ; 69: System.Security.Cryptography.X509Certificates => 0x1ae969b2 => 124
	i32 456227837, ; 70: System.Web.HttpUtility.dll => 0x1b317bfd => 149
	i32 459347974, ; 71: System.Runtime.Serialization.Primitives.dll => 0x1b611806 => 112
	i32 465846621, ; 72: mscorlib => 0x1bc4415d => 163
	i32 469710990, ; 73: System.dll => 0x1bff388e => 161
	i32 476646585, ; 74: Xamarin.AndroidX.Interpolator.dll => 0x1c690cb9 => 246
	i32 486930444, ; 75: Xamarin.AndroidX.LocalBroadcastManager.dll => 0x1d05f80c => 259
	i32 489220957, ; 76: es\Microsoft.Maui.Controls.resources.dll => 0x1d28eb5d => 305
	i32 498788369, ; 77: System.ObjectModel => 0x1dbae811 => 83
	i32 513247710, ; 78: Microsoft.Extensions.Primitives.dll => 0x1e9789de => 191
	i32 525008092, ; 79: SkiaSharp.dll => 0x1f4afcdc => 202
	i32 526420162, ; 80: System.Transactions.dll => 0x1f6088c2 => 147
	i32 527452488, ; 81: Xamarin.Kotlin.StdLib.Jdk7 => 0x1f704948 => 295
	i32 530272170, ; 82: System.Linq.Queryable => 0x1f9b4faa => 60
	i32 538707440, ; 83: th\Microsoft.Maui.Controls.resources.dll => 0x201c05f0 => 326
	i32 539058512, ; 84: Microsoft.Extensions.Logging => 0x20216150 => 186
	i32 540030774, ; 85: System.IO.FileSystem.dll => 0x20303736 => 51
	i32 545304856, ; 86: System.Runtime.Extensions => 0x2080b118 => 102
	i32 546455878, ; 87: System.Runtime.Serialization.Xml => 0x20924146 => 113
	i32 549171840, ; 88: System.Globalization.Calendars => 0x20bbb280 => 40
	i32 557405415, ; 89: Jsr305Binding => 0x213954e7 => 284
	i32 569601784, ; 90: Xamarin.AndroidX.Window.Extensions.Core.Core => 0x21f36ef8 => 282
	i32 577335427, ; 91: System.Security.Cryptography.Cng => 0x22697083 => 119
	i32 601371474, ; 92: System.IO.IsolatedStorage.dll => 0x23d83352 => 52
	i32 605376203, ; 93: System.IO.Compression.FileSystem => 0x24154ecb => 44
	i32 613668793, ; 94: System.Security.Cryptography.Algorithms => 0x2493d7b9 => 118
	i32 627609679, ; 95: Xamarin.AndroidX.CustomView => 0x2568904f => 236
	i32 627931235, ; 96: nl\Microsoft.Maui.Controls.resources => 0x256d7863 => 318
	i32 639843206, ; 97: Xamarin.AndroidX.Emoji2.ViewsHelper.dll => 0x26233b86 => 242
	i32 643868501, ; 98: System.Net => 0x2660a755 => 80
	i32 662205335, ; 99: System.Text.Encodings.Web.dll => 0x27787397 => 210
	i32 663517072, ; 100: Xamarin.AndroidX.VersionedParcelable => 0x278c7790 => 278
	i32 666292255, ; 101: Xamarin.AndroidX.Arch.Core.Common.dll => 0x27b6d01f => 223
	i32 672442732, ; 102: System.Collections.Concurrent => 0x2814a96c => 8
	i32 683518922, ; 103: System.Net.Security => 0x28bdabca => 72
	i32 690569205, ; 104: System.Xml.Linq.dll => 0x29293ff5 => 152
	i32 691348768, ; 105: Xamarin.KotlinX.Coroutines.Android.dll => 0x29352520 => 297
	i32 693804605, ; 106: System.Windows => 0x295a9e3d => 151
	i32 699345723, ; 107: System.Reflection.Emit => 0x29af2b3b => 91
	i32 700284507, ; 108: Xamarin.Jetbrains.Annotations => 0x29bd7e5b => 292
	i32 700358131, ; 109: System.IO.Compression.ZipFile => 0x29be9df3 => 45
	i32 720511267, ; 110: Xamarin.Kotlin.StdLib.Jdk8 => 0x2af22123 => 296
	i32 722857257, ; 111: System.Runtime.Loader.dll => 0x2b15ed29 => 108
	i32 731701662, ; 112: Microsoft.Extensions.Options.ConfigurationExtensions => 0x2b9ce19e => 190
	i32 735137430, ; 113: System.Security.SecureString.dll => 0x2bd14e96 => 128
	i32 736260964, ; 114: LiveChartsCore.Behaviours => 0x2be27364 => 174
	i32 752232764, ; 115: System.Diagnostics.Contracts.dll => 0x2cd6293c => 25
	i32 755313932, ; 116: Xamarin.Android.Glide.Annotations.dll => 0x2d052d0c => 213
	i32 759454413, ; 117: System.Net.Requests => 0x2d445acd => 71
	i32 762598435, ; 118: System.IO.Pipes.dll => 0x2d745423 => 55
	i32 775507847, ; 119: System.IO.Compression => 0x2e394f87 => 46
	i32 777317022, ; 120: sk\Microsoft.Maui.Controls.resources => 0x2e54ea9e => 324
	i32 778756650, ; 121: SkiaSharp.HarfBuzz.dll => 0x2e6ae22a => 203
	i32 789151979, ; 122: Microsoft.Extensions.Options => 0x2f0980eb => 189
	i32 790371945, ; 123: Xamarin.AndroidX.CustomView.PoolingContainer.dll => 0x2f1c1e69 => 237
	i32 804715423, ; 124: System.Data.Common => 0x2ff6fb9f => 22
	i32 807930345, ; 125: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx.dll => 0x302809e9 => 251
	i32 823281589, ; 126: System.Private.Uri.dll => 0x311247b5 => 85
	i32 830298997, ; 127: System.IO.Compression.Brotli => 0x317d5b75 => 43
	i32 832635846, ; 128: System.Xml.XPath.dll => 0x31a103c6 => 157
	i32 834051424, ; 129: System.Net.Quic => 0x31b69d60 => 70
	i32 843511501, ; 130: Xamarin.AndroidX.Print => 0x3246f6cd => 264
	i32 869139383, ; 131: hi\Microsoft.Maui.Controls.resources.dll => 0x33ce03b7 => 309
	i32 873119928, ; 132: Microsoft.VisualBasic => 0x340ac0b8 => 3
	i32 877678880, ; 133: System.Globalization.dll => 0x34505120 => 42
	i32 878954865, ; 134: System.Net.Http.Json => 0x3463c971 => 209
	i32 880668424, ; 135: ru\Microsoft.Maui.Controls.resources.dll => 0x347def08 => 323
	i32 904024072, ; 136: System.ComponentModel.Primitives.dll => 0x35e25008 => 16
	i32 908888060, ; 137: Microsoft.Maui.Maps => 0x362c87fc => 199
	i32 911108515, ; 138: System.IO.MemoryMappedFiles.dll => 0x364e69a3 => 53
	i32 918734561, ; 139: pt-BR\Microsoft.Maui.Controls.resources.dll => 0x36c2c6e1 => 320
	i32 928116545, ; 140: Xamarin.Google.Guava.ListenableFuture => 0x3751ef41 => 287
	i32 952186615, ; 141: System.Runtime.InteropServices.JavaScript.dll => 0x38c136f7 => 104
	i32 955402788, ; 142: Newtonsoft.Json => 0x38f24a24 => 200
	i32 956575887, ; 143: Xamarin.Kotlin.StdLib.Jdk8.dll => 0x3904308f => 296
	i32 961460050, ; 144: it\Microsoft.Maui.Controls.resources.dll => 0x394eb752 => 313
	i32 966729478, ; 145: Xamarin.Google.Crypto.Tink.Android => 0x399f1f06 => 285
	i32 967690846, ; 146: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 248
	i32 975236339, ; 147: System.Diagnostics.Tracing => 0x3a20ecf3 => 34
	i32 975874589, ; 148: System.Xml.XDocument => 0x3a2aaa1d => 155
	i32 986514023, ; 149: System.Private.DataContractSerialization.dll => 0x3acd0267 => 84
	i32 987214855, ; 150: System.Diagnostics.Tools => 0x3ad7b407 => 32
	i32 990727110, ; 151: ro\Microsoft.Maui.Controls.resources.dll => 0x3b0d4bc6 => 322
	i32 992768348, ; 152: System.Collections.dll => 0x3b2c715c => 12
	i32 994442037, ; 153: System.IO.FileSystem => 0x3b45fb35 => 51
	i32 1001831731, ; 154: System.IO.UnmanagedMemoryStream.dll => 0x3bb6bd33 => 56
	i32 1012816738, ; 155: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 268
	i32 1019214401, ; 156: System.Drawing => 0x3cbffa41 => 36
	i32 1028951442, ; 157: Microsoft.Extensions.DependencyInjection.Abstractions => 0x3d548d92 => 182
	i32 1031528504, ; 158: Xamarin.Google.ErrorProne.Annotations.dll => 0x3d7be038 => 286
	i32 1034083993, ; 159: LiveChartsCore.SkiaSharpView.Maui.dll => 0x3da2de99 => 176
	i32 1035644815, ; 160: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 221
	i32 1036536393, ; 161: System.Drawing.Primitives.dll => 0x3dc84a49 => 35
	i32 1043950537, ; 162: de\Microsoft.Maui.Controls.resources.dll => 0x3e396bc9 => 303
	i32 1044663988, ; 163: System.Linq.Expressions.dll => 0x3e444eb4 => 58
	i32 1048992957, ; 164: Microsoft.Extensions.Diagnostics.Abstractions.dll => 0x3e865cbd => 184
	i32 1052210849, ; 165: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x3eb776a1 => 255
	i32 1067306892, ; 166: GoogleGson => 0x3f9dcf8c => 171
	i32 1082857460, ; 167: System.ComponentModel.TypeConverter => 0x408b17f4 => 17
	i32 1084122840, ; 168: Xamarin.Kotlin.StdLib => 0x409e66d8 => 293
	i32 1098259244, ; 169: System => 0x41761b2c => 161
	i32 1108272742, ; 170: sv\Microsoft.Maui.Controls.resources.dll => 0x420ee666 => 325
	i32 1117529484, ; 171: pl\Microsoft.Maui.Controls.resources.dll => 0x429c258c => 319
	i32 1118262833, ; 172: ko\Microsoft.Maui.Controls.resources => 0x42a75631 => 315
	i32 1121599056, ; 173: Xamarin.AndroidX.Lifecycle.Runtime.Ktx.dll => 0x42da3e50 => 254
	i32 1127624469, ; 174: Microsoft.Extensions.Logging.Debug => 0x43362f15 => 188
	i32 1149092582, ; 175: Xamarin.AndroidX.Window => 0x447dc2e6 => 281
	i32 1168523401, ; 176: pt\Microsoft.Maui.Controls.resources => 0x45a64089 => 321
	i32 1170634674, ; 177: System.Web.dll => 0x45c677b2 => 150
	i32 1175144683, ; 178: Xamarin.AndroidX.VectorDrawable.Animated => 0x460b48eb => 277
	i32 1178241025, ; 179: Xamarin.AndroidX.Navigation.Runtime.dll => 0x463a8801 => 262
	i32 1204270330, ; 180: Xamarin.AndroidX.Arch.Core.Common => 0x47c7b4fa => 223
	i32 1208641965, ; 181: System.Diagnostics.Process => 0x480a69ad => 29
	i32 1214827643, ; 182: CommunityToolkit.Mvvm => 0x4868cc7b => 170
	i32 1219128291, ; 183: System.IO.IsolatedStorage => 0x48aa6be3 => 52
	i32 1243150071, ; 184: Xamarin.AndroidX.Window.Extensions.Core.Core.dll => 0x4a18f6f7 => 282
	i32 1253011324, ; 185: Microsoft.Win32.Registry => 0x4aaf6f7c => 5
	i32 1260983243, ; 186: cs\Microsoft.Maui.Controls.resources => 0x4b2913cb => 301
	i32 1264511973, ; 187: Xamarin.AndroidX.Startup.StartupRuntime.dll => 0x4b5eebe5 => 272
	i32 1267360935, ; 188: Xamarin.AndroidX.VectorDrawable => 0x4b8a64a7 => 276
	i32 1273260888, ; 189: Xamarin.AndroidX.Collection.Ktx => 0x4be46b58 => 228
	i32 1275534314, ; 190: Xamarin.KotlinX.Coroutines.Android => 0x4c071bea => 297
	i32 1278448581, ; 191: Xamarin.AndroidX.Annotation.Jvm => 0x4c3393c5 => 220
	i32 1283425954, ; 192: LiveChartsCore.SkiaSharpView => 0x4c7f86a2 => 175
	i32 1293217323, ; 193: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 239
	i32 1308624726, ; 194: hr\Microsoft.Maui.Controls.resources.dll => 0x4e000756 => 310
	i32 1309188875, ; 195: System.Private.DataContractSerialization => 0x4e08a30b => 84
	i32 1322716291, ; 196: Xamarin.AndroidX.Window.dll => 0x4ed70c83 => 281
	i32 1324164729, ; 197: System.Linq => 0x4eed2679 => 61
	i32 1335329327, ; 198: System.Runtime.Serialization.Json.dll => 0x4f97822f => 111
	i32 1336711579, ; 199: zh-HK\Microsoft.Maui.Controls.resources.dll => 0x4fac999b => 330
	i32 1364015309, ; 200: System.IO => 0x514d38cd => 57
	i32 1373134921, ; 201: zh-Hans\Microsoft.Maui.Controls.resources => 0x51d86049 => 331
	i32 1376866003, ; 202: Xamarin.AndroidX.SavedState => 0x52114ed3 => 268
	i32 1379779777, ; 203: System.Resources.ResourceManager => 0x523dc4c1 => 98
	i32 1402170036, ; 204: System.Configuration.dll => 0x53936ab4 => 19
	i32 1406073936, ; 205: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 232
	i32 1408764838, ; 206: System.Runtime.Serialization.Formatters.dll => 0x53f80ba6 => 110
	i32 1411638395, ; 207: System.Runtime.CompilerServices.Unsafe => 0x5423e47b => 100
	i32 1422545099, ; 208: System.Runtime.CompilerServices.VisualC => 0x54ca50cb => 101
	i32 1430672901, ; 209: ar\Microsoft.Maui.Controls.resources => 0x55465605 => 299
	i32 1434145427, ; 210: System.Runtime.Handles => 0x557b5293 => 103
	i32 1435222561, ; 211: Xamarin.Google.Crypto.Tink.Android.dll => 0x558bc221 => 285
	i32 1439761251, ; 212: System.Net.Quic.dll => 0x55d10363 => 70
	i32 1452070440, ; 213: System.Formats.Asn1.dll => 0x568cd628 => 38
	i32 1453312822, ; 214: System.Diagnostics.Tools.dll => 0x569fcb36 => 32
	i32 1457743152, ; 215: System.Runtime.Extensions.dll => 0x56e36530 => 102
	i32 1458022317, ; 216: System.Net.Security.dll => 0x56e7a7ad => 72
	i32 1461004990, ; 217: es\Microsoft.Maui.Controls.resources => 0x57152abe => 305
	i32 1461234159, ; 218: System.Collections.Immutable.dll => 0x5718a9ef => 9
	i32 1461719063, ; 219: System.Security.Cryptography.OpenSsl => 0x57201017 => 122
	i32 1462112819, ; 220: System.IO.Compression.dll => 0x57261233 => 46
	i32 1469204771, ; 221: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 222
	i32 1470490898, ; 222: Microsoft.Extensions.Primitives => 0x57a5e912 => 191
	i32 1479771757, ; 223: System.Collections.Immutable => 0x5833866d => 9
	i32 1480492111, ; 224: System.IO.Compression.Brotli.dll => 0x583e844f => 43
	i32 1487239319, ; 225: Microsoft.Win32.Primitives => 0x58a57897 => 4
	i32 1490025113, ; 226: Xamarin.AndroidX.SavedState.SavedState.Ktx.dll => 0x58cffa99 => 269
	i32 1505131794, ; 227: Microsoft.Extensions.Http => 0x59b67d12 => 185
	i32 1526286932, ; 228: vi\Microsoft.Maui.Controls.resources.dll => 0x5af94a54 => 329
	i32 1536373174, ; 229: System.Diagnostics.TextWriterTraceListener => 0x5b9331b6 => 31
	i32 1543031311, ; 230: System.Text.RegularExpressions.dll => 0x5bf8ca0f => 135
	i32 1543355203, ; 231: System.Reflection.Emit.dll => 0x5bfdbb43 => 91
	i32 1550322496, ; 232: System.Reflection.Extensions.dll => 0x5c680b40 => 92
	i32 1565862583, ; 233: System.IO.FileSystem.Primitives => 0x5d552ab7 => 49
	i32 1566207040, ; 234: System.Threading.Tasks.Dataflow.dll => 0x5d5a6c40 => 138
	i32 1573704789, ; 235: System.Runtime.Serialization.Json => 0x5dccd455 => 111
	i32 1580037396, ; 236: System.Threading.Overlapped => 0x5e2d7514 => 137
	i32 1582372066, ; 237: Xamarin.AndroidX.DocumentFile.dll => 0x5e5114e2 => 238
	i32 1592978981, ; 238: System.Runtime.Serialization.dll => 0x5ef2ee25 => 114
	i32 1597949149, ; 239: Xamarin.Google.ErrorProne.Annotations => 0x5f3ec4dd => 286
	i32 1601112923, ; 240: System.Xml.Serialization => 0x5f6f0b5b => 154
	i32 1604827217, ; 241: System.Net.WebClient => 0x5fa7b851 => 75
	i32 1618516317, ; 242: System.Net.WebSockets.Client.dll => 0x6078995d => 78
	i32 1622152042, ; 243: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 258
	i32 1622358360, ; 244: System.Dynamic.Runtime => 0x60b33958 => 37
	i32 1623212457, ; 245: SkiaSharp.Views.Maui.Controls => 0x60c041a9 => 205
	i32 1624863272, ; 246: Xamarin.AndroidX.ViewPager2 => 0x60d97228 => 280
	i32 1635184631, ; 247: Xamarin.AndroidX.Emoji2.ViewsHelper => 0x6176eff7 => 242
	i32 1636350590, ; 248: Xamarin.AndroidX.CursorAdapter => 0x6188ba7e => 235
	i32 1639515021, ; 249: System.Net.Http.dll => 0x61b9038d => 63
	i32 1639986890, ; 250: System.Text.RegularExpressions => 0x61c036ca => 135
	i32 1641389582, ; 251: System.ComponentModel.EventBasedAsync.dll => 0x61d59e0e => 15
	i32 1657153582, ; 252: System.Runtime => 0x62c6282e => 115
	i32 1658241508, ; 253: Xamarin.AndroidX.Tracing.Tracing.dll => 0x62d6c1e4 => 274
	i32 1658251792, ; 254: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 283
	i32 1670060433, ; 255: Xamarin.AndroidX.ConstraintLayout => 0x638b1991 => 230
	i32 1675553242, ; 256: System.IO.FileSystem.DriveInfo.dll => 0x63dee9da => 48
	i32 1677501392, ; 257: System.Net.Primitives.dll => 0x63fca3d0 => 69
	i32 1678508291, ; 258: System.Net.WebSockets => 0x640c0103 => 79
	i32 1679769178, ; 259: System.Security.Cryptography => 0x641f3e5a => 125
	i32 1691477237, ; 260: System.Reflection.Metadata => 0x64d1e4f5 => 93
	i32 1696967625, ; 261: System.Security.Cryptography.Csp => 0x6525abc9 => 120
	i32 1698840827, ; 262: Xamarin.Kotlin.StdLib.Common => 0x654240fb => 294
	i32 1701541528, ; 263: System.Diagnostics.Debug.dll => 0x656b7698 => 26
	i32 1720223769, ; 264: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx => 0x66888819 => 251
	i32 1726116996, ; 265: System.Reflection.dll => 0x66e27484 => 96
	i32 1728033016, ; 266: System.Diagnostics.FileVersionInfo.dll => 0x66ffb0f8 => 28
	i32 1729485958, ; 267: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 226
	i32 1743415430, ; 268: ca\Microsoft.Maui.Controls.resources => 0x67ea6886 => 300
	i32 1744735666, ; 269: System.Transactions.Local.dll => 0x67fe8db2 => 146
	i32 1746115085, ; 270: System.IO.Pipelines.dll => 0x68139a0d => 208
	i32 1746316138, ; 271: Mono.Android.Export => 0x6816ab6a => 166
	i32 1750313021, ; 272: Microsoft.Win32.Primitives.dll => 0x6853a83d => 4
	i32 1758240030, ; 273: System.Resources.Reader.dll => 0x68cc9d1e => 97
	i32 1763938596, ; 274: System.Diagnostics.TraceSource.dll => 0x69239124 => 33
	i32 1765942094, ; 275: System.Reflection.Extensions => 0x6942234e => 92
	i32 1766324549, ; 276: Xamarin.AndroidX.SwipeRefreshLayout => 0x6947f945 => 273
	i32 1770582343, ; 277: Microsoft.Extensions.Logging.dll => 0x6988f147 => 186
	i32 1776026572, ; 278: System.Core.dll => 0x69dc03cc => 21
	i32 1777075843, ; 279: System.Globalization.Extensions.dll => 0x69ec0683 => 41
	i32 1780572499, ; 280: Mono.Android.Runtime.dll => 0x6a216153 => 167
	i32 1782862114, ; 281: ms\Microsoft.Maui.Controls.resources => 0x6a445122 => 316
	i32 1788241197, ; 282: Xamarin.AndroidX.Fragment => 0x6a96652d => 244
	i32 1793755602, ; 283: he\Microsoft.Maui.Controls.resources => 0x6aea89d2 => 308
	i32 1808609942, ; 284: Xamarin.AndroidX.Loader => 0x6bcd3296 => 258
	i32 1813058853, ; 285: Xamarin.Kotlin.StdLib.dll => 0x6c111525 => 293
	i32 1813201214, ; 286: Xamarin.Google.Android.Material => 0x6c13413e => 283
	i32 1818569960, ; 287: Xamarin.AndroidX.Navigation.UI.dll => 0x6c652ce8 => 263
	i32 1818787751, ; 288: Microsoft.VisualBasic.Core => 0x6c687fa7 => 2
	i32 1824175904, ; 289: System.Text.Encoding.Extensions => 0x6cbab720 => 133
	i32 1824722060, ; 290: System.Runtime.Serialization.Formatters => 0x6cc30c8c => 110
	i32 1828688058, ; 291: Microsoft.Extensions.Logging.Abstractions.dll => 0x6cff90ba => 187
	i32 1847515442, ; 292: Xamarin.Android.Glide.Annotations => 0x6e1ed932 => 213
	i32 1853025655, ; 293: sv\Microsoft.Maui.Controls.resources => 0x6e72ed77 => 325
	i32 1858542181, ; 294: System.Linq.Expressions => 0x6ec71a65 => 58
	i32 1870277092, ; 295: System.Reflection.Primitives => 0x6f7a29e4 => 94
	i32 1875935024, ; 296: fr\Microsoft.Maui.Controls.resources => 0x6fd07f30 => 307
	i32 1879696579, ; 297: System.Formats.Tar.dll => 0x7009e4c3 => 39
	i32 1885316902, ; 298: Xamarin.AndroidX.Arch.Core.Runtime.dll => 0x705fa726 => 224
	i32 1888955245, ; 299: System.Diagnostics.Contracts => 0x70972b6d => 25
	i32 1889954781, ; 300: System.Reflection.Metadata.dll => 0x70a66bdd => 93
	i32 1893218855, ; 301: cs\Microsoft.Maui.Controls.resources.dll => 0x70d83a27 => 301
	i32 1898237753, ; 302: System.Reflection.DispatchProxy => 0x7124cf39 => 88
	i32 1900610850, ; 303: System.Resources.ResourceManager.dll => 0x71490522 => 98
	i32 1908813208, ; 304: Xamarin.GooglePlayServices.Basement => 0x71c62d98 => 289
	i32 1910275211, ; 305: System.Collections.NonGeneric.dll => 0x71dc7c8b => 10
	i32 1939592360, ; 306: System.Private.Xml.Linq => 0x739bd4a8 => 86
	i32 1953182387, ; 307: id\Microsoft.Maui.Controls.resources.dll => 0x746b32b3 => 312
	i32 1956758971, ; 308: System.Resources.Writer => 0x74a1c5bb => 99
	i32 1961813231, ; 309: Xamarin.AndroidX.Security.SecurityCrypto.dll => 0x74eee4ef => 270
	i32 1968388702, ; 310: Microsoft.Extensions.Configuration.dll => 0x75533a5e => 178
	i32 1983156543, ; 311: Xamarin.Kotlin.StdLib.Common.dll => 0x7634913f => 294
	i32 1985761444, ; 312: Xamarin.Android.Glide.GifDecoder => 0x765c50a4 => 215
	i32 2003115576, ; 313: el\Microsoft.Maui.Controls.resources => 0x77651e38 => 304
	i32 2011961780, ; 314: System.Buffers.dll => 0x77ec19b4 => 7
	i32 2019465201, ; 315: Xamarin.AndroidX.Lifecycle.ViewModel => 0x785e97f1 => 255
	i32 2031763787, ; 316: Xamarin.Android.Glide => 0x791a414b => 212
	i32 2045470958, ; 317: System.Private.Xml => 0x79eb68ee => 87
	i32 2048278909, ; 318: Microsoft.Extensions.Configuration.Binder.dll => 0x7a16417d => 180
	i32 2055257422, ; 319: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 250
	i32 2060060697, ; 320: System.Windows.dll => 0x7aca0819 => 151
	i32 2066184531, ; 321: de\Microsoft.Maui.Controls.resources => 0x7b277953 => 303
	i32 2070888862, ; 322: System.Diagnostics.TraceSource => 0x7b6f419e => 33
	i32 2079903147, ; 323: System.Runtime.dll => 0x7bf8cdab => 115
	i32 2090596640, ; 324: System.Numerics.Vectors => 0x7c9bf920 => 81
	i32 2127167465, ; 325: System.Console => 0x7ec9ffe9 => 20
	i32 2129483829, ; 326: Xamarin.GooglePlayServices.Base.dll => 0x7eed5835 => 288
	i32 2142473426, ; 327: System.Collections.Specialized => 0x7fb38cd2 => 11
	i32 2143790110, ; 328: System.Xml.XmlSerializer.dll => 0x7fc7a41e => 159
	i32 2146852085, ; 329: Microsoft.VisualBasic.dll => 0x7ff65cf5 => 3
	i32 2159891885, ; 330: Microsoft.Maui => 0x80bd55ad => 196
	i32 2169148018, ; 331: hu\Microsoft.Maui.Controls.resources => 0x814a9272 => 311
	i32 2181898931, ; 332: Microsoft.Extensions.Options.dll => 0x820d22b3 => 189
	i32 2188602587, ; 333: Microcharts.Maui => 0x82736cdb => 177
	i32 2192057212, ; 334: Microsoft.Extensions.Logging.Abstractions => 0x82a8237c => 187
	i32 2193016926, ; 335: System.ObjectModel.dll => 0x82b6c85e => 83
	i32 2201107256, ; 336: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x83323b38 => 298
	i32 2201231467, ; 337: System.Net.Http => 0x8334206b => 63
	i32 2207618523, ; 338: it\Microsoft.Maui.Controls.resources => 0x839595db => 313
	i32 2217644978, ; 339: Xamarin.AndroidX.VectorDrawable.Animated.dll => 0x842e93b2 => 277
	i32 2222056684, ; 340: System.Threading.Tasks.Parallel => 0x8471e4ec => 140
	i32 2244775296, ; 341: Xamarin.AndroidX.LocalBroadcastManager => 0x85cc8d80 => 259
	i32 2252106437, ; 342: System.Xml.Serialization.dll => 0x863c6ac5 => 154
	i32 2256313426, ; 343: System.Globalization.Extensions => 0x867c9c52 => 41
	i32 2265110946, ; 344: System.Security.AccessControl.dll => 0x8702d9a2 => 116
	i32 2266799131, ; 345: Microsoft.Extensions.Configuration.Abstractions => 0x871c9c1b => 179
	i32 2267999099, ; 346: Xamarin.Android.Glide.DiskLruCache.dll => 0x872eeb7b => 214
	i32 2279755925, ; 347: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 266
	i32 2293034957, ; 348: System.ServiceModel.Web.dll => 0x88acefcd => 130
	i32 2295906218, ; 349: System.Net.Sockets => 0x88d8bfaa => 74
	i32 2298471582, ; 350: System.Net.Mail => 0x88ffe49e => 65
	i32 2303073227, ; 351: Microsoft.Maui.Controls.Maps.dll => 0x89461bcb => 194
	i32 2303942373, ; 352: nb\Microsoft.Maui.Controls.resources => 0x89535ee5 => 317
	i32 2305521784, ; 353: System.Private.CoreLib.dll => 0x896b7878 => 169
	i32 2315684594, ; 354: Xamarin.AndroidX.Annotation.dll => 0x8a068af2 => 218
	i32 2320631194, ; 355: System.Threading.Tasks.Parallel.dll => 0x8a52059a => 140
	i32 2340441535, ; 356: System.Runtime.InteropServices.RuntimeInformation.dll => 0x8b804dbf => 105
	i32 2344264397, ; 357: System.ValueTuple => 0x8bbaa2cd => 148
	i32 2353062107, ; 358: System.Net.Primitives => 0x8c40e0db => 69
	i32 2364201794, ; 359: SkiaSharp.Views.Maui.Core => 0x8ceadb42 => 207
	i32 2366048013, ; 360: hu\Microsoft.Maui.Controls.resources.dll => 0x8d07070d => 311
	i32 2368005991, ; 361: System.Xml.ReaderWriter.dll => 0x8d24e767 => 153
	i32 2371007202, ; 362: Microsoft.Extensions.Configuration => 0x8d52b2e2 => 178
	i32 2378619854, ; 363: System.Security.Cryptography.Csp.dll => 0x8dc6dbce => 120
	i32 2383496789, ; 364: System.Security.Principal.Windows.dll => 0x8e114655 => 126
	i32 2395872292, ; 365: id\Microsoft.Maui.Controls.resources => 0x8ece1c24 => 312
	i32 2401565422, ; 366: System.Web.HttpUtility => 0x8f24faee => 149
	i32 2403452196, ; 367: Xamarin.AndroidX.Emoji2.dll => 0x8f41c524 => 241
	i32 2415617376, ; 368: HaBHAMauiApp => 0x8ffb6560 => 0
	i32 2421380589, ; 369: System.Threading.Tasks.Dataflow => 0x905355ed => 138
	i32 2423080555, ; 370: Xamarin.AndroidX.Collection.Ktx.dll => 0x906d466b => 228
	i32 2427813419, ; 371: hi\Microsoft.Maui.Controls.resources => 0x90b57e2b => 309
	i32 2435356389, ; 372: System.Console.dll => 0x912896e5 => 20
	i32 2435904999, ; 373: System.ComponentModel.DataAnnotations.dll => 0x9130f5e7 => 14
	i32 2454642406, ; 374: System.Text.Encoding.dll => 0x924edee6 => 134
	i32 2458678730, ; 375: System.Net.Sockets.dll => 0x928c75ca => 74
	i32 2459001652, ; 376: System.Linq.Parallel.dll => 0x92916334 => 59
	i32 2465532216, ; 377: Xamarin.AndroidX.ConstraintLayout.Core.dll => 0x92f50938 => 231
	i32 2471841756, ; 378: netstandard.dll => 0x93554fdc => 164
	i32 2475788418, ; 379: Java.Interop.dll => 0x93918882 => 165
	i32 2480646305, ; 380: Microsoft.Maui.Controls => 0x93dba8a1 => 193
	i32 2483903535, ; 381: System.ComponentModel.EventBasedAsync => 0x940d5c2f => 15
	i32 2484371297, ; 382: System.Net.ServicePoint => 0x94147f61 => 73
	i32 2490993605, ; 383: System.AppContext.dll => 0x94798bc5 => 6
	i32 2501346920, ; 384: System.Data.DataSetExtensions => 0x95178668 => 23
	i32 2503351294, ; 385: ko\Microsoft.Maui.Controls.resources.dll => 0x95361bfe => 315
	i32 2505896520, ; 386: Xamarin.AndroidX.Lifecycle.Runtime.dll => 0x955cf248 => 253
	i32 2521915375, ; 387: SkiaSharp.Views.Maui.Controls.Compatibility => 0x96515fef => 206
	i32 2522472828, ; 388: Xamarin.Android.Glide.dll => 0x9659e17c => 212
	i32 2538310050, ; 389: System.Reflection.Emit.Lightweight.dll => 0x974b89a2 => 90
	i32 2550873716, ; 390: hr\Microsoft.Maui.Controls.resources => 0x980b3e74 => 310
	i32 2556439392, ; 391: LiveChartsCore.SkiaSharpView.Maui => 0x98602b60 => 176
	i32 2562349572, ; 392: Microsoft.CSharp => 0x98ba5a04 => 1
	i32 2570120770, ; 393: System.Text.Encodings.Web => 0x9930ee42 => 210
	i32 2576534780, ; 394: ja\Microsoft.Maui.Controls.resources.dll => 0x9992ccfc => 314
	i32 2581783588, ; 395: Xamarin.AndroidX.Lifecycle.Runtime.Ktx => 0x99e2e424 => 254
	i32 2581819634, ; 396: Xamarin.AndroidX.VectorDrawable.dll => 0x99e370f2 => 276
	i32 2585220780, ; 397: System.Text.Encoding.Extensions.dll => 0x9a1756ac => 133
	i32 2585805581, ; 398: System.Net.Ping => 0x9a20430d => 68
	i32 2589602615, ; 399: System.Threading.ThreadPool => 0x9a5a3337 => 143
	i32 2593496499, ; 400: pl\Microsoft.Maui.Controls.resources => 0x9a959db3 => 319
	i32 2605712449, ; 401: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x9b500441 => 298
	i32 2615233544, ; 402: Xamarin.AndroidX.Fragment.Ktx => 0x9be14c08 => 245
	i32 2616218305, ; 403: Microsoft.Extensions.Logging.Debug.dll => 0x9bf052c1 => 188
	i32 2617129537, ; 404: System.Private.Xml.dll => 0x9bfe3a41 => 87
	i32 2618712057, ; 405: System.Reflection.TypeExtensions.dll => 0x9c165ff9 => 95
	i32 2620871830, ; 406: Xamarin.AndroidX.CursorAdapter.dll => 0x9c375496 => 235
	i32 2624644809, ; 407: Xamarin.AndroidX.DynamicAnimation => 0x9c70e6c9 => 240
	i32 2625339995, ; 408: SkiaSharp.Views.Maui.Core.dll => 0x9c7b825b => 207
	i32 2626831493, ; 409: ja\Microsoft.Maui.Controls.resources => 0x9c924485 => 314
	i32 2627185994, ; 410: System.Diagnostics.TextWriterTraceListener.dll => 0x9c97ad4a => 31
	i32 2629843544, ; 411: System.IO.Compression.ZipFile.dll => 0x9cc03a58 => 45
	i32 2633051222, ; 412: Xamarin.AndroidX.Lifecycle.LiveData => 0x9cf12c56 => 249
	i32 2663391936, ; 413: Xamarin.Android.Glide.DiskLruCache => 0x9ec022c0 => 214
	i32 2663698177, ; 414: System.Runtime.Loader => 0x9ec4cf01 => 108
	i32 2664396074, ; 415: System.Xml.XDocument.dll => 0x9ecf752a => 155
	i32 2665622720, ; 416: System.Drawing.Primitives => 0x9ee22cc0 => 35
	i32 2676780864, ; 417: System.Data.Common.dll => 0x9f8c6f40 => 22
	i32 2686887180, ; 418: System.Runtime.Serialization.Xml.dll => 0xa026a50c => 113
	i32 2687940959, ; 419: ApiLibrary.dll => 0xa036b95f => 333
	i32 2693849962, ; 420: System.IO.dll => 0xa090e36a => 57
	i32 2701096212, ; 421: Xamarin.AndroidX.Tracing.Tracing => 0xa0ff7514 => 274
	i32 2715334215, ; 422: System.Threading.Tasks.dll => 0xa1d8b647 => 141
	i32 2717744543, ; 423: System.Security.Claims => 0xa1fd7d9f => 117
	i32 2719963679, ; 424: System.Security.Cryptography.Cng.dll => 0xa21f5a1f => 119
	i32 2724373263, ; 425: System.Runtime.Numerics.dll => 0xa262a30f => 109
	i32 2732626843, ; 426: Xamarin.AndroidX.Activity => 0xa2e0939b => 216
	i32 2735172069, ; 427: System.Threading.Channels => 0xa30769e5 => 136
	i32 2737747696, ; 428: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 222
	i32 2740698338, ; 429: ca\Microsoft.Maui.Controls.resources.dll => 0xa35bbce2 => 300
	i32 2740948882, ; 430: System.IO.Pipes.AccessControl => 0xa35f8f92 => 54
	i32 2748088231, ; 431: System.Runtime.InteropServices.JavaScript => 0xa3cc7fa7 => 104
	i32 2752995522, ; 432: pt-BR\Microsoft.Maui.Controls.resources => 0xa41760c2 => 320
	i32 2758225723, ; 433: Microsoft.Maui.Controls.Xaml => 0xa4672f3b => 195
	i32 2764765095, ; 434: Microsoft.Maui.dll => 0xa4caf7a7 => 196
	i32 2765824710, ; 435: System.Text.Encoding.CodePages.dll => 0xa4db22c6 => 132
	i32 2770495804, ; 436: Xamarin.Jetbrains.Annotations.dll => 0xa522693c => 292
	i32 2778768386, ; 437: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 279
	i32 2779977773, ; 438: Xamarin.AndroidX.ResourceInspection.Annotation.dll => 0xa5b3182d => 267
	i32 2785988530, ; 439: th\Microsoft.Maui.Controls.resources => 0xa60ecfb2 => 326
	i32 2788224221, ; 440: Xamarin.AndroidX.Fragment.Ktx.dll => 0xa630ecdd => 245
	i32 2795602088, ; 441: SkiaSharp.Views.Android.dll => 0xa6a180a8 => 204
	i32 2801831435, ; 442: Microsoft.Maui.Graphics => 0xa7008e0b => 198
	i32 2803228030, ; 443: System.Xml.XPath.XDocument.dll => 0xa715dd7e => 156
	i32 2810250172, ; 444: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 232
	i32 2819470561, ; 445: System.Xml.dll => 0xa80db4e1 => 160
	i32 2821205001, ; 446: System.ServiceProcess.dll => 0xa8282c09 => 131
	i32 2821294376, ; 447: Xamarin.AndroidX.ResourceInspection.Annotation => 0xa8298928 => 267
	i32 2824502124, ; 448: System.Xml.XmlDocument => 0xa85a7b6c => 158
	i32 2838993487, ; 449: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx.dll => 0xa9379a4f => 256
	i32 2847418871, ; 450: Xamarin.GooglePlayServices.Base => 0xa9b829f7 => 288
	i32 2849599387, ; 451: System.Threading.Overlapped.dll => 0xa9d96f9b => 137
	i32 2853208004, ; 452: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 279
	i32 2855708567, ; 453: Xamarin.AndroidX.Transition => 0xaa36a797 => 275
	i32 2861098320, ; 454: Mono.Android.Export.dll => 0xaa88e550 => 166
	i32 2861189240, ; 455: Microsoft.Maui.Essentials => 0xaa8a4878 => 197
	i32 2870099610, ; 456: Xamarin.AndroidX.Activity.Ktx.dll => 0xab123e9a => 217
	i32 2875164099, ; 457: Jsr305Binding.dll => 0xab5f85c3 => 284
	i32 2875220617, ; 458: System.Globalization.Calendars.dll => 0xab606289 => 40
	i32 2884993177, ; 459: Xamarin.AndroidX.ExifInterface => 0xabf58099 => 243
	i32 2887636118, ; 460: System.Net.dll => 0xac1dd496 => 80
	i32 2899753641, ; 461: System.IO.UnmanagedMemoryStream => 0xacd6baa9 => 56
	i32 2900621748, ; 462: System.Dynamic.Runtime.dll => 0xace3f9b4 => 37
	i32 2901442782, ; 463: System.Reflection => 0xacf080de => 96
	i32 2905242038, ; 464: mscorlib.dll => 0xad2a79b6 => 163
	i32 2909740682, ; 465: System.Private.CoreLib => 0xad6f1e8a => 169
	i32 2912489636, ; 466: SkiaSharp.Views.Android => 0xad9910a4 => 204
	i32 2916838712, ; 467: Xamarin.AndroidX.ViewPager2.dll => 0xaddb6d38 => 280
	i32 2919462931, ; 468: System.Numerics.Vectors.dll => 0xae037813 => 81
	i32 2921128767, ; 469: Xamarin.AndroidX.Annotation.Experimental.dll => 0xae1ce33f => 219
	i32 2936416060, ; 470: System.Resources.Reader => 0xaf06273c => 97
	i32 2940926066, ; 471: System.Diagnostics.StackTrace.dll => 0xaf4af872 => 30
	i32 2942453041, ; 472: System.Xml.XPath.XDocument => 0xaf624531 => 156
	i32 2959614098, ; 473: System.ComponentModel.dll => 0xb0682092 => 18
	i32 2968338931, ; 474: System.Security.Principal.Windows => 0xb0ed41f3 => 126
	i32 2971004615, ; 475: Microsoft.Extensions.Options.ConfigurationExtensions.dll => 0xb115eec7 => 190
	i32 2972252294, ; 476: System.Security.Cryptography.Algorithms.dll => 0xb128f886 => 118
	i32 2978675010, ; 477: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 239
	i32 2987532451, ; 478: Xamarin.AndroidX.Security.SecurityCrypto => 0xb21220a3 => 270
	i32 2996846495, ; 479: Xamarin.AndroidX.Lifecycle.Process.dll => 0xb2a03f9f => 252
	i32 3016983068, ; 480: Xamarin.AndroidX.Startup.StartupRuntime => 0xb3d3821c => 272
	i32 3017076677, ; 481: Xamarin.GooglePlayServices.Maps => 0xb3d4efc5 => 290
	i32 3020703001, ; 482: Microsoft.Extensions.Diagnostics => 0xb40c4519 => 183
	i32 3023353419, ; 483: WindowsBase.dll => 0xb434b64b => 162
	i32 3024354802, ; 484: Xamarin.AndroidX.Legacy.Support.Core.Utils => 0xb443fdf2 => 247
	i32 3038032645, ; 485: _Microsoft.Android.Resource.Designer.dll => 0xb514b305 => 334
	i32 3053864966, ; 486: fi\Microsoft.Maui.Controls.resources.dll => 0xb6064806 => 306
	i32 3056245963, ; 487: Xamarin.AndroidX.SavedState.SavedState.Ktx => 0xb62a9ccb => 269
	i32 3057625584, ; 488: Xamarin.AndroidX.Navigation.Common => 0xb63fa9f0 => 260
	i32 3058099980, ; 489: Xamarin.GooglePlayServices.Tasks => 0xb646e70c => 291
	i32 3059408633, ; 490: Mono.Android.Runtime => 0xb65adef9 => 167
	i32 3059793426, ; 491: System.ComponentModel.Primitives => 0xb660be12 => 16
	i32 3075834255, ; 492: System.Threading.Tasks => 0xb755818f => 141
	i32 3081706019, ; 493: LiveChartsCore => 0xb7af1a23 => 173
	i32 3090735792, ; 494: System.Security.Cryptography.X509Certificates.dll => 0xb838e2b0 => 124
	i32 3099732863, ; 495: System.Security.Claims.dll => 0xb8c22b7f => 117
	i32 3103600923, ; 496: System.Formats.Asn1 => 0xb8fd311b => 38
	i32 3111772706, ; 497: System.Runtime.Serialization => 0xb979e222 => 114
	i32 3121463068, ; 498: System.IO.FileSystem.AccessControl.dll => 0xba0dbf1c => 47
	i32 3124832203, ; 499: System.Threading.Tasks.Extensions => 0xba4127cb => 139
	i32 3132293585, ; 500: System.Security.AccessControl => 0xbab301d1 => 116
	i32 3147165239, ; 501: System.Diagnostics.Tracing.dll => 0xbb95ee37 => 34
	i32 3148237826, ; 502: GoogleGson.dll => 0xbba64c02 => 171
	i32 3159123045, ; 503: System.Reflection.Primitives.dll => 0xbc4c6465 => 94
	i32 3160747431, ; 504: System.IO.MemoryMappedFiles => 0xbc652da7 => 53
	i32 3178803400, ; 505: Xamarin.AndroidX.Navigation.Fragment.dll => 0xbd78b0c8 => 261
	i32 3192346100, ; 506: System.Security.SecureString => 0xbe4755f4 => 128
	i32 3193515020, ; 507: System.Web => 0xbe592c0c => 150
	i32 3204380047, ; 508: System.Data.dll => 0xbefef58f => 24
	i32 3209718065, ; 509: System.Xml.XmlDocument.dll => 0xbf506931 => 158
	i32 3211777861, ; 510: Xamarin.AndroidX.DocumentFile => 0xbf6fd745 => 238
	i32 3220365878, ; 511: System.Threading => 0xbff2e236 => 145
	i32 3223795955, ; 512: Particle.Maui => 0xc02738f3 => 201
	i32 3226221578, ; 513: System.Runtime.Handles.dll => 0xc04c3c0a => 103
	i32 3230466174, ; 514: Xamarin.GooglePlayServices.Basement.dll => 0xc08d007e => 289
	i32 3251039220, ; 515: System.Reflection.DispatchProxy.dll => 0xc1c6ebf4 => 88
	i32 3258312781, ; 516: Xamarin.AndroidX.CardView => 0xc235e84d => 226
	i32 3265493905, ; 517: System.Linq.Queryable.dll => 0xc2a37b91 => 60
	i32 3265893370, ; 518: System.Threading.Tasks.Extensions.dll => 0xc2a993fa => 139
	i32 3277815716, ; 519: System.Resources.Writer.dll => 0xc35f7fa4 => 99
	i32 3279906254, ; 520: Microsoft.Win32.Registry.dll => 0xc37f65ce => 5
	i32 3280506390, ; 521: System.ComponentModel.Annotations.dll => 0xc3888e16 => 13
	i32 3290767353, ; 522: System.Security.Cryptography.Encoding => 0xc4251ff9 => 121
	i32 3299363146, ; 523: System.Text.Encoding => 0xc4a8494a => 134
	i32 3303498502, ; 524: System.Diagnostics.FileVersionInfo => 0xc4e76306 => 28
	i32 3305363605, ; 525: fi\Microsoft.Maui.Controls.resources => 0xc503d895 => 306
	i32 3316684772, ; 526: System.Net.Requests.dll => 0xc5b097e4 => 71
	i32 3317135071, ; 527: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 236
	i32 3317144872, ; 528: System.Data => 0xc5b79d28 => 24
	i32 3340387945, ; 529: SkiaSharp => 0xc71a4669 => 202
	i32 3340431453, ; 530: Xamarin.AndroidX.Arch.Core.Runtime => 0xc71af05d => 224
	i32 3345895724, ; 531: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller.dll => 0xc76e512c => 265
	i32 3346324047, ; 532: Xamarin.AndroidX.Navigation.Runtime => 0xc774da4f => 262
	i32 3357674450, ; 533: ru\Microsoft.Maui.Controls.resources => 0xc8220bd2 => 323
	i32 3358260929, ; 534: System.Text.Json => 0xc82afec1 => 211
	i32 3362336904, ; 535: Xamarin.AndroidX.Activity.Ktx => 0xc8693088 => 217
	i32 3362522851, ; 536: Xamarin.AndroidX.Core => 0xc86c06e3 => 233
	i32 3366347497, ; 537: Java.Interop => 0xc8a662e9 => 165
	i32 3374999561, ; 538: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 266
	i32 3381016424, ; 539: da\Microsoft.Maui.Controls.resources => 0xc9863768 => 302
	i32 3384551493, ; 540: LiveChartsCore.dll => 0xc9bc2845 => 173
	i32 3395150330, ; 541: System.Runtime.CompilerServices.Unsafe.dll => 0xca5de1fa => 100
	i32 3403906625, ; 542: System.Security.Cryptography.OpenSsl.dll => 0xcae37e41 => 122
	i32 3405233483, ; 543: Xamarin.AndroidX.CustomView.PoolingContainer => 0xcaf7bd4b => 237
	i32 3421170118, ; 544: Microsoft.Extensions.Configuration.Binder => 0xcbeae9c6 => 180
	i32 3428513518, ; 545: Microsoft.Extensions.DependencyInjection.dll => 0xcc5af6ee => 181
	i32 3429136800, ; 546: System.Xml => 0xcc6479a0 => 160
	i32 3430777524, ; 547: netstandard => 0xcc7d82b4 => 164
	i32 3441283291, ; 548: Xamarin.AndroidX.DynamicAnimation.dll => 0xcd1dd0db => 240
	i32 3445260447, ; 549: System.Formats.Tar => 0xcd5a809f => 39
	i32 3452344032, ; 550: Microsoft.Maui.Controls.Compatibility.dll => 0xcdc696e0 => 192
	i32 3458724246, ; 551: pt\Microsoft.Maui.Controls.resources.dll => 0xce27f196 => 321
	i32 3466574376, ; 552: SkiaSharp.Views.Maui.Controls.Compatibility.dll => 0xce9fba28 => 206
	i32 3471940407, ; 553: System.ComponentModel.TypeConverter.dll => 0xcef19b37 => 17
	i32 3473156932, ; 554: SkiaSharp.Views.Maui.Controls.dll => 0xcf042b44 => 205
	i32 3476120550, ; 555: Mono.Android => 0xcf3163e6 => 168
	i32 3484440000, ; 556: ro\Microsoft.Maui.Controls.resources => 0xcfb055c0 => 322
	i32 3485117614, ; 557: System.Text.Json.dll => 0xcfbaacae => 211
	i32 3486566296, ; 558: System.Transactions => 0xcfd0c798 => 147
	i32 3493954962, ; 559: Xamarin.AndroidX.Concurrent.Futures.dll => 0xd0418592 => 229
	i32 3500773090, ; 560: Microsoft.Maui.Controls.Maps => 0xd0a98ee2 => 194
	i32 3509114376, ; 561: System.Xml.Linq => 0xd128d608 => 152
	i32 3515174580, ; 562: System.Security.dll => 0xd1854eb4 => 129
	i32 3530912306, ; 563: System.Configuration => 0xd2757232 => 19
	i32 3539954161, ; 564: System.Net.HttpListener => 0xd2ff69f1 => 64
	i32 3556829416, ; 565: LiveChartsCore.Behaviours.dll => 0xd400e8e8 => 174
	i32 3560100363, ; 566: System.Threading.Timer => 0xd432d20b => 144
	i32 3570554715, ; 567: System.IO.FileSystem.AccessControl => 0xd4d2575b => 47
	i32 3580758918, ; 568: zh-HK\Microsoft.Maui.Controls.resources => 0xd56e0b86 => 330
	i32 3592228221, ; 569: zh-Hant\Microsoft.Maui.Controls.resources.dll => 0xd61d0d7d => 332
	i32 3597029428, ; 570: Xamarin.Android.Glide.GifDecoder.dll => 0xd6665034 => 215
	i32 3598340787, ; 571: System.Net.WebSockets.Client => 0xd67a52b3 => 78
	i32 3608519521, ; 572: System.Linq.dll => 0xd715a361 => 61
	i32 3624195450, ; 573: System.Runtime.InteropServices.RuntimeInformation => 0xd804d57a => 105
	i32 3627220390, ; 574: Xamarin.AndroidX.Print.dll => 0xd832fda6 => 264
	i32 3633644679, ; 575: Xamarin.AndroidX.Annotation.Experimental => 0xd8950487 => 219
	i32 3638274909, ; 576: System.IO.FileSystem.Primitives.dll => 0xd8dbab5d => 49
	i32 3641597786, ; 577: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 250
	i32 3643446276, ; 578: tr\Microsoft.Maui.Controls.resources => 0xd92a9404 => 327
	i32 3643854240, ; 579: Xamarin.AndroidX.Navigation.Fragment => 0xd930cda0 => 261
	i32 3645089577, ; 580: System.ComponentModel.DataAnnotations => 0xd943a729 => 14
	i32 3657292374, ; 581: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd9fdda56 => 179
	i32 3660523487, ; 582: System.Net.NetworkInformation => 0xda2f27df => 67
	i32 3672681054, ; 583: Mono.Android.dll => 0xdae8aa5e => 168
	i32 3682565725, ; 584: Xamarin.AndroidX.Browser => 0xdb7f7e5d => 225
	i32 3684561358, ; 585: Xamarin.AndroidX.Concurrent.Futures => 0xdb9df1ce => 229
	i32 3700866549, ; 586: System.Net.WebProxy.dll => 0xdc96bdf5 => 77
	i32 3706696989, ; 587: Xamarin.AndroidX.Core.Core.Ktx.dll => 0xdcefb51d => 234
	i32 3716563718, ; 588: System.Runtime.Intrinsics => 0xdd864306 => 107
	i32 3718780102, ; 589: Xamarin.AndroidX.Annotation => 0xdda814c6 => 218
	i32 3724971120, ; 590: Xamarin.AndroidX.Navigation.Common.dll => 0xde068c70 => 260
	i32 3732100267, ; 591: System.Net.NameResolution => 0xde7354ab => 66
	i32 3737834244, ; 592: System.Net.Http.Json.dll => 0xdecad304 => 209
	i32 3748608112, ; 593: System.Diagnostics.DiagnosticSource => 0xdf6f3870 => 27
	i32 3751444290, ; 594: System.Xml.XPath => 0xdf9a7f42 => 157
	i32 3751619990, ; 595: da\Microsoft.Maui.Controls.resources.dll => 0xdf9d2d96 => 302
	i32 3786282454, ; 596: Xamarin.AndroidX.Collection => 0xe1ae15d6 => 227
	i32 3792276235, ; 597: System.Collections.NonGeneric => 0xe2098b0b => 10
	i32 3792835768, ; 598: HarfBuzzSharp => 0xe21214b8 => 172
	i32 3800979733, ; 599: Microsoft.Maui.Controls.Compatibility => 0xe28e5915 => 192
	i32 3802395368, ; 600: System.Collections.Specialized.dll => 0xe2a3f2e8 => 11
	i32 3819260425, ; 601: System.Net.WebProxy => 0xe3a54a09 => 77
	i32 3823082795, ; 602: System.Security.Cryptography.dll => 0xe3df9d2b => 125
	i32 3829621856, ; 603: System.Numerics.dll => 0xe4436460 => 82
	i32 3841636137, ; 604: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xe4fab729 => 182
	i32 3844307129, ; 605: System.Net.Mail.dll => 0xe52378b9 => 65
	i32 3849253459, ; 606: System.Runtime.InteropServices.dll => 0xe56ef253 => 106
	i32 3870376305, ; 607: System.Net.HttpListener.dll => 0xe6b14171 => 64
	i32 3873536506, ; 608: System.Security.Principal => 0xe6e179fa => 127
	i32 3875112723, ; 609: System.Security.Cryptography.Encoding.dll => 0xe6f98713 => 121
	i32 3885497537, ; 610: System.Net.WebHeaderCollection.dll => 0xe797fcc1 => 76
	i32 3885922214, ; 611: Xamarin.AndroidX.Transition.dll => 0xe79e77a6 => 275
	i32 3888767677, ; 612: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller => 0xe7c9e2bd => 265
	i32 3896106733, ; 613: System.Collections.Concurrent.dll => 0xe839deed => 8
	i32 3896760992, ; 614: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 233
	i32 3901907137, ; 615: Microsoft.VisualBasic.Core.dll => 0xe89260c1 => 2
	i32 3920221145, ; 616: nl\Microsoft.Maui.Controls.resources.dll => 0xe9a9d3d9 => 318
	i32 3920810846, ; 617: System.IO.Compression.FileSystem.dll => 0xe9b2d35e => 44
	i32 3921031405, ; 618: Xamarin.AndroidX.VersionedParcelable.dll => 0xe9b630ed => 278
	i32 3928044579, ; 619: System.Xml.ReaderWriter => 0xea213423 => 153
	i32 3930554604, ; 620: System.Security.Principal.dll => 0xea4780ec => 127
	i32 3931092270, ; 621: Xamarin.AndroidX.Navigation.UI => 0xea4fb52e => 263
	i32 3945713374, ; 622: System.Data.DataSetExtensions.dll => 0xeb2ecede => 23
	i32 3946938059, ; 623: Particle.Maui.dll => 0xeb417ecb => 201
	i32 3953953790, ; 624: System.Text.Encoding.CodePages => 0xebac8bfe => 132
	i32 3955647286, ; 625: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 221
	i32 3959773229, ; 626: Xamarin.AndroidX.Lifecycle.Process => 0xec05582d => 252
	i32 3970018735, ; 627: Xamarin.GooglePlayServices.Tasks.dll => 0xeca1adaf => 291
	i32 4003436829, ; 628: System.Diagnostics.Process.dll => 0xee9f991d => 29
	i32 4003906742, ; 629: HarfBuzzSharp.dll => 0xeea6c4b6 => 172
	i32 4015948917, ; 630: Xamarin.AndroidX.Annotation.Jvm.dll => 0xef5e8475 => 220
	i32 4023392905, ; 631: System.IO.Pipelines => 0xefd01a89 => 208
	i32 4025784931, ; 632: System.Memory => 0xeff49a63 => 62
	i32 4046471985, ; 633: Microsoft.Maui.Controls.Xaml.dll => 0xf1304331 => 195
	i32 4054681211, ; 634: System.Reflection.Emit.ILGeneration => 0xf1ad867b => 89
	i32 4066802364, ; 635: SkiaSharp.HarfBuzz => 0xf2667abc => 203
	i32 4068434129, ; 636: System.Private.Xml.Linq.dll => 0xf27f60d1 => 86
	i32 4073602200, ; 637: System.Threading.dll => 0xf2ce3c98 => 145
	i32 4091086043, ; 638: el\Microsoft.Maui.Controls.resources.dll => 0xf3d904db => 304
	i32 4094352644, ; 639: Microsoft.Maui.Essentials.dll => 0xf40add04 => 197
	i32 4099507663, ; 640: System.Drawing.dll => 0xf45985cf => 36
	i32 4100113165, ; 641: System.Private.Uri => 0xf462c30d => 85
	i32 4101593132, ; 642: Xamarin.AndroidX.Emoji2 => 0xf479582c => 241
	i32 4103439459, ; 643: uk\Microsoft.Maui.Controls.resources.dll => 0xf4958463 => 328
	i32 4126470640, ; 644: Microsoft.Extensions.DependencyInjection => 0xf5f4f1f0 => 181
	i32 4127667938, ; 645: System.IO.FileSystem.Watcher => 0xf60736e2 => 50
	i32 4130442656, ; 646: System.AppContext => 0xf6318da0 => 6
	i32 4147896353, ; 647: System.Reflection.Emit.ILGeneration.dll => 0xf73be021 => 89
	i32 4150914736, ; 648: uk\Microsoft.Maui.Controls.resources => 0xf769eeb0 => 328
	i32 4151237749, ; 649: System.Core => 0xf76edc75 => 21
	i32 4159265925, ; 650: System.Xml.XmlSerializer => 0xf7e95c85 => 159
	i32 4161255271, ; 651: System.Reflection.TypeExtensions => 0xf807b767 => 95
	i32 4164802419, ; 652: System.IO.FileSystem.Watcher.dll => 0xf83dd773 => 50
	i32 4181436372, ; 653: System.Runtime.Serialization.Primitives => 0xf93ba7d4 => 112
	i32 4182413190, ; 654: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0xf94a8f86 => 257
	i32 4185676441, ; 655: System.Security => 0xf97c5a99 => 129
	i32 4189085287, ; 656: Microcharts.Maui.dll => 0xf9b05e67 => 177
	i32 4190991637, ; 657: Microsoft.Maui.Maps.dll => 0xf9cd7515 => 199
	i32 4196529839, ; 658: System.Net.WebClient.dll => 0xfa21f6af => 75
	i32 4213026141, ; 659: System.Diagnostics.DiagnosticSource.dll => 0xfb1dad5d => 27
	i32 4249188766, ; 660: nb\Microsoft.Maui.Controls.resources.dll => 0xfd45799e => 317
	i32 4256097574, ; 661: Xamarin.AndroidX.Core.Core.Ktx => 0xfdaee526 => 234
	i32 4258378803, ; 662: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx => 0xfdd1b433 => 256
	i32 4260525087, ; 663: System.Buffers => 0xfdf2741f => 7
	i32 4271975918, ; 664: Microsoft.Maui.Controls.dll => 0xfea12dee => 193
	i32 4274623895, ; 665: CommunityToolkit.Mvvm.dll => 0xfec99597 => 170
	i32 4274976490, ; 666: System.Runtime.Numerics => 0xfecef6ea => 109
	i32 4278134329, ; 667: Xamarin.GooglePlayServices.Maps.dll => 0xfeff2639 => 290
	i32 4292120959, ; 668: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xffd4917f => 257
	i32 4294763496 ; 669: Xamarin.AndroidX.ExifInterface.dll => 0xfffce3e8 => 243
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [670 x i32] [
	i32 67, ; 0
	i32 66, ; 1
	i32 175, ; 2
	i32 107, ; 3
	i32 253, ; 4
	i32 287, ; 5
	i32 48, ; 6
	i32 299, ; 7
	i32 200, ; 8
	i32 79, ; 9
	i32 308, ; 10
	i32 142, ; 11
	i32 30, ; 12
	i32 332, ; 13
	i32 123, ; 14
	i32 198, ; 15
	i32 101, ; 16
	i32 316, ; 17
	i32 184, ; 18
	i32 271, ; 19
	i32 106, ; 20
	i32 271, ; 21
	i32 136, ; 22
	i32 295, ; 23
	i32 0, ; 24
	i32 331, ; 25
	i32 324, ; 26
	i32 76, ; 27
	i32 123, ; 28
	i32 13, ; 29
	i32 227, ; 30
	i32 131, ; 31
	i32 273, ; 32
	i32 148, ; 33
	i32 18, ; 34
	i32 333, ; 35
	i32 225, ; 36
	i32 26, ; 37
	i32 183, ; 38
	i32 247, ; 39
	i32 1, ; 40
	i32 59, ; 41
	i32 42, ; 42
	i32 90, ; 43
	i32 230, ; 44
	i32 144, ; 45
	i32 249, ; 46
	i32 246, ; 47
	i32 54, ; 48
	i32 185, ; 49
	i32 68, ; 50
	i32 329, ; 51
	i32 216, ; 52
	i32 82, ; 53
	i32 307, ; 54
	i32 248, ; 55
	i32 130, ; 56
	i32 55, ; 57
	i32 146, ; 58
	i32 73, ; 59
	i32 142, ; 60
	i32 62, ; 61
	i32 143, ; 62
	i32 334, ; 63
	i32 162, ; 64
	i32 327, ; 65
	i32 231, ; 66
	i32 12, ; 67
	i32 244, ; 68
	i32 124, ; 69
	i32 149, ; 70
	i32 112, ; 71
	i32 163, ; 72
	i32 161, ; 73
	i32 246, ; 74
	i32 259, ; 75
	i32 305, ; 76
	i32 83, ; 77
	i32 191, ; 78
	i32 202, ; 79
	i32 147, ; 80
	i32 295, ; 81
	i32 60, ; 82
	i32 326, ; 83
	i32 186, ; 84
	i32 51, ; 85
	i32 102, ; 86
	i32 113, ; 87
	i32 40, ; 88
	i32 284, ; 89
	i32 282, ; 90
	i32 119, ; 91
	i32 52, ; 92
	i32 44, ; 93
	i32 118, ; 94
	i32 236, ; 95
	i32 318, ; 96
	i32 242, ; 97
	i32 80, ; 98
	i32 210, ; 99
	i32 278, ; 100
	i32 223, ; 101
	i32 8, ; 102
	i32 72, ; 103
	i32 152, ; 104
	i32 297, ; 105
	i32 151, ; 106
	i32 91, ; 107
	i32 292, ; 108
	i32 45, ; 109
	i32 296, ; 110
	i32 108, ; 111
	i32 190, ; 112
	i32 128, ; 113
	i32 174, ; 114
	i32 25, ; 115
	i32 213, ; 116
	i32 71, ; 117
	i32 55, ; 118
	i32 46, ; 119
	i32 324, ; 120
	i32 203, ; 121
	i32 189, ; 122
	i32 237, ; 123
	i32 22, ; 124
	i32 251, ; 125
	i32 85, ; 126
	i32 43, ; 127
	i32 157, ; 128
	i32 70, ; 129
	i32 264, ; 130
	i32 309, ; 131
	i32 3, ; 132
	i32 42, ; 133
	i32 209, ; 134
	i32 323, ; 135
	i32 16, ; 136
	i32 199, ; 137
	i32 53, ; 138
	i32 320, ; 139
	i32 287, ; 140
	i32 104, ; 141
	i32 200, ; 142
	i32 296, ; 143
	i32 313, ; 144
	i32 285, ; 145
	i32 248, ; 146
	i32 34, ; 147
	i32 155, ; 148
	i32 84, ; 149
	i32 32, ; 150
	i32 322, ; 151
	i32 12, ; 152
	i32 51, ; 153
	i32 56, ; 154
	i32 268, ; 155
	i32 36, ; 156
	i32 182, ; 157
	i32 286, ; 158
	i32 176, ; 159
	i32 221, ; 160
	i32 35, ; 161
	i32 303, ; 162
	i32 58, ; 163
	i32 184, ; 164
	i32 255, ; 165
	i32 171, ; 166
	i32 17, ; 167
	i32 293, ; 168
	i32 161, ; 169
	i32 325, ; 170
	i32 319, ; 171
	i32 315, ; 172
	i32 254, ; 173
	i32 188, ; 174
	i32 281, ; 175
	i32 321, ; 176
	i32 150, ; 177
	i32 277, ; 178
	i32 262, ; 179
	i32 223, ; 180
	i32 29, ; 181
	i32 170, ; 182
	i32 52, ; 183
	i32 282, ; 184
	i32 5, ; 185
	i32 301, ; 186
	i32 272, ; 187
	i32 276, ; 188
	i32 228, ; 189
	i32 297, ; 190
	i32 220, ; 191
	i32 175, ; 192
	i32 239, ; 193
	i32 310, ; 194
	i32 84, ; 195
	i32 281, ; 196
	i32 61, ; 197
	i32 111, ; 198
	i32 330, ; 199
	i32 57, ; 200
	i32 331, ; 201
	i32 268, ; 202
	i32 98, ; 203
	i32 19, ; 204
	i32 232, ; 205
	i32 110, ; 206
	i32 100, ; 207
	i32 101, ; 208
	i32 299, ; 209
	i32 103, ; 210
	i32 285, ; 211
	i32 70, ; 212
	i32 38, ; 213
	i32 32, ; 214
	i32 102, ; 215
	i32 72, ; 216
	i32 305, ; 217
	i32 9, ; 218
	i32 122, ; 219
	i32 46, ; 220
	i32 222, ; 221
	i32 191, ; 222
	i32 9, ; 223
	i32 43, ; 224
	i32 4, ; 225
	i32 269, ; 226
	i32 185, ; 227
	i32 329, ; 228
	i32 31, ; 229
	i32 135, ; 230
	i32 91, ; 231
	i32 92, ; 232
	i32 49, ; 233
	i32 138, ; 234
	i32 111, ; 235
	i32 137, ; 236
	i32 238, ; 237
	i32 114, ; 238
	i32 286, ; 239
	i32 154, ; 240
	i32 75, ; 241
	i32 78, ; 242
	i32 258, ; 243
	i32 37, ; 244
	i32 205, ; 245
	i32 280, ; 246
	i32 242, ; 247
	i32 235, ; 248
	i32 63, ; 249
	i32 135, ; 250
	i32 15, ; 251
	i32 115, ; 252
	i32 274, ; 253
	i32 283, ; 254
	i32 230, ; 255
	i32 48, ; 256
	i32 69, ; 257
	i32 79, ; 258
	i32 125, ; 259
	i32 93, ; 260
	i32 120, ; 261
	i32 294, ; 262
	i32 26, ; 263
	i32 251, ; 264
	i32 96, ; 265
	i32 28, ; 266
	i32 226, ; 267
	i32 300, ; 268
	i32 146, ; 269
	i32 208, ; 270
	i32 166, ; 271
	i32 4, ; 272
	i32 97, ; 273
	i32 33, ; 274
	i32 92, ; 275
	i32 273, ; 276
	i32 186, ; 277
	i32 21, ; 278
	i32 41, ; 279
	i32 167, ; 280
	i32 316, ; 281
	i32 244, ; 282
	i32 308, ; 283
	i32 258, ; 284
	i32 293, ; 285
	i32 283, ; 286
	i32 263, ; 287
	i32 2, ; 288
	i32 133, ; 289
	i32 110, ; 290
	i32 187, ; 291
	i32 213, ; 292
	i32 325, ; 293
	i32 58, ; 294
	i32 94, ; 295
	i32 307, ; 296
	i32 39, ; 297
	i32 224, ; 298
	i32 25, ; 299
	i32 93, ; 300
	i32 301, ; 301
	i32 88, ; 302
	i32 98, ; 303
	i32 289, ; 304
	i32 10, ; 305
	i32 86, ; 306
	i32 312, ; 307
	i32 99, ; 308
	i32 270, ; 309
	i32 178, ; 310
	i32 294, ; 311
	i32 215, ; 312
	i32 304, ; 313
	i32 7, ; 314
	i32 255, ; 315
	i32 212, ; 316
	i32 87, ; 317
	i32 180, ; 318
	i32 250, ; 319
	i32 151, ; 320
	i32 303, ; 321
	i32 33, ; 322
	i32 115, ; 323
	i32 81, ; 324
	i32 20, ; 325
	i32 288, ; 326
	i32 11, ; 327
	i32 159, ; 328
	i32 3, ; 329
	i32 196, ; 330
	i32 311, ; 331
	i32 189, ; 332
	i32 177, ; 333
	i32 187, ; 334
	i32 83, ; 335
	i32 298, ; 336
	i32 63, ; 337
	i32 313, ; 338
	i32 277, ; 339
	i32 140, ; 340
	i32 259, ; 341
	i32 154, ; 342
	i32 41, ; 343
	i32 116, ; 344
	i32 179, ; 345
	i32 214, ; 346
	i32 266, ; 347
	i32 130, ; 348
	i32 74, ; 349
	i32 65, ; 350
	i32 194, ; 351
	i32 317, ; 352
	i32 169, ; 353
	i32 218, ; 354
	i32 140, ; 355
	i32 105, ; 356
	i32 148, ; 357
	i32 69, ; 358
	i32 207, ; 359
	i32 311, ; 360
	i32 153, ; 361
	i32 178, ; 362
	i32 120, ; 363
	i32 126, ; 364
	i32 312, ; 365
	i32 149, ; 366
	i32 241, ; 367
	i32 0, ; 368
	i32 138, ; 369
	i32 228, ; 370
	i32 309, ; 371
	i32 20, ; 372
	i32 14, ; 373
	i32 134, ; 374
	i32 74, ; 375
	i32 59, ; 376
	i32 231, ; 377
	i32 164, ; 378
	i32 165, ; 379
	i32 193, ; 380
	i32 15, ; 381
	i32 73, ; 382
	i32 6, ; 383
	i32 23, ; 384
	i32 315, ; 385
	i32 253, ; 386
	i32 206, ; 387
	i32 212, ; 388
	i32 90, ; 389
	i32 310, ; 390
	i32 176, ; 391
	i32 1, ; 392
	i32 210, ; 393
	i32 314, ; 394
	i32 254, ; 395
	i32 276, ; 396
	i32 133, ; 397
	i32 68, ; 398
	i32 143, ; 399
	i32 319, ; 400
	i32 298, ; 401
	i32 245, ; 402
	i32 188, ; 403
	i32 87, ; 404
	i32 95, ; 405
	i32 235, ; 406
	i32 240, ; 407
	i32 207, ; 408
	i32 314, ; 409
	i32 31, ; 410
	i32 45, ; 411
	i32 249, ; 412
	i32 214, ; 413
	i32 108, ; 414
	i32 155, ; 415
	i32 35, ; 416
	i32 22, ; 417
	i32 113, ; 418
	i32 333, ; 419
	i32 57, ; 420
	i32 274, ; 421
	i32 141, ; 422
	i32 117, ; 423
	i32 119, ; 424
	i32 109, ; 425
	i32 216, ; 426
	i32 136, ; 427
	i32 222, ; 428
	i32 300, ; 429
	i32 54, ; 430
	i32 104, ; 431
	i32 320, ; 432
	i32 195, ; 433
	i32 196, ; 434
	i32 132, ; 435
	i32 292, ; 436
	i32 279, ; 437
	i32 267, ; 438
	i32 326, ; 439
	i32 245, ; 440
	i32 204, ; 441
	i32 198, ; 442
	i32 156, ; 443
	i32 232, ; 444
	i32 160, ; 445
	i32 131, ; 446
	i32 267, ; 447
	i32 158, ; 448
	i32 256, ; 449
	i32 288, ; 450
	i32 137, ; 451
	i32 279, ; 452
	i32 275, ; 453
	i32 166, ; 454
	i32 197, ; 455
	i32 217, ; 456
	i32 284, ; 457
	i32 40, ; 458
	i32 243, ; 459
	i32 80, ; 460
	i32 56, ; 461
	i32 37, ; 462
	i32 96, ; 463
	i32 163, ; 464
	i32 169, ; 465
	i32 204, ; 466
	i32 280, ; 467
	i32 81, ; 468
	i32 219, ; 469
	i32 97, ; 470
	i32 30, ; 471
	i32 156, ; 472
	i32 18, ; 473
	i32 126, ; 474
	i32 190, ; 475
	i32 118, ; 476
	i32 239, ; 477
	i32 270, ; 478
	i32 252, ; 479
	i32 272, ; 480
	i32 290, ; 481
	i32 183, ; 482
	i32 162, ; 483
	i32 247, ; 484
	i32 334, ; 485
	i32 306, ; 486
	i32 269, ; 487
	i32 260, ; 488
	i32 291, ; 489
	i32 167, ; 490
	i32 16, ; 491
	i32 141, ; 492
	i32 173, ; 493
	i32 124, ; 494
	i32 117, ; 495
	i32 38, ; 496
	i32 114, ; 497
	i32 47, ; 498
	i32 139, ; 499
	i32 116, ; 500
	i32 34, ; 501
	i32 171, ; 502
	i32 94, ; 503
	i32 53, ; 504
	i32 261, ; 505
	i32 128, ; 506
	i32 150, ; 507
	i32 24, ; 508
	i32 158, ; 509
	i32 238, ; 510
	i32 145, ; 511
	i32 201, ; 512
	i32 103, ; 513
	i32 289, ; 514
	i32 88, ; 515
	i32 226, ; 516
	i32 60, ; 517
	i32 139, ; 518
	i32 99, ; 519
	i32 5, ; 520
	i32 13, ; 521
	i32 121, ; 522
	i32 134, ; 523
	i32 28, ; 524
	i32 306, ; 525
	i32 71, ; 526
	i32 236, ; 527
	i32 24, ; 528
	i32 202, ; 529
	i32 224, ; 530
	i32 265, ; 531
	i32 262, ; 532
	i32 323, ; 533
	i32 211, ; 534
	i32 217, ; 535
	i32 233, ; 536
	i32 165, ; 537
	i32 266, ; 538
	i32 302, ; 539
	i32 173, ; 540
	i32 100, ; 541
	i32 122, ; 542
	i32 237, ; 543
	i32 180, ; 544
	i32 181, ; 545
	i32 160, ; 546
	i32 164, ; 547
	i32 240, ; 548
	i32 39, ; 549
	i32 192, ; 550
	i32 321, ; 551
	i32 206, ; 552
	i32 17, ; 553
	i32 205, ; 554
	i32 168, ; 555
	i32 322, ; 556
	i32 211, ; 557
	i32 147, ; 558
	i32 229, ; 559
	i32 194, ; 560
	i32 152, ; 561
	i32 129, ; 562
	i32 19, ; 563
	i32 64, ; 564
	i32 174, ; 565
	i32 144, ; 566
	i32 47, ; 567
	i32 330, ; 568
	i32 332, ; 569
	i32 215, ; 570
	i32 78, ; 571
	i32 61, ; 572
	i32 105, ; 573
	i32 264, ; 574
	i32 219, ; 575
	i32 49, ; 576
	i32 250, ; 577
	i32 327, ; 578
	i32 261, ; 579
	i32 14, ; 580
	i32 179, ; 581
	i32 67, ; 582
	i32 168, ; 583
	i32 225, ; 584
	i32 229, ; 585
	i32 77, ; 586
	i32 234, ; 587
	i32 107, ; 588
	i32 218, ; 589
	i32 260, ; 590
	i32 66, ; 591
	i32 209, ; 592
	i32 27, ; 593
	i32 157, ; 594
	i32 302, ; 595
	i32 227, ; 596
	i32 10, ; 597
	i32 172, ; 598
	i32 192, ; 599
	i32 11, ; 600
	i32 77, ; 601
	i32 125, ; 602
	i32 82, ; 603
	i32 182, ; 604
	i32 65, ; 605
	i32 106, ; 606
	i32 64, ; 607
	i32 127, ; 608
	i32 121, ; 609
	i32 76, ; 610
	i32 275, ; 611
	i32 265, ; 612
	i32 8, ; 613
	i32 233, ; 614
	i32 2, ; 615
	i32 318, ; 616
	i32 44, ; 617
	i32 278, ; 618
	i32 153, ; 619
	i32 127, ; 620
	i32 263, ; 621
	i32 23, ; 622
	i32 201, ; 623
	i32 132, ; 624
	i32 221, ; 625
	i32 252, ; 626
	i32 291, ; 627
	i32 29, ; 628
	i32 172, ; 629
	i32 220, ; 630
	i32 208, ; 631
	i32 62, ; 632
	i32 195, ; 633
	i32 89, ; 634
	i32 203, ; 635
	i32 86, ; 636
	i32 145, ; 637
	i32 304, ; 638
	i32 197, ; 639
	i32 36, ; 640
	i32 85, ; 641
	i32 241, ; 642
	i32 328, ; 643
	i32 181, ; 644
	i32 50, ; 645
	i32 6, ; 646
	i32 89, ; 647
	i32 328, ; 648
	i32 21, ; 649
	i32 159, ; 650
	i32 95, ; 651
	i32 50, ; 652
	i32 112, ; 653
	i32 257, ; 654
	i32 129, ; 655
	i32 177, ; 656
	i32 199, ; 657
	i32 75, ; 658
	i32 27, ; 659
	i32 317, ; 660
	i32 234, ; 661
	i32 256, ; 662
	i32 7, ; 663
	i32 193, ; 664
	i32 170, ; 665
	i32 109, ; 666
	i32 290, ; 667
	i32 257, ; 668
	i32 243 ; 669
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
