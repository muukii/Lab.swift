
import UIKit

extension UIColor {

  public enum NeonColorAdjustment {
    case brighter
    case normal
    case darker
  }

  public enum NeonColorName {
    case yellow
    case red
    case pink
    case purple
    case violet
    case blue
    case cyan
  }

  public static func neon(_ name: NeonColorName, _ adjustment: NeonColorAdjustment = .normal) -> UIColor {

    switch name {
    case .yellow:
      switch adjustment {
      case .brighter:
        return .init { trait in
          switch trait.userInterfaceStyle {
          case .unspecified, .light:
            return #colorLiteral(red: 1, green: 0.5505930781, blue: 0.3310113549, alpha: 1)
          case .dark:
            return #colorLiteral(red: 1, green: 0.6517947316, blue: 0.4440079927, alpha: 1)
          }
        }
      case .normal:
        return .init { trait in
          switch trait.userInterfaceStyle {
          case .unspecified, .light:
            return #colorLiteral(red: 1, green: 0.4404559135, blue: 0.1397651136, alpha: 1)
          case .dark:
            return #colorLiteral(red: 1, green: 0.5661777854, blue: 0.3006193042, alpha: 1)
          }
        }
      case .darker:
        return .init { trait in
          switch trait.userInterfaceStyle {
          case .unspecified, .light:
            return #colorLiteral(red: 0.8390000463, green: 0.3546677828, blue: 0.1172295138, alpha: 1)
          case .dark:
            return #colorLiteral(red: 0.8524438143, green: 0.4539724588, blue: 0.2434689403, alpha: 1)
          }
        }
      }
    case .red:
      switch adjustment {
      case .brighter:
        return .init { trait in
          switch trait.userInterfaceStyle {
          case .unspecified, .light:
            return #colorLiteral(red: 0.9634733796, green: 0.2921641469, blue: 0.3722535968, alpha: 1)
          case .dark:
            return #colorLiteral(red: 1, green: 0.4512995481, blue: 0.5215890408, alpha: 1)
          }
        }
      case .normal:
        return .init { trait in
          switch trait.userInterfaceStyle {
          case .unspecified, .light:
            return #colorLiteral(red: 0.9446734786, green: 0.02091667615, blue: 0.2149888873, alpha: 1)
          case .dark:
            return #colorLiteral(red: 1, green: 0.3079420328, blue: 0.4044743776, alpha: 1)
          }
        }
      case .darker:
        return .init { trait in
          switch trait.userInterfaceStyle {
          case .unspecified, .light:
            return #colorLiteral(red: 0.7572904229, green: 0.03443894908, blue: 0.1710696518, alpha: 1)
          case .dark:
            return #colorLiteral(red: 0.8668155074, green: 0.2476539612, blue: 0.3220618069, alpha: 1)
          }
        }
      }
    case .pink:
      switch adjustment {
      case .brighter:
        return .init { trait in
          switch trait.userInterfaceStyle {
          case .unspecified, .light:
            return #colorLiteral(red: 1, green: 0.4046760798, blue: 0.6440261006, alpha: 1)
          case .dark:
            return #colorLiteral(red: 1, green: 0.4046760798, blue: 0.6440261006, alpha: 1)
          }
        }
      case .normal:
        return .init { trait in
          switch trait.userInterfaceStyle {
          case .unspecified, .light:
            return #colorLiteral(red: 0.9954770207, green: 0.2453333437, blue: 0.5606600642, alpha: 1)
          case .dark:
            return #colorLiteral(red: 0.9954770207, green: 0.2453333437, blue: 0.5606600642, alpha: 1)
          }
        }
      case .darker:
        return .init { trait in
          switch trait.userInterfaceStyle {
          case .unspecified, .light:
            return #colorLiteral(red: 0.7960380912, green: 0.1982094944, blue: 0.4504026771, alpha: 1)
          case .dark:
            return #colorLiteral(red: 0.7960380912, green: 0.1982094944, blue: 0.4504026771, alpha: 1)
          }
        }
      }
    case .purple:
      switch adjustment {
      case .brighter:
        return .init { trait in
          switch trait.userInterfaceStyle {
          case .unspecified, .light:
            return #colorLiteral(red: 0.8450264931, green: 0.3895671368, blue: 0.7961060405, alpha: 1)
          case .dark:
            return #colorLiteral(red: 0.8450264931, green: 0.3895671368, blue: 0.7961060405, alpha: 1)
          }
        }
      case .normal:
        return .init { trait in
          switch trait.userInterfaceStyle {
          case .unspecified, .light:
            return #colorLiteral(red: 0.7987956405, green: 0.2335719764, blue: 0.7470017076, alpha: 1)
          case .dark:
            return #colorLiteral(red: 0.7987956405, green: 0.2335719764, blue: 0.7470017076, alpha: 1)
          }
        }
      case .darker:
        return .init { trait in
          switch trait.userInterfaceStyle {
          case .unspecified, .light:
            return #colorLiteral(red: 0.6377190351, green: 0.1891725361, blue: 0.5977720022, alpha: 1)
          case .dark:
            return #colorLiteral(red: 0.6377190351, green: 0.1891725361, blue: 0.5977720022, alpha: 1)
          }
        }
      }
    case .violet:
      switch adjustment {
      case .brighter:
        return .init { trait in
          switch trait.userInterfaceStyle {
          case .unspecified, .light:
            return #colorLiteral(red: 0.5658091307, green: 0.3677982092, blue: 0.8260279298, alpha: 1)
          case .dark:
            return #colorLiteral(red: 0.6258069873, green: 0.4226864576, blue: 0.8980774283, alpha: 1)
          }
        }
      case .normal:
        return .init { trait in
          switch trait.userInterfaceStyle {
          case .unspecified, .light:
            return #colorLiteral(red: 0.462728858, green: 0.2181451917, blue: 0.7810876966, alpha: 1)
          case .dark:
            return #colorLiteral(red: 0.535259068, green: 0.2855096459, blue: 0.8695072532, alpha: 1)
          }
        }
      case .darker:
        return .init { trait in
          switch trait.userInterfaceStyle {
          case .unspecified, .light:
            return #colorLiteral(red: 0.3705204427, green: 0.1738485992, blue: 0.626742065, alpha: 1)
          case .dark:
            return #colorLiteral(red: 0.4265563488, green: 0.2295261025, blue: 0.6949763298, alpha: 1)
          }
        }
      }
    case .blue:
      switch adjustment {
      case .brighter:
        return .init { trait in
          switch trait.userInterfaceStyle {
          case .unspecified, .light:
            return #colorLiteral(red: 0.4444252551, green: 0.4998110533, blue: 0.9798684716, alpha: 1)
          case .dark:
            return #colorLiteral(red: 0.4444252551, green: 0.4998110533, blue: 0.9798684716, alpha: 1)
          }
        }
      case .normal:
        return .init { trait in
          switch trait.userInterfaceStyle {
          case .unspecified, .light:
            return #colorLiteral(red: 0.3165363073, green: 0.3824217916, blue: 0.9715957046, alpha: 1)
          case .dark:
            return #colorLiteral(red: 0.3165363073, green: 0.3824217916, blue: 0.9715957046, alpha: 1)
          }
        }
      case .darker:
        return .init { trait in
          switch trait.userInterfaceStyle {
          case .unspecified, .light:
            return #colorLiteral(red: 0.2518203855, green: 0.3075935543, blue: 0.7766199112, alpha: 1)
          case .dark:
            return #colorLiteral(red: 0.2518203855, green: 0.3075935543, blue: 0.7766199112, alpha: 1)
          }
        }
      }
    case .cyan:
      switch adjustment {
      case .brighter:
        return .init { trait in
          switch trait.userInterfaceStyle {
          case .unspecified, .light:
            return #colorLiteral(red: 0.3635141253, green: 0.7461239696, blue: 1, alpha: 1)
          case .dark:
            return #colorLiteral(red: 0.5670107603, green: 0.8105652928, blue: 0.9809321761, alpha: 1)
          }
        }
      case .normal:
        return .init { trait in
          switch trait.userInterfaceStyle {
          case .unspecified, .light:
            return #colorLiteral(red: 0.1565201879, green: 0.6843717098, blue: 1, alpha: 1)
          case .dark:
            return #colorLiteral(red: 0.4631884098, green: 0.7645267844, blue: 0.9761237502, alpha: 1)
          }
        }
      case .darker:
        return .init { trait in
          switch trait.userInterfaceStyle {
          case .unspecified, .light:
            return #colorLiteral(red: 0.1318368316, green: 0.5491476655, blue: 0.8137177825, alpha: 1)
          case .dark:
            return #colorLiteral(red: 0.3727782369, green: 0.6100100279, blue: 0.780186832, alpha: 1)
          }
        }
      }
    }

  }

}

#if canImport(SwiftUI)

import SwiftUI

extension Color {

  public static func neon(_ name: UIColor.NeonColorName, _ adjustment: UIColor.NeonColorAdjustment = .normal) -> Color {
    return Color(UIColor.neon(name, adjustment))
  }

}

#endif
