//
//  Run.swift
//  SyntaxBuilder
//
//  Created by Muukii on 2021/10/24.
//

import Foundation
import SwiftSyntax

enum Playground {

  static func run() {

    class Parser: SyntaxRewriter {

    }

    let source = """
"""

    let parsed = try! SyntaxParser.parse(source: source)

    //let file = CommandLine.arguments[1]
    //let url = URL(fileURLWithPath: file)

    let result = Parser().visit(parsed)

    print(result)

  }

}
