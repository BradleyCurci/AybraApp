//
//  ContentView.swift
//  SkiClub_0.1
//
//  Created by Bradley J Curci on 12/20/22.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("log_status") var log_status = false
    var body: some View {
        if log_status {
            NavigationView {
                homePage()
            }
        } else {
            loginPage()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
