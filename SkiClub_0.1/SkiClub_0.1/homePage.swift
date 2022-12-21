//
//  homePage.swift
//  SkiClub_0.1
//
//  Created by Bradley J Curci on 12/21/22.
//

import SwiftUI
import GoogleSignIn
import GoogleSignInSwift

struct homePage: View {
    @AppStorage("emailAddress") var emailAddress: String = ""
    @AppStorage("log_status") var log_status = false
    @State var items = [Items]()
    @EnvironmentObject var network: Network
    var body: some View {
        
        VStack {
            Button ("SIGN OUT") {
                GIDSignIn.sharedInstance.signOut()
                
                withAnimation {
                    log_status = false
                }
            }

            List(network.items, id: \.id) { item in
                Text(item.field_75)
                Text(item.id)
                Text(item.field_62)
            }
            .task {
                network.loadData()
            }
            .frame(maxWidth: .infinity, alignment: .bottom)
        }
    }
}


struct homePage_Previews: PreviewProvider {
    static var previews: some View {
        homePage()
            .environmentObject(Network())
    }
}
