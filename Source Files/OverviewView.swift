import SwiftUI

struct OverviewView: View {
    @EnvironmentObject var info: GlobalInformation
    @State private var addAlertShowing: Bool = false
    @State private var addingAccount: Bool = false
    @State private var infoToAdd: GeneralInformation = GeneralInformation(name: "")
    @State private var typeToAdd: String = "Account"
    
    private let typesToAdd = ["Account", "Envelope"]
    
    var body: some View {
        VStack {
            NavigationView {
                List(info.accountsList, children: \.childEnvelopes) { account in
                    Text(account.name)
                    Spacer()
                    Text(Int(account.amount) ?? 0, format: .currency(code: "USD"))
                    Spacer()
                    NavigationLink(destination: DetailView(toDisplay: account)) {
                        Image(systemName: "ellipsis.circle")
                    }
                }
            }
        }
    }
}

struct OverviewView_Previews: PreviewProvider {
    static var previews: some View {
        OverviewView().environmentObject(GlobalInformation())
    }
}
