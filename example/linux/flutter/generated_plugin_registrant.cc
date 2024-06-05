//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <smart_popup/smart_popup_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) smart_popup_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "SmartPopupPlugin");
  smart_popup_plugin_register_with_registrar(smart_popup_registrar);
}
