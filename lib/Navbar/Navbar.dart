import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:lenovo_hiring/repository/auth/auth_state.dart';
import 'package:lenovo_hiring/constants/nav_items.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 1200) {
          return const DesktopNavbar();
        } else if (constraints.maxWidth > 1025) {
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
    return NavbarContent(screenWidth: screenWidth * 0.9);
  }
}

class TabletNavbar extends StatelessWidget {
  const TabletNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return NavbarContent(screenWidth: screenWidth * 0.9);
  }
}

class MobileNavbar extends StatelessWidget {
  const MobileNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    //double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 60),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GestureDetector(
            onTap: () => context.go('/'),
            child: Image.asset("assets/images/logo.png", height: 30),
          ),
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () => _showCustomDrawer(context),
          ),
        ],
      ),
    );
  }

  void _showCustomDrawer(BuildContext context) {
    OverlayState overlayState = Overlay.of(context);
    late OverlayEntry overlayEntry;

    overlayEntry = OverlayEntry(
      builder: (context) {
        return Positioned(
          top: 0,
          right: 0,
          child: Material(
            color: const Color.fromRGBO(77, 20, 74, 1),
            child: Container(
              width: 250,
              height: MediaQuery.of(context).size.height,
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.white),
                    onPressed: () => overlayEntry.remove(),
                  ),
                  _buildNavList(context),
                ],
              ),
            ),
          ),
        );
      },
    );

    overlayState.insert(overlayEntry);
  }

  Widget _buildNavList(BuildContext context) {
    return Consumer<AuthState>(
      builder: (context, state, _) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: state.nav().map((title) {
            return ListTile(
              title: Text(
                title,
                style: const TextStyle(color: Colors.white, fontSize: 14),
              ),
              onTap: () {
                handleNavItemClick(context, title);
                Overlay.of(context)?.dispose();
              },
            );
          }).toList(),
        );
      },
    );
  }
}

class NavbarContent extends StatelessWidget {
  final double screenWidth;

  const NavbarContent({required this.screenWidth, super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthState>(
      builder: (context, state, _) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 0),
          child: Container(
            width: screenWidth,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => context.go('/'),
                  child: Image.asset("assets/images/logo.png", height: 30,),
                ),
                const Spacer(),
                Row(
                  children: state
                      .nav()
                      .map((title) => _buildNavItem(context, title))
                      .toList(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildNavItem(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: TextButton(
        onPressed: () => handleNavItemClick(context, title),
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

// Helper function for navigation
void handleNavItemClick(BuildContext context, String title) {
  switch (title) {
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
    case "LEADERBOARD":
      context.go('/leader-board');
      break;
    case "ADD QUIZ":
      context.go('/add-quiz');
      break;
    case "ADD QUESTION":
      context.go('/add-question');
      break;
    case "ADD ADMIN":
      context.go('/add-admin');
      break;
    case "LOGOUT":
      context.read<AuthState>().logout(context);
      break;
    default:
      context.go('/');
  }
}
