# ESPHome LVGL Switchplate

This project provides a modular, fully customizable ESPHome configuration for creating smart switch panels using the **WT32-SC01** and **WT32-SC01 Plus** touchscreens with **LVGL**.

## 🛠️ Usage

To create a new device:

1.  Copy `example.yaml` to a new file (e.g., `my-room.yaml`).
2.  Edit the **substitutions** block to match your Home Assistant entities and preferences:
    *   **Device Info**: Name and friendly name.
    *   **Entities**: Map your HA lights, switches, and sensors.
    *   **Icons**: Copy/paste Material Design Icon glyphs (e.g., `\U000F0335`).
    *   **Services**: Choose between `light.toggle`, `switch.toggle`, etc.
3.  Compile and upload!

## 🧩 Customization

The UI is defined in `packages/common/ui.yaml`. Thanks to the substitution system, you can change the behavior of the main buttons without touching the core UI code:

```yaml
substitutions:
  # Change the icon for button 2
  icon_main_2: "\U000F0594" # mdi:weather-night

  # Change the action for button 2
  service_main_2: "switch.toggle"
```
