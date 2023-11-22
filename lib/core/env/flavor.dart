import 'package:genshin_app/core/env/env_config.dart';

/// * This file is configuration to make separate between environment
/// see details about [flutter flavor]

class FlavorSettings {
  FlavorSettings.development() {
    EnvConfig.getInstance(
      flavorName: 'development',
      apiBaseUrl: url,
    );
  }

  FlavorSettings.staging() {
    EnvConfig.getInstance(
      flavorName: 'staging',
      apiBaseUrl: url,
    );
  }

  FlavorSettings.production() {
    EnvConfig.getInstance(
      flavorName: 'production',
      apiBaseUrl: url,
    );
  }
  static const url = 'https://genshin-api-teal.vercel.app';
}
