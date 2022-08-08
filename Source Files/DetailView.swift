import SwiftUI

struct DetailView: View {
    var toDisplay: GeneralInformation
    @EnvironmentObject var info: GlobalInformation
    
    var body: some View {
        Text(toDisplay.name)
        Text(Int(toDisplay.amount) ?? 0, format: .currency(code: "USD"))
        Text(String(toDisplay.childEnvelopes?.count ?? 0))
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(toDisplay: GeneralInformation(name: "Example")).environmentObject(GlobalInformation())
    }
}
