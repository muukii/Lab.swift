
import SwiftSyntax
import Foundation

class Parser: SyntaxRewriter {

}

let source = """
"""

let parsed = try SyntaxParser.parse(source: source)

//let file = CommandLine.arguments[1]
//let url = URL(fileURLWithPath: file)

let result = Parser().visit(parsed)

print(result)

