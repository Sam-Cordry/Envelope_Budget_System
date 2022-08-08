import SwiftUI

struct LoginView: View {
    @State private var username: String = ""
    @FocusState private var usernameFieldIsFocused
    
    @State private var password: String = ""
    @FocusState private var passwordFieldIsFocused
    
    @EnvironmentObject var info: GlobalInformation
    
    var body: some View {
        Group {
            Text("Envelope Budget System")
                .padding(.bottom, 30)
        
            Text("Made by Sam Cordry")
                .padding(.bottom, 30)
        
            Form {
                TextField("Username", text: $username, prompt: Text("Required"))
            
                SecureField("Password", text: $password, prompt: Text("Required"))
            }
            .padding([.trailing, .leading], 120)
            
            HStack {
                Spacer()
                Button(action: {
                    if(username.lowercased().trimmingCharacters(in: .whitespacesAndNewlines) == "root" && password.lowercased().trimmingCharacters(in: .whitespacesAndNewlines) == "toor") {
                        info.hasLoggedIn = true
                    }
                }) {
                    Text("Login")
                }
                .keyboardShortcut(.defaultAction)
                Spacer()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView().environmentObject(GlobalInformation())
    }
}
