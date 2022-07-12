import SwiftUI

struct Preview: View {

  let fragments: [Generator.Fragment]

  init() {

    let list = """
      3C49D6
      
      4656FC
      
      5F9FD9
      
      70BBFF
      
      7581FD
      
      8857D9
      
      94CCFF
      
      A066FF
      
      B88DFF
      
      B943B5
      
      CB414C
      
      D06529
      
      D33C79
      
      D94FD5
      
      E37CE0
      
      EF4C59
      
      F37A83
      
      F57730
      
      F8478E
      
      F89A65
      
      FA76AB
      """

    fragments = Generator.gen(list: list)
  }

  var body: some View {
    VStack {
      ForEach(fragments) { fragment in
        HStack {
          fragment.swiftUIColor
            .frame(width: 20, height: 20)
          Text(fragment.name)
          Text(fragment.color.colorSpace.description)
          Spacer()
        }

      }
    }
  }
}

struct Preview_Previews: PreviewProvider {
  static var previews: some View {
    Preview()
  }
}
