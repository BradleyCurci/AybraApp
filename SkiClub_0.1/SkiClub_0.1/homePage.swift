//
//  homePage.swift
//  SkiClub_0.1
//
//  Created by Bradley J Curci on 12/21/22.
//
//poopfart
import SwiftUI
import GoogleSignIn
import GoogleSignInSwift

struct homePage: View {
//    @AppStorage("emailAddress") var emailAddress: String = ""
    @AppStorage("log_status") var log_status = false
//    @State var items = [Items]()
//    @EnvironmentObject var network: Network
    var body: some View {
        VStack {
            Text("Home Page!!")
            Button("Log Out") {
                GIDSignIn.sharedInstance.signOut()
                
                withAnimation {
                    log_status = false
                }
            }
        }
    }
}


struct homePage_Previews: PreviewProvider {
    static var previews: some View {
        homePage()
            .environmentObject(Network())
    }
}
