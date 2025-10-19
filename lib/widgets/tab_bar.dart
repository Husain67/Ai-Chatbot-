import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:myapp/services/tab_service.dart';
import 'package:myapp/l10n/app_localizations.dart';

class ChatTabBar extends StatelessWidget {
  const ChatTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    final tabService = Provider.of<TabService>(context);
    final localizations = AppLocalizations.of(context)!;

    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        border: Border(
          bottom: BorderSide(color: Theme.of(context).dividerColor, width: 1.0),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: tabService.tabs.length,
              itemBuilder: (context, index) {
                final tab = tabService.tabs[index];
                final isActive = index == tabService.currentTabIndex;

                return GestureDetector(
                  onTap: () => tabService.switchToTab(index),
                  child: Container(
                    constraints: const BoxConstraints(
                      minWidth: 120,
                      maxWidth: 200,
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    margin: const EdgeInsets.symmetric(
                      horizontal: 2,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: isActive
                          ? Theme.of(context).colorScheme.primaryContainer
                          : Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: isActive
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).dividerColor,
                        width: 1,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: Text(
                            tab.title,
                            style: TextStyle(
                              color: isActive
                                  ? Theme.of(context).colorScheme.primary
                                  : Theme.of(context).colorScheme.onSurface,
                              fontWeight: isActive
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                              fontSize: 14,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        if (tabService.tabs.length > 1)
                          GestureDetector(
                            onTap: () => tabService.closeTab(index),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Icon(
                                Icons.close,
                                size: 16,
                                color: Theme.of(context).colorScheme.onSurface
                                    .withAlpha((255 * 0.6).round()),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: tabService.createNewTab,
            tooltip: localizations.newTab,
          ),
        ],
      ),
    );
  }
}
