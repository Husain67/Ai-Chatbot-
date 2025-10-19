import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:myapp/models/chat_tab.dart';
import 'package:myapp/models/chat_message.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class TabService with ChangeNotifier {
  final List<ChatTab> _tabs = [];
  int _currentTabIndex = 0;
  final Uuid _uuid = const Uuid();

  List<ChatTab> get tabs => _tabs;
  int get currentTabIndex => _currentTabIndex;
  ChatTab? get currentTab => _tabs.isNotEmpty ? _tabs[_currentTabIndex] : null;

  TabService() {
    _loadTabs();
  }

  Future<void> _loadTabs() async {
    final prefs = await SharedPreferences.getInstance();
    final tabsJson = prefs.getStringList('chat_tabs') ?? [];

    if (tabsJson.isEmpty) {
      // Create default tab
      _createNewTab('Chat 1');
    } else {
      _tabs.clear();
      for (final tabJson in tabsJson) {
        final tabMap = json.decode(tabJson);
        _tabs.add(ChatTab.fromJson(tabMap));
      }
    }

    notifyListeners();
  }

  Future<void> _saveTabs() async {
    final prefs = await SharedPreferences.getInstance();
    final tabsJson = _tabs.map((tab) => json.encode(tab.toJson())).toList();
    await prefs.setStringList('chat_tabs', tabsJson);
  }

  void _createNewTab(String title) {
    final newTab = ChatTab(
      id: _uuid.v4(),
      title: title,
      messages: [], // Removed initial message
      createdAt: DateTime.now(),
    );
    _tabs.add(newTab);
    _currentTabIndex = _tabs.length - 1;
    _saveTabs();
    notifyListeners();
  }

  void createNewTab() {
    final tabNumber = _tabs.length + 1;
    _createNewTab('Chat $tabNumber');
  }

  void switchToTab(int index) {
    if (index >= 0 && index < _tabs.length) {
      _currentTabIndex = index;
      notifyListeners();
    }
  }

  void closeTab(int index) {
    if (_tabs.length > 1 && index >= 0 && index < _tabs.length) {
      _tabs.removeAt(index);
      if (_currentTabIndex >= index && _currentTabIndex > 0) {
        _currentTabIndex--;
      }
      _saveTabs();
      notifyListeners();
    }
  }

  void addMessageToCurrentTab(ChatMessage message) {
    if (_tabs.isNotEmpty) {
      _tabs[_currentTabIndex].messages.add(message);
      _tabs[_currentTabIndex].lastActivity = DateTime.now();
      _saveTabs();
      notifyListeners();
    }
  }

  void clearCurrentTab() {
    if (_tabs.isNotEmpty) {
      _tabs[_currentTabIndex].messages.clear();
      // Removed initial message from here as well
      _tabs[_currentTabIndex].lastActivity = DateTime.now();
      _saveTabs();
      notifyListeners();
    }
  }

  void renameTab(int index, String newTitle) {
    if (index >= 0 && index < _tabs.length) {
      _tabs[index] = _tabs[index].copyWith(title: newTitle);
      _saveTabs();
      notifyListeners();
    }
  }
}
