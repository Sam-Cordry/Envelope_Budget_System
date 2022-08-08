import SwiftUI

@main
struct Envelope_Budget_SystemApp: App {
    @StateObject var info = GlobalInformation()
    
    var body: some Scene {
        WindowGroup {
            MasterView()
                .environmentObject(self.info)
        }
    }
}
