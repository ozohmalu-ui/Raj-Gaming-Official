import 'package:flutter/material.dart';

void main() => runApp(const RajGamingApp());

class RajGamingApp extends StatefulWidget {
  const RajGamingApp({super.key});

  @override
  State<RajGamingApp> createState() => _RajGamingAppState();
}

class _RajGamingAppState extends State<RajGamingApp> {
  ThemeMode themeMode = ThemeMode.dark;
  bool swahili = false;

  void toggleTheme() => setState(() {
    themeMode = themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
  });

  void toggleLanguage() => setState(() => swahili = !swahili);

  @override
  Widget build(BuildContext context) {
    const gold = Color(0xFFE5B642);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RAJ GAMING OFFICIAL',
      themeMode: themeMode,
      theme: ThemeData(
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSeed(seedColor: gold, brightness: Brightness.light),
        scaffoldBackgroundColor: const Color(0xFFF5F6F8),
        appBarTheme: const AppBarTheme(backgroundColor: Colors.white, foregroundColor: Color(0xFF171717)),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(seedColor: gold, brightness: Brightness.dark),
        scaffoldBackgroundColor: const Color(0xFF101318),
        appBarTheme: const AppBarTheme(backgroundColor: Color(0xFF101318), foregroundColor: Colors.white),
        useMaterial3: true,
      ),
      home: RajHome(
        swahili: swahili,
        isDark: themeMode == ThemeMode.dark,
        onThemeToggle: toggleTheme,
        onLanguageToggle: toggleLanguage,
      ),
    );
  }
}

class RajHome extends StatefulWidget {
  final bool swahili;
  final bool isDark;
  final VoidCallback onThemeToggle;
  final VoidCallback onLanguageToggle;

  const RajHome({
    super.key,
    required this.swahili,
    required this.isDark,
    required this.onThemeToggle,
    required this.onLanguageToggle,
  });

  @override
  State<RajHome> createState() => _RajHomeState();
}

class _RajHomeState extends State<RajHome> {
  int selectedTab = 0;

  String t(String en, String sw) => widget.swahili ? sw : en;

  @override
  Widget build(BuildContext context) {
    final pages = [
      _homePage(context),
      _newPage(context),
      _shopPage(context),
      _profilePage(context),
    ];
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 18,
        title: Row(
          children: [
            Container(
              height: 36, width: 36,
              decoration: BoxDecoration(color: const Color(0xFFE5B642), borderRadius: BorderRadius.circular(11)),
              child: const Icon(Icons.sports_soccer, color: Color(0xFF171717)),
            ),
            const SizedBox(width: 10),
            const Text('RAJ GAMING OFFICIAL', style: TextStyle(fontWeight: FontWeight.w900, letterSpacing: 1.1)),
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications_none_rounded)),
          const SizedBox(width: 5),
        ],
      ),
      body: IndexedStack(index: selectedTab, children: pages),
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedTab,
        onDestinationSelected: (i) => setState(() => selectedTab = i),
        destinations: [
          NavigationDestination(icon: const Icon(Icons.home_outlined), selectedIcon: const Icon(Icons.home), label: t('Home', 'Nyumbani')),
          NavigationDestination(icon: const Icon(Icons.auto_awesome_outlined), selectedIcon: const Icon(Icons.auto_awesome), label: t('New', 'Mpya')),
          NavigationDestination(icon: const Icon(Icons.shopping_bag_outlined), selectedIcon: const Icon(Icons.shopping_bag), label: t('Shop', 'Duka')),
          NavigationDestination(icon: const Icon(Icons.person_outline), selectedIcon: const Icon(Icons.person), label: t('Profile', 'Akaunti')),
        ],
      ),
    );
  }

  Widget _sectionTitle(String title, {String? action}) => Padding(
    padding: const EdgeInsets.fromLTRB(18, 22, 18, 12),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
        if (action != null) Text(action, style: const TextStyle(color: Color(0xFFE5B642), fontWeight: FontWeight.w700)),
      ],
    ),
  );

  Widget _homePage(BuildContext context) => ListView(
    padding: const EdgeInsets.only(bottom: 24),
    children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
        child: Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            gradient: const LinearGradient(colors: [Color(0xFF263B59), Color(0xFF111820)], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text('RAJ GAMING OFFICIAL • OFFICIAL', style: TextStyle(color: Color(0xFFE5B642), fontSize: 11, fontWeight: FontWeight.w900, letterSpacing: 1.2)),
            const SizedBox(height: 12),
            Text(t('Your gaming updates, all in one place.', 'Updates zako zote za gaming sehemu moja.'), style: const TextStyle(fontSize: 23, fontWeight: FontWeight.w900, color: Colors.white)),
            const SizedBox(height: 8),
            Text(t('Game mods • New seasons • Players • Teams', 'Game mods • New seasons • Wachezaji • Timu'), style: const TextStyle(color: Colors.white70, fontSize: 12)),
          ]),
        ),
      ),
      _sectionTitle(t('Latest updates', 'Updates za karibuni'), action: t('View all', 'Ona zote')),
      _postCard(context, 'eFootball v1.0 MOD MPL', 'New season update is coming. Check out the latest game improvements.', 'GAME UPDATE', '2 hours ago', Icons.sports_soccer),
      _postCard(context, 'New player faces pack', 'Fresh player face updates for your football game.', 'PLAYER UPDATE', 'Yesterday', Icons.face),
      _postCard(context, 'Team kits update', 'Updated kits and team details are now available.', 'TEAM UPDATE', '2 days ago', Icons.checkroom),
    ],
  );

  Widget _newPage(BuildContext context) => ListView(
    padding: const EdgeInsets.only(bottom: 24),
    children: [
      _sectionTitle(t('What’s new', 'Vilivyotoka vipya')),
      _postCard(context, 'New Season 2026/27', 'Latest season news, features and game announcements.', 'NEW SEASON', 'Just now', Icons.new_releases_outlined),
      _postCard(context, 'Squad update', 'Player ratings and squad information update.', 'PLAYERS', '5 hours ago', Icons.groups_outlined),
      _postCard(context, 'Stadium pack', 'A new stadium pack has been added to the shop.', 'DOWNLOAD', 'Yesterday', Icons.stadium_outlined),
    ],
  );

  Widget _shopPage(BuildContext context) => ListView(
    padding: const EdgeInsets.only(bottom: 24),
    children: [
      _sectionTitle(t('Gaming Shop', 'Duka la Gaming')),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Text(t('Game files, mods and add-ons', 'Mafaili ya game, mods na nyongeza'), style: TextStyle(color: Theme.of(context).hintColor)),
      ),
      const SizedBox(height: 12),
      _shopItem(context, 'eFootball v1.0 MOD MPL', 'Textures + SaveData', 'TZS 5,000', true),
      _shopItem(context, 'Classic Stadium Textures', 'PPSSPP texture pack', 'FREE', false),
      _shopItem(context, 'Updated Player Faces', 'Player face collection', 'TZS 3,000', true),
      _shopItem(context, 'Team Kits Pack', 'Latest kit collection', 'FREE', false),
    ],
  );

  Widget _profilePage(BuildContext context) => ListView(
    padding: const EdgeInsets.only(bottom: 24),
    children: [
      _sectionTitle(t('My Profile', 'Akaunti yangu')),
      const SizedBox(height: 4),
      Center(child: Column(children: [
        CircleAvatar(radius: 38, backgroundColor: const Color(0xFFE5B642), child: const Icon(Icons.person, size: 42, color: Color(0xFF171717))),
        const SizedBox(height: 10),
        const Text('Raj Gaming Member', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w800)),
        Text(t('Sign in to sync your purchases', 'Ingia ili kuhifadhi manunuzi yako'), style: TextStyle(color: Theme.of(context).hintColor, fontSize: 12)),
      ])),
      _sectionTitle(t('Account', 'Akaunti')),
      _profileTile(Icons.download_done, t('My purchases', 'Manunuzi yangu'), t('Your paid files', 'Mafaili uliyolipia')),
      _profileTile(Icons.history, t('Download history', 'Historia ya downloads'), t('Files you downloaded', 'Mafaili uliyopakua')),
      _profileTile(Icons.account_balance_wallet_outlined, t('Wallet & payments', 'Wallet na malipo'), t('Payment history and balance', 'Historia ya malipo na salio')),
      _sectionTitle(t('Preferences', 'Mipangilio')),
      SwitchListTile(
        secondary: const Icon(Icons.dark_mode_outlined),
        title: Text(t('Dark mode', 'Muonekano wa giza')),
        value: widget.isDark,
        onChanged: (_) => widget.onThemeToggle(),
      ),
      ListTile(
        leading: const Icon(Icons.language),
        title: Text(t('Language', 'Lugha')),
        subtitle: Text(widget.swahili ? 'Kiswahili' : 'English'),
        trailing: TextButton(onPressed: widget.onLanguageToggle, child: Text(t('Change', 'Badilisha'))),
      ),
      _profileTile(Icons.help_outline, t('Help & support', 'Msaada'), t('Contact Raj Gaming', 'Wasiliana na Raj Gaming')),
    ],
  );

  Widget _postCard(BuildContext context, String title, String description, String category, String time, IconData icon) {
    return Card(
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 12),
      clipBehavior: Clip.antiAlias,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(height: 112, width: double.infinity, color: const Color(0xFF24354B), child: Icon(icon, size: 54, color: const Color(0xFFE5B642))),
        Padding(padding: const EdgeInsets.fromLTRB(14, 12, 14, 14), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [
            Container(padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5), decoration: BoxDecoration(color: const Color(0xFFE5B642).withOpacity(.16), borderRadius: BorderRadius.circular(20)), child: Text(category, style: const TextStyle(color: Color(0xFFE5B642), fontSize: 9, fontWeight: FontWeight.w900))),
            const Spacer(),
            Text(time, style: TextStyle(color: Theme.of(context).hintColor, fontSize: 10)),
          ]),
          const SizedBox(height: 8),
          Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800)),
          const SizedBox(height: 5),
          Text(description, style: TextStyle(color: Theme.of(context).hintColor, fontSize: 12)),
          const SizedBox(height: 12),
          Row(children: [
            const Icon(Icons.favorite_border, size: 18),
            const SizedBox(width: 5),
            const Text('Like', style: TextStyle(fontSize: 12)),
            const SizedBox(width: 20),
            const Icon(Icons.mode_comment_outlined, size: 18),
            const SizedBox(width: 5),
            const Text('Comment', style: TextStyle(fontSize: 12)),
            const Spacer(),
            const Icon(Icons.share_outlined, size: 18),
          ]),
        ])),
      ]),
    );
  }

  Widget _shopItem(BuildContext context, String title, String subtitle, String price, bool premium) => Card(
    margin: const EdgeInsets.fromLTRB(16, 0, 16, 11),
    child: ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      leading: Container(width: 48, height: 48, decoration: BoxDecoration(color: const Color(0xFFE5B642).withOpacity(.16), borderRadius: BorderRadius.circular(12)), child: const Icon(Icons.folder_zip_outlined, color: Color(0xFFE5B642))),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 13)),
      subtitle: Text(subtitle, style: const TextStyle(fontSize: 11)),
      trailing: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.end, children: [
        Text(price, style: TextStyle(fontWeight: FontWeight.w900, color: premium ? const Color(0xFFE5B642) : Colors.green)),
        Text(premium ? 'PREMIUM' : 'FREE', style: TextStyle(fontSize: 9, color: Theme.of(context).hintColor)),
      ]),
    ),
  );

  Widget _profileTile(IconData icon, String title, String subtitle) => ListTile(
    leading: Icon(icon),
    title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
    subtitle: Text(subtitle, style: const TextStyle(fontSize: 11)),
    trailing: const Icon(Icons.chevron_right),
    onTap: () {},
  );
}
