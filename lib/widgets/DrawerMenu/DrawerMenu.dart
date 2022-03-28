import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 20);
  @override
  Widget build(BuildContext context) {
    final name = 'Mehdi Gh';
    final email = 'info@bbloan.online';
    final urlImage =
        'https://bbloan.online/';

    return Drawer(
        child: Material(
      color: Color.fromRGBO(50, 75, 205, 1),
      child: ListView(
        children: <Widget>[
          InkWell(
            onTap: null,
            child: Container(
              padding: padding.add(EdgeInsets.symmetric(vertical: 40)),
              child: Row(
                children: [
                  CircleAvatar(
                      radius: 30, backgroundImage: NetworkImage(urlImage)),
                  SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        email,
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                    ],
                  ),
                  Spacer(),
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: Color.fromRGBO(30, 60, 168, 1),
                    child:
                        Icon(Icons.add_comment_outlined, color: Colors.white),
                  )
                ],
              ),
            ),
          ),
          Container(
            padding: padding,
            child: Column(
              children: [
                // const SizedBox(height: 12),
                // buildSearchField(),
                // const SizedBox(height: 24),
                buildMenuItem(
                  text: 'People',
                  icon: Icons.people,
                  // onClicked: () => selectedItem(context, 0),
                  onClicked: null,
                ),
                const SizedBox(height: 16),
                buildMenuItem(
                  text: 'Favourites',
                  icon: Icons.favorite_border,
                  // onClicked: () => selectedItem(context, 1),
                  onClicked: null,
                ),
                const SizedBox(height: 16),
                buildMenuItem(
                  text: 'Workflow',
                  icon: Icons.workspaces_outline,
                  // onClicked: () => selectedItem(context, 2),
                  onClicked: null,
                ),
                const SizedBox(height: 16),
                buildMenuItem(
                  text: 'Updates',
                  icon: Icons.update,
                  // onClicked: () => selectedItem(context, 3),
                  onClicked: null,
                ),
                const SizedBox(height: 24),
                Divider(color: Colors.white70),
                const SizedBox(height: 24),
                buildMenuItem(
                  text: 'Plugins',
                  icon: Icons.account_tree_outlined,
                  // onClicked: () => selectedItem(context, 4),
                  onClicked: null,
                ),
                const SizedBox(height: 16),
                buildMenuItem(
                  text: 'Notifications',
                  icon: Icons.notifications_outlined,
                  // onClicked: () => selectedItem(context, 5),
                  onClicked: null,
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }



  Widget buildSearchField() {
    final color = Colors.white;

    return TextField(
      style: TextStyle(color: color),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        hintText: 'Search',
        hintStyle: TextStyle(color: color),
        prefixIcon: Icon(Icons.search, color: color),
        filled: true,
        fillColor: Colors.white12,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: color.withOpacity(0.7)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: color.withOpacity(0.7)),
        ),
      ),
    );
  }

  Widget buildMenuItem({
    String text,
    IconData icon,
    VoidCallback onClicked,
  }) {
    final color = Colors.white;
    final hoverColor = Colors.white70;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: color)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }


}
