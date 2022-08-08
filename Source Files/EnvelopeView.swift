import SwiftUI

struct EnvelopeView: View {
    @EnvironmentObject var info: GlobalInformation
    
    var body: some View {
        Text("Hello World")
    }
}

struct EnvelopeView_Previews: PreviewProvider {
    static var previews: some View {
        EnvelopeView().environmentObject(GlobalInformation())
    }
}
