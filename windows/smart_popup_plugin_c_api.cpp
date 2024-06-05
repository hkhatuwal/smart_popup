#include "include/smart_popup/smart_popup_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "smart_popup_plugin.h"

void SmartPopupPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  smart_popup::SmartPopupPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
