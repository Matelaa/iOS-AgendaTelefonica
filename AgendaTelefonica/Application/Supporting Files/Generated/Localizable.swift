// Generated using SwiftGen, by O.Halligon — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// swiftlint:disable explicit_type_interface identifier_name line_length nesting type_body_length type_name
internal enum L10n {

  internal enum App {
    /// Agenda
    internal static let title = L10n.tr("Localizable", "app.title")
  }

  internal enum Contatos {
    /// Edicão Desabilitada
    internal static let ativaredicao = L10n.tr("Localizable", "contatos.ativaredicao")
    /// Confirmar Edicão
    internal static let confirmar = L10n.tr("Localizable", "contatos.confirmar")
    /// Criar
    internal static let criar = L10n.tr("Localizable", "contatos.criar")
    /// Deslogar
    internal static let deslogar = L10n.tr("Localizable", "contatos.deslogar")
    /// Editar
    internal static let editar = L10n.tr("Localizable", "contatos.editar")
    /// Email
    internal static let email = L10n.tr("Localizable", "contatos.email")
    /// Excluir
    internal static let excluir = L10n.tr("Localizable", "contatos.excluir")
    /// Nome
    internal static let nome = L10n.tr("Localizable", "contatos.nome")
    /// Novo Contato
    internal static let novocontato = L10n.tr("Localizable", "contatos.novocontato")
    /// Telefone
    internal static let telefone = L10n.tr("Localizable", "contatos.telefone")
    /// Contatos
    internal static let title = L10n.tr("Localizable", "contatos.title")
    /// URL Imagem
    internal static let urlimagem = L10n.tr("Localizable", "contatos.urlimagem")
  }

  internal enum Login {
    /// Cadastrar
    internal static let cadastrar = L10n.tr("Localizable", "login.cadastrar")
    /// Email
    internal static let email = L10n.tr("Localizable", "login.email")
    /// Entrar
    internal static let entrar = L10n.tr("Localizable", "login.entrar")
    /// Senha
    internal static let senha = L10n.tr("Localizable", "login.senha")

    internal enum Cadastrar {
      /// Confirmar Senha
      internal static let confirmarsenha = L10n.tr("Localizable", "login.cadastrar.confirmarsenha")
      /// E-Mail
      internal static let email = L10n.tr("Localizable", "login.cadastrar.email")
      /// Senha
      internal static let senha = L10n.tr("Localizable", "login.cadastrar.senha")
    }
  }
}
// swiftlint:enable explicit_type_interface identifier_name line_length nesting type_body_length type_name

extension L10n {
  fileprivate static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = NSLocalizedString(key, tableName: table, bundle: Bundle(for: BundleToken.self), comment: "")
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

private final class BundleToken {}
