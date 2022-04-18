// import 'package:coffeapp/core/widget/my_appbar_widget.dart';
// import 'package:coffeapp/provider/login_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class AdminPage extends StatefulWidget {
//   const AdminPage({Key? key}) : super(key: key);

//   @override
//   State<AdminPage> createState() => _AdminPageState();
// }

// class _AdminPageState extends State<AdminPage>
//     with SingleTickerProviderStateMixin {
//   TabController? tabController;
//   @override
//   Widget build(BuildContext context) {
//     @override
//     void initState() {
//       super.initState();
//       tabController = TabController(length: 2, vsync: this);
//     }

//     return Scaffold(
//       appBar: MyAppBar(
//         title: "Admin",
//         context: context,
//         function: () {
//           context.read<LoginProvider>().signOut(context);
//         },
//       ),
//       bottomNavigationBar: TabBar(
//         controller: tabController,
//         tabs: const [
//           Tab(icon: Icon(Icons.home), text: "Home"),
//           Tab(icon: Icon(Icons.shopping_bag), text: "Card"),
//         ],
//       ),
//       body: TabBarView(
//         controller: tabController,
//         children: [
//           Container(),
//           Container(),
//         ],
//       ),
//     );
//   }
// }
import 'package:coffeapp/Pages/Admin/admin_home_page.dart';
import 'package:coffeapp/Pages/Admin/admin_order_page.dart';
import 'package:coffeapp/core/constants/color_const.dart';
import 'package:coffeapp/core/widget/my_appbar_widget.dart';
import 'package:coffeapp/provider/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: MyAppBar(
        title: "Admin",
        context: context,
        function: () {
          context.read<LoginProvider>().signOut(context);
        },
      ),
      bottomNavigationBar: TabBar(
        controller: tabController,
        indicatorColor: ColorConst.kPrimaryColor,
        labelColor: ColorConst.kPrimaryColor,
        unselectedLabelColor: ColorConst.kTabUnselectedColor,
        tabs: const [
          Tab(icon: Icon(Icons.home), text: "Home"),
          Tab(icon: Icon(Icons.shopping_bag), text: "Orders"),
        ],
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          AdminHomepage(),
          AdminOrderPage(),
        ],
      ),
    );
  }
  
}
