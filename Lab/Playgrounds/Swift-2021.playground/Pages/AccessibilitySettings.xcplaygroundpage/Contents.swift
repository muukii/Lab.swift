import UIKit

public struct DeviceSettings {

  public struct BooleanValueMask: OptionSet {

    public var rawValue: UInt64

    public init(
      rawValue: UInt64
    ) {
      self.rawValue = rawValue
    }

    public static func makeSnapshot() -> Self {
      var _self = BooleanValueMask()

      if UIAccessibility.isAssistiveTouchRunning {
        _self.insert(.isAssistiveTouchRunning)
      }
      if UIAccessibility.isBoldTextEnabled {
        _self.insert(.isBoldTextEnabled)
      }
      if UIAccessibility.isClosedCaptioningEnabled {
        _self.insert(.isClosedCaptioningEnabled)
      }
      if UIAccessibility.isDarkerSystemColorsEnabled {
        _self.insert(.isDarkerSystemColorsEnabled)
      }
      if UIAccessibility.isGrayscaleEnabled {
        _self.insert(.isGrayscaleEnabled)
      }
      if UIAccessibility.isMonoAudioEnabled {
        _self.insert(.isMonoAudioEnabled)
      }
      if UIAccessibility.isReduceTransparencyEnabled {
        _self.insert(.isReduceTransparencyEnabled)
      }
      if UIAccessibility.isReduceMotionEnabled {
        _self.insert(.isReduceMotionEnabled)
      }
      if UIAccessibility.isShakeToUndoEnabled {
        _self.insert(.isShakeToUndoEnabled)
      }
      if UIAccessibility.isSpeakScreenEnabled {
        _self.insert(.isSpeakScreenEnabled)
      }
      if UIAccessibility.isSpeakSelectionEnabled {
        _self.insert(.isSpeakSelectionEnabled)
      }
      if UIAccessibility.isSwitchControlRunning {
        _self.insert(.isSwitchControlRunning)
      }
      if UIAccessibility.isGuidedAccessEnabled {
        _self.insert(.isGuidedAccessEnabled)
      }
      if UIAccessibility.isInvertColorsEnabled {
        _self.insert(.isInvertColorsEnabled)
      }
      if UIAccessibility.isVoiceOverRunning {
        _self.insert(.isVoiceOverRunning)
      }
      if UIAccessibility.isOnOffSwitchLabelsEnabled {
        _self.insert(.isOnOffSwitchLabelsEnabled)
      }
      if UIAccessibility.isVideoAutoplayEnabled {
        _self.insert(.isVideoAutoplayEnabled)
      }

      return _self
    }

    public static var isAssistiveTouchRunning: Self { .init(rawValue: 1 << 0) }
    public static var isBoldTextEnabled: Self { .init(rawValue: 1 << 1) }
    public static var isClosedCaptioningEnabled: Self { .init(rawValue: 1 << 2) }
    public static var isDarkerSystemColorsEnabled: Self { .init(rawValue: 1 << 3) }
    public static var isGrayscaleEnabled: Self { .init(rawValue: 1 << 4) }
    public static var isMonoAudioEnabled: Self { .init(rawValue: 1 << 5) }
    public static var isReduceTransparencyEnabled: Self { .init(rawValue: 1 << 6) }
    public static var isReduceMotionEnabled: Self { .init(rawValue: 1 << 7) }
    public static var isShakeToUndoEnabled: Self { .init(rawValue: 1 << 8) }
    public static var isSpeakScreenEnabled: Self { .init(rawValue: 1 << 9) }
    public static var isSpeakSelectionEnabled: Self { .init(rawValue: 1 << 10) }
    public static var isSwitchControlRunning: Self { .init(rawValue: 1 << 11) }
    public static var isGuidedAccessEnabled: Self { .init(rawValue: 1 << 12) }
    public static var isInvertColorsEnabled: Self { .init(rawValue: 1 << 13) }
    public static var isVoiceOverRunning: Self { .init(rawValue: 1 << 14) }
    public static var isOnOffSwitchLabelsEnabled: Self { .init(rawValue: 1 << 15) }
    public static var isVideoAutoplayEnabled: Self { .init(rawValue: 1 << 16) }
  }

  public var accessibilityBooleanValueMask: BooleanValueMask?


}

let attributesList: [String: Any]
if #available(iOS 13.0, *) {
  attributesList = [
    "isAssistiveTouchRunning": UIAccessibility.isAssistiveTouchRunning,
    "isBoldTextEnabled": UIAccessibility.isBoldTextEnabled,
    "isClosedCaptioningEnabled": UIAccessibility.isClosedCaptioningEnabled,
    "isDarkerSystemColorsEnabled": UIAccessibility.isDarkerSystemColorsEnabled,
    "isGrayscaleEnabled": UIAccessibility.isGrayscaleEnabled,
    "isMonoAudioEnabled": UIAccessibility.isMonoAudioEnabled,
    "isReduceTransparencyEnabled": UIAccessibility.isReduceTransparencyEnabled,
    "isReduceMotionEnabled": UIAccessibility.isReduceMotionEnabled,
    "isShakeToUndoEnabled": UIAccessibility.isShakeToUndoEnabled,
    "isSpeakScreenEnabled": UIAccessibility.isSpeakScreenEnabled,
    "isSpeakSelectionEnabled": UIAccessibility.isSpeakSelectionEnabled,
    "isSwitchControlRunning": UIAccessibility.isSwitchControlRunning,
    "isGuidedAccessEnabled": UIAccessibility.isGuidedAccessEnabled,
    "isInvertColorsEnabled": UIAccessibility.isInvertColorsEnabled,
    "isVoiceOverRunning": UIAccessibility.isVoiceOverRunning,
    "isOnOffSwitchLabelsEnabled": UIAccessibility.isOnOffSwitchLabelsEnabled,
    "isVideoAutoplayEnabled": UIAccessibility.isVideoAutoplayEnabled,
    "accessibilityContrast": UITraitCollection.current.accessibilityContrast.rawValue,
    "userInterfaceStyle": UITraitCollection.current.userInterfaceStyle.rawValue,
    "preferredContentSizeCategory": UITraitCollection.current.preferredContentSizeCategory,
  ]
} else {
  attributesList = [
    "isAssistiveTouchRunning": UIAccessibility.isAssistiveTouchRunning,
    "isBoldTextEnabled": UIAccessibility.isBoldTextEnabled,
    "isClosedCaptioningEnabled": UIAccessibility.isClosedCaptioningEnabled,
    "isDarkerSystemColorsEnabled": UIAccessibility.isDarkerSystemColorsEnabled,
    "isGrayscaleEnabled": UIAccessibility.isGrayscaleEnabled,
    "isMonoAudioEnabled": UIAccessibility.isMonoAudioEnabled,
    "isReduceTransparencyEnabled": UIAccessibility.isReduceTransparencyEnabled,
    "isReduceMotionEnabled": UIAccessibility.isReduceMotionEnabled,
    "isShakeToUndoEnabled": UIAccessibility.isShakeToUndoEnabled,
    "isSpeakScreenEnabled": UIAccessibility.isSpeakScreenEnabled,
    "isSpeakSelectionEnabled": UIAccessibility.isSpeakSelectionEnabled,
    "isSwitchControlRunning": UIAccessibility.isSwitchControlRunning,
    "isGuidedAccessEnabled": UIAccessibility.isGuidedAccessEnabled,
    "isInvertColorsEnabled": UIAccessibility.isInvertColorsEnabled,
    "isVoiceOverRunning": UIAccessibility.isVoiceOverRunning,
  ]
}
