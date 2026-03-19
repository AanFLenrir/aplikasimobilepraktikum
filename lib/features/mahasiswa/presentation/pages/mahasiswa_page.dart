import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/widgets/widgets.dart';
import '../providers/mahasiswa_provider.dart';
import '../widgets/mahasiswa_widget.dart';

class MahasiswaPage extends ConsumerWidget {
  const MahasiswaPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mahasiswaState = ref.watch(mahasiswaNotifierProvider);

    void refresh() {
      ref.invalidate(mahasiswaNotifierProvider);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Data Mahasiswa"),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: refresh,
          ),
        ],
      ),

      body: mahasiswaState.when(
        loading: () => const LoadingWidget(),

        error: (error, stack) => CustomErrorWidget(
          message: error.toString(),
          onRetry: refresh,
        ),

        data: (mahasiswaList) => MahasiswaListView(
          mahasiswaList: mahasiswaList,
          onRefresh: refresh,
        ),
      ),
    );
  }
}