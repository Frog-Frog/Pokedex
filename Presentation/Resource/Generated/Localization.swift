// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name
internal enum L10n {

  internal enum PokemonDetail {
    internal enum Information {
      /// Ability 1
      internal static let firstAbility = L10n.tr("Localizable", "pokemon_detail.information.first_ability")
      /// Height
      internal static let height = L10n.tr("Localizable", "pokemon_detail.information.height")
      /// Hidden Ability
      internal static let hiddenAbility = L10n.tr("Localizable", "pokemon_detail.information.hidden_ability")
      /// %1fkg
      internal static func kilogram(_ p1: Float) -> String {
        return L10n.tr("Localizable", "pokemon_detail.information.kilogram", p1)
      }
      /// %1fm
      internal static func meter(_ p1: Float) -> String {
        return L10n.tr("Localizable", "pokemon_detail.information.meter", p1)
      }
      /// None
      internal static let `none` = L10n.tr("Localizable", "pokemon_detail.information.none")
      /// Ability 2
      internal static let secondAbility = L10n.tr("Localizable", "pokemon_detail.information.second_ability")
      /// Type
      internal static let type = L10n.tr("Localizable", "pokemon_detail.information.type")
      /// Weight
      internal static let weight = L10n.tr("Localizable", "pokemon_detail.information.weight")
    }
    internal enum Status {
      /// Attack
      internal static let attack = L10n.tr("Localizable", "pokemon_detail.status.attack")
      /// Defense
      internal static let defense = L10n.tr("Localizable", "pokemon_detail.status.defense")
      /// HP
      internal static let hitpoint = L10n.tr("Localizable", "pokemon_detail.status.hitpoint")
      /// SP.Atk
      internal static let specialAttack = L10n.tr("Localizable", "pokemon_detail.status.special_attack")
      /// SP.Def
      internal static let specialDefense = L10n.tr("Localizable", "pokemon_detail.status.special_defense")
      /// Speed
      internal static let speed = L10n.tr("Localizable", "pokemon_detail.status.speed")
    }
  }

  internal enum Tab {
    /// Item
    internal static let item = L10n.tr("Localizable", "tab.item")
    /// Pokémon
    internal static let pokemon = L10n.tr("Localizable", "tab.pokemon")
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    // swiftlint:disable:next nslocalizedstring_key
    let format = NSLocalizedString(key, tableName: table, bundle: Bundle(for: BundleToken.self), comment: "")
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

private final class BundleToken {}
