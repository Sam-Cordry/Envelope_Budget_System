import SwiftUI

class GlobalInformation: ObservableObject {
    @Published var hasLoggedIn: Bool = false
    @Published var accountsList: [GeneralInformation] = [accountExample]
    @Published var warningMessage: String = "This message has not been changed"
    
    static let accountExample = GeneralInformation(childEnvelopes: [envelopeExample], accountNumber: "0", accountType: "Savings", name: "Example Account")
    static let envelopeExample = GeneralInformation(name: "Example Envelope")
    
    func addAccount(name: String, number: String, type: String, amount: String = "0") {
        let newAccount: GeneralInformation = GeneralInformation(childEnvelopes: [], accountNumber: number, accountType: type, name: name, amount: amount)
        accountsList.append(newAccount)
        if accountsList[0].id == GlobalInformation.accountExample.id {
            accountsList.removeFirst()
        }
        warningMessage = "This message has been changed"
    }
    
    func addEnvelope(parentId: UUID, name: String, amount: String = "0") {
        let newEnvelope: GeneralInformation = GeneralInformation(name: name, amount: amount)
        for var account in accountsList {
            
            if account.id == parentId {
                account.childEnvelopes?.append(newEnvelope)
                warningMessage = "This message has been changed\n\(account.childEnvelopes?.count ?? 0)"
            }
        }
        accountsList.append(GlobalInformation.accountExample)
    }
}

struct GeneralInformation: Identifiable, Hashable {
    let id: UUID = UUID()
    var childEnvelopes: [GeneralInformation]?
    var accountNumber: String = ""
    var accountType: String = ""
    var name: String
    var amount: String = "0"
}
