import SwiftUI

struct AddView: View {
    @EnvironmentObject var info: GlobalInformation
    @State private var toAdd: String = "Select..."
    @State private var accountNumber: String = ""
    @State private var accountType: String = "Select..."
    @State private var nameToAdd: String = ""
    @State private var parentAccount: GeneralInformation = GeneralInformation(name: "Placeholder")
    
    let addTypes: [String] = ["Select...", "Account", "Envelope"]
    let accountTypes: [String] = ["Select...", "Savings", "Checking"]
    
    var body: some View {
        VStack {
            Form {
                TextField("Name:", text: $nameToAdd)
                Picker("Add Account or Envelope?", selection: $toAdd) {
                    ForEach(addTypes, id: \.self) {
                        Text($0)
                    }
                }
                
                if toAdd == "Account" {
                    TextField("Enter account number: ", text: $accountNumber)
                    Picker("Account Type", selection: $accountType) {
                        ForEach(accountTypes, id: \.self) {
                            Text($0)
                        }
                    }
                } else if toAdd == "Envelope" {
                    Picker("Under What Account?", selection: $parentAccount) {
                        ForEach(info.accountsList, id: \.self) { account in
                            Text(account.name)
                        }
                    }
                }
            }
            .padding()
            
            HStack {
                Button("Submit") {
                    onSubmit()
                }
            }
            
            Text(info.warningMessage)
        }
    }
    
    func onSubmit() {
        if toAdd == "Account" {
            info.addAccount(name: nameToAdd, number: accountNumber, type: accountType)
        } else if toAdd == "Envelope" {
            info.addEnvelope(parentId: parentAccount.id, name: nameToAdd)
        }
        
        clearAddFields()
    }
    
    func clearAddFields() {
        toAdd = "Select..."
        accountNumber = ""
        accountType = "Select..."
        nameToAdd = ""
        parentAccount = GeneralInformation(name: "Placeholder")
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView().environmentObject(GlobalInformation())
    }
}
