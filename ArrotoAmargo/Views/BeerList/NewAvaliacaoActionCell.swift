import SwiftUI

struct NewAvaliacaoActionCell: View {

    var body: some View {
        HStack {
            Image(systemName: "rosette")
            Text("Avaliação")
        }
    }

}

struct NewAvaliacaoActionCell_Previews: PreviewProvider {

    static var previews: some View {
        NewAvaliacaoActionCell()
    }

}
