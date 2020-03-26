import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

/// List of providers that provider transforms into a widget tree
/// with the main app as the child of that tree, so that the entire
/// app can use these streams anywhere there is a [BuildContext]
///
/// // https://stackoverflow.com/questions/59590673/flutter-app-crash-after-converting-provider-3-to-4
List<SingleChildWidget> providers = [
  ...independentServices,
  ...dependentServices,
  ...uiConsumableProviders
];

List<SingleChildWidget> independentServices = [
  // Provider(create: (_) => ConfigViewModel()),
  // Provider(create: (_) => UserModel()),
];

List<SingleChildWidget> dependentServices = [];

List<SingleChildWidget> uiConsumableProviders = [
  // StreamProvider<ConnectivityStatus>(
  //   create: (context) => locator<ConnectivityService>().connectivity$,
  // ),
  // 解释: StreamProvider<数据模型>  Provider.of<数据服务>   设置为false,不监听变化数据变化 listen: false
  //   StreamProvider<User>(
  //   builder: (context) => Provider.of<UserService>(context, listen: false).weather,
  // ),
];
