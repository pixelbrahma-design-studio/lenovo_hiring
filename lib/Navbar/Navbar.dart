import 'package:flutter/material.dart';
import 'package:lenovo_hiring/constants/nav_items.dart';
import 'package:go_router/go_router.dart';
import 'package:lenovo_hiring/repository/auth/auth_state.dart';
import 'package:provider/provider.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 1200) {
          return const DesktopNavbar();
        } else if (constraints.maxWidth > 800 && constraints.maxWidth < 1200) {
          return const TabletNavbar();
        } else {
          return const MobileNavbar();
        }
      },
    );
  }
}



class DesktopNavbar extends StatelessWidget {
  const DesktopNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
      child: Container(
        width: screenWidth * 0.8,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                context.go('/');
              },
              child: Image.asset(
                "assets/images/logo.png",
              ),
            ),
            const Spacer(),
            for (int i = 0; i < navTitles.length; i++)
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: TextButton(
                  onPressed: () {
                    // Handle navigation for each navTitle
                    switch (navTitles[i]) {
                      case "SMARTSPRINT":
                        context.go('/smartsprint');
                        break;
                      case "CAMPUS HIRING 2025":
                        context.go('/campus-hiring-2025');
                        break;
                      case "LOGIN":
                        context.go('/login');
                        break;
                      case "ABOUT LENOVO":
                        context.go('/about_lenovo');
                        break;
                      case "LOGOUT":
                        context.read<AuthState>().logout(context);
                        break;
                      default:
                        context.go('/');
                    }
                  },
                  child: Text(
                    navTitles[i],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class TabletNavbar extends StatelessWidget {
  const TabletNavbar({super.key});

  @override
  Widget build(BuildContext context){
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
      child: Container(
        width: screenWidth * 0.9,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                context.go('/');
              },
              child: Image.asset(
                "assets/images/logo.png",
                height: 30,
              ),
            ),
            const Spacer(),
            for (int i = 0; i < navTitles.length; i++)
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: TextButton(
                  onPressed: () {
                    // Handle navigation for each navTitle
                    switch (navTitles[i]) {
                      case "SMARTSPRINT":
                        context.go('/smartsprint');
                        break;
                      case "CAMPUS HIRING 2025":
                        context.go('/campus-hiring-2025');
                        break;
                      case "LOGIN":
                        context.go('/login');
                        break;
                      case "ABOUT LENOVO":
                        context.go('/about_lenovo');
                        break;
                      case "LOGOUT":
                        context.read<AuthState>().logout(context);
                        break;
                      default:
                        context.go('/');
                    }
                  },
                  child: Text(
                    navTitles[i],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class MobileNavbar extends StatelessWidget {
  const MobileNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              context.go("/");
            },
            child: Image.asset(
              "assets/images/logo.png",
              height: 30,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () {
              // Trigger the custom drawer
              _showCustomDrawer(context);
            },
          ),
        ],
      ),
    );
  }

  void _showCustomDrawer(BuildContext context) {
  // Use Overlay to display a custom drawer
  OverlayState overlayState = Overlay.of(context);

  // Declare overlayEntry as 'late' so it can be initialized after creation
  late OverlayEntry overlayEntry;

  // Initialize the overlayEntry with the actual widget
  overlayEntry = OverlayEntry(
    builder: (context) {
      return Positioned(
        top: 0,
        right: 0,
        child: Material(
          color: Color.fromRGBO(77, 20, 74, 1),
          child: Container(
            width: 250,
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  icon: const Icon(Icons.close, color: Colors.white,),
                  onPressed: () {
                    overlayEntry.remove(); // Close drawer manually
                  },
                ),
                for (int i = 0; i < navTitles.length; i++)
                  ListTile(
                    title: Text(
                      navTitles[i],
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14
                      ),
                    ),
                    onTap: () {
                      // Handle navigation inside the overlay drawer
                      switch (navTitles[i]) {
                        case "SMARTSPRINT":
                          context.go('/smartsprint');
                          break;
                        case "CAMPUS HIRING 2025":
                          context.go('/campus-hiring-2025');
                          break;
                        case "LOGIN":
                          context.go('/login');
                          break;
                        case "ABOUT LENOVO":
                          context.go('/about_lenovo');
                          break;
                        case "LOGOUT":
                          context.read<AuthState>().logout(context);
                          break;
                        default:
                          context.go('/');
                      }
                      overlayEntry.remove(); // Close drawer after selection
                    },
                  ),
                
              ],
            ),
          ),
        ),
      );
    },
  );

  // Insert the overlay entry into the overlay
  overlayState.insert(overlayEntry);
}


}