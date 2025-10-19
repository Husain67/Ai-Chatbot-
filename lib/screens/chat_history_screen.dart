import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:myapp/services/tab_service.dart';
import 'package:intl/intl.dart';
import 'package:myapp/l10n/app_localizations.dart';

class ChatHistoryScreen extends StatelessWidget {
  const ChatHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tabService = Provider.of<TabService>(context);
    final localizations = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(title: Text(localizations.chatHistory)),
      body: tabService.tabs.isEmpty
          ? Center(child: Text(localizations.noChatHistory))
          : ListView.builder(
              itemCount: tabService.tabs.length,
              itemBuilder: (context, index) {
                final tab = tabService.tabs[index];
                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: ListTile(
                    title: Text(tab.title),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${tab.messages.length} ${localizations.messages}'),
                        Text(
                          localizations.lastActivity(DateFormat('MMM dd, yyyy hh:mm a').format(tab.lastActivity)),
                          style: TextStyle(
                            fontSize: 12,
                            color: Theme.of(context).colorScheme.onSurface
                                .withAlpha((255 * 0.6).round()),
                          ),
                        ),
                      ],
                    ),
                    trailing: PopupMenuButton<String>(
                      onSelected: (value) {
                        switch (value) {
                          case 'switch':
                            tabService.switchToTab(index);
                            Navigator.of(context).pop();
                            break;
                          case 'rename':
                            _showRenameDialog(context, tabService, index);
                            break;
                          case 'delete':
                            _showDeleteDialog(context, tabService, index);
                            break;
                        }
                      },
                      itemBuilder: (BuildContext context) => [
                        PopupMenuItem<String>(
                          value: 'switch',
                          child: Row(
                            children: [
                              const Icon(Icons.swap_horiz),
                              const SizedBox(width: 8),
                              Text(localizations.switchToTab),
                            ],
                          ),
                        ),
                        PopupMenuItem<String>(
                          value: 'rename',
                          child: Row(
                            children: [
                              const Icon(Icons.edit),
                              const SizedBox(width: 8),
                              Text(localizations.rename),
                            ],
                          ),
                        ),
                        PopupMenuItem<String>(
                          value: 'delete',
                          child: Row(
                            children: [
                              const Icon(Icons.delete, color: Colors.red),
                              const SizedBox(width: 8),
                              Text(
                                localizations.delete,
                                style: const TextStyle(color: Colors.red),
                              ),
                            ],
                          ),
                        ),
                      ],
                      child: const Icon(Icons.more_vert),
                    ),
                    onTap: () {
                      tabService.switchToTab(index);
                      Navigator.of(context).pop();
                    },
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          tabService.createNewTab();
          Navigator.of(context).pop();
        },
        tooltip: localizations.newTab,
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showRenameDialog(
    BuildContext context,
    TabService tabService,
    int index,
  ) {
    final controller = TextEditingController(
      text: tabService.tabs[index].title,
    );
    final localizations = AppLocalizations.of(context)!;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(localizations.renameChat),
        content: TextField(
          controller: controller,
          decoration: InputDecoration(
            labelText: localizations.chatName,
            hintText: localizations.enterNewName,
          ),
          autofocus: true,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(localizations.cancel),
          ),
          TextButton(
            onPressed: () {
              if (controller.text.isNotEmpty) {
                tabService.renameTab(index, controller.text);
                Navigator.of(context).pop();
              }
            },
            child: Text(localizations.rename),
          ),
        ],
      ),
    );
  }

  void _showDeleteDialog(
    BuildContext context,
    TabService tabService,
    int index,
  ) {
    final localizations = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(localizations.deleteChat),
        content: Text(localizations.deleteChatConfirm),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(localizations.cancel),
          ),
          TextButton(
            onPressed: () {
              tabService.closeTab(index);
              Navigator.of(context).pop();
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: Text(localizations.delete),
          ),
        ],
      ),
    );
  }
}
