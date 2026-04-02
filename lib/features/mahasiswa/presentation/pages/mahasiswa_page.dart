import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tes/core/widgets/widgets.dart';
import 'package:tes/features/mahasiswa/data/models/mahasiswa_model.dart';
import 'package:tes/features/mahasiswa/presentation/providers/mahasiswa_provider.dart';

class MahasiswaPage extends ConsumerWidget {
  const MahasiswaPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(mahasiswaNotifierProvider);
    final saved = ref.watch(savedMahasiswaProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Mahasiswa'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => ref.invalidate(mahasiswaNotifierProvider),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SavedMahasiswaSection(saved: saved, ref: ref),

          const Padding(
            padding: EdgeInsets.fromLTRB(16, 8, 16, 4),
            child: Text(
              'Daftar Mahasiswa',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),

          Expanded(
            child: state.when(
              loading: () => const LoadingWidget(),
              error: (e, _) => CustomErrorWidget(
                message: 'Gagal memuat data mahasiswa: ${e.toString()}',
                onRetry: () {
                  ref.read(mahasiswaNotifierProvider.notifier).refresh();
                },
              ),
              data: (list) => _MahasiswaList(
                mahasiswaList: list,
                onRefresh: () =>
                    ref.invalidate(mahasiswaNotifierProvider),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ================= SAVED SECTION =================
class _SavedMahasiswaSection extends ConsumerWidget {
  final AsyncValue<List<Map<String, String>>> saved;
  final WidgetRef ref;

  const _SavedMahasiswaSection({
    required this.saved,
    required this.ref,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.storage),
              const SizedBox(width: 8),
              const Text(
                'Data Tersimpan',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              saved.maybeWhen(
                data: (users) => users.isNotEmpty
                    ? TextButton(
                  onPressed: () async {
                    await ref
                        .read(mahasiswaNotifierProvider.notifier)
                        .clearSavedMahasiswa();

                    ref.invalidate(savedMahasiswaProvider);

                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content:
                          Text('Semua data tersimpan dihapus'),
                        ),
                      );
                    }
                  },
                  child: const Text(
                    'Hapus Semua',
                    style: TextStyle(color: Colors.red),
                  ),
                )
                    : const SizedBox(),
                orElse: () => const SizedBox(),
              ),
            ],
          ),

          const SizedBox(height: 8),

          // 🔵 CONTENT BIRU
          saved.when(
            loading: () => const LinearProgressIndicator(),
            error: (_, __) => const Text('Error'),
            data: (users) {
              if (users.isEmpty) {
                return const Text('Belum ada data');
              }

              return Container(
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.blue.shade200),
                ),
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: users.length,
                  separatorBuilder: (_, __) => Divider(
                    height: 1,
                    color: Colors.blue.shade100,
                    indent: 12,
                    endIndent: 12,
                  ),
                  itemBuilder: (context, index) {
                    final user = users[index];

                    return ListTile(
                      dense: true,
                      leading: CircleAvatar(
                        radius: 14,
                        backgroundColor: Colors.blue.shade100,
                        child: Text(
                          '${index + 1}',
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.blue.shade700,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      title: Text(
                        user['username'] ?? '-',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue.shade700,
                        ),
                      ),
                      subtitle: Text(
                        'ID: ${user['user_id']}',
                        style: const TextStyle(fontSize: 11),
                      ),
                      trailing: IconButton(
                        icon:
                        const Icon(Icons.delete, color: Colors.red),
                        onPressed: () async {
                          await ref
                              .read(mahasiswaNotifierProvider.notifier)
                              .removeSavedMahasiswa(
                              user['user_id'] ?? '');

                          ref.invalidate(savedMahasiswaProvider);

                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                    '${user['username']} dihapus'),
                              ),
                            );
                          }
                        },
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

// ================= LIST =================
class _MahasiswaList extends ConsumerWidget {
  final List<MahasiswaModel> mahasiswaList;
  final VoidCallback onRefresh;

  const _MahasiswaList({
    required this.mahasiswaList,
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return RefreshIndicator(
      onRefresh: () async => onRefresh(),
      child: ListView.builder(
        itemCount: mahasiswaList.length,
        itemBuilder: (context, index) {
          final m = mahasiswaList[index];

          return Card(
            margin: const EdgeInsets.all(8),
            child: ListTile(
              title: Text(m.name),
              subtitle: Text('${m.email}\n${m.body}'),
              isThreeLine: true,
              trailing: IconButton(
                icon: const Icon(Icons.save),
                onPressed: () async {
                  await ref
                      .read(mahasiswaNotifierProvider.notifier)
                      .saveSelectedMahasiswa(m);

                  ref.invalidate(savedMahasiswaProvider);

                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('${m.name} disimpan'),
                      ),
                    );
                  }
                },
              ),
            ),
          );
        },
      ),
    );
  }
}