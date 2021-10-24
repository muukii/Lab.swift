//
//  Run.swift
//  SyntaxBuilder
//
//  Created by Muukii on 2021/10/24.
//

import Foundation
import SwiftSyntax
import SwiftSyntaxBuilder

enum Playground {

  static func run() {

    final class EasyPeasyLayout: SyntaxRewriter {

      override func visit(_ token: TokenSyntax) -> Syntax {
        print(token)
        return super.visit(token)
      }

    }

    final class Parser: SyntaxRewriter {

      override func visit(_ node: FunctionCallExprSyntax) -> ExprSyntax {
//        print(node.calledExpression)
        if let a = node.calledExpression.as(MemberAccessExprSyntax.self) {

          let expression = a.tokens
            .map { $0.text }
            .joined(separator: "")

          if expression.hasSuffix("easy.layout") {
            let modified = EasyPeasyLayout().visit(a)
            return .init(modified)
//            return super.visit(.init(modified))
          }

        }

        return super.visit(node)
      }

      override func visit(_ node: FunctionDeclSyntax) -> DeclSyntax {
//        let a = node.withIdentifier(SyntaxFactory.makeIdentifier("_\(node.identifier)"))
        return super.visit(node)
      }
    }

    let source =
"""
func run() {
 topToBottomGradientView.easy.layout(
   Top().to(scrollView, .top),
   Left().to(scrollView, .left),
   Right(indicatorInset).to(scrollView, .right),
   Height(4.bk)
  )
}
"""

    let parsed = try! SyntaxParser.parse(source: source)

    //let file = CommandLine.arguments[1]
    //let url = URL(fileURLWithPath: file)

    let result = Parser().visit(parsed)

    print(result)

  }

}
