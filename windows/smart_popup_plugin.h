#ifndef FLUTTER_PLUGIN_SMART_POPUP_PLUGIN_H_
#define FLUTTER_PLUGIN_SMART_POPUP_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace smart_popup {

class SmartPopupPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  SmartPopupPlugin();

  virtual ~SmartPopupPlugin();

  // Disallow copy and assign.
  SmartPopupPlugin(const SmartPopupPlugin&) = delete;
  SmartPopupPlugin& operator=(const SmartPopupPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace smart_popup

#endif  // FLUTTER_PLUGIN_SMART_POPUP_PLUGIN_H_
