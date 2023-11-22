import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:genshin_app/app/app.dart';
import 'package:genshin_app/bootstrap.dart';
import 'package:genshin_app/core/env/env_config.dart';
import 'package:genshin_app/core/env/flavor.dart';

void main() {
  FlavorSettings.development();

  bootstrap(() => const App());

  if (!kReleaseMode) {
    final settings = EnvConfig.getInstance();
    log('🚀 APP FLAVOR NAME      : ${settings.flavorName}', name: 'ENV');
    log('🚀 APP API_BASE_URL     : ${settings.apiBaseUrl}', name: 'ENV');
  }
}
