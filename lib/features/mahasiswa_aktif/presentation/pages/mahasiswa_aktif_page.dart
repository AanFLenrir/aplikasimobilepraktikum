import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/widgets/widgets.dart';
import '../providers/mahasiswa_aktif_provider.dart';
import '../widgets/mahasiswa_aktif_widget.dart';

class MahasiswaAktifPage extends ConsumerWidget {
  const MahasiswaAktifPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(mahasiswaAktifNotifierProvider);

    void refresh() {
      ref.invalidate(mahasiswaAktifNotifierProvider);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Mahasiswa Aktif"),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: refresh,
          ),
        ],
      ),

      body: state.when(
        loading: () => const LoadingWidget(),

        error: (error, stack) => CustomErrorWidget(
          message: error.toString(),
          onRetry: refresh,
        ),

        data: (dataList) => MahasiswaAktifListView(
          dataList: dataList,
          onRefresh: refresh,
        ),
      ),
    );
  }
}