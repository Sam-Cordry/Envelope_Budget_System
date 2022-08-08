import SwiftUI

struct MasterView: View {
    @EnvironmentObject var info: GlobalInformation
    
    var body: some View {
        if(info.hasLoggedIn) {
            TabView {
                OverviewView()
                    .tabItem {
                        Label("Overview", systemImage: "house")
                    }
                
                AddView()
                    .tabItem {
                        Label("Adding", systemImage: "plus.circle.fill")
                    }
                
                EnvelopeView()
                    .tabItem {
                        Label("Envelopes", systemImage: "envelope")
                    }
                
                FundingView()
                    .tabItem {
                        Label("Funding", systemImage: "dollarsign.square")
                    }
            }
        } else {
            LoginView()
        }
    }
}

struct MasterView_Previews: PreviewProvider {
    static var previews: some View {
        MasterView().environmentObject(GlobalInformation())
    }
}
