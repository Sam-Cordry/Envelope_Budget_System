import SwiftUI

struct FundingView: View {
    @EnvironmentObject var info: GlobalInformation
    
    var body: some View {
        TextField(info.accountsList[0].name, text: $info.accountsList[0].amount)
    }
}

struct FundingView_Previews: PreviewProvider {
    static var previews: some View {
        FundingView().environmentObject(GlobalInformation())
    }
}
