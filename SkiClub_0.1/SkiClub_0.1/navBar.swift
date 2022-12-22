//
//  navBar.swift
//  SkiClub_0.1
//
//  Created by Bradley J Curci on 12/21/22.
//

import SwiftUI

struct navBar: View {
    @State var selectedIndex = 0
    
    let tabBarImageNames = ["house",  "checklist.checked", "info", "gear"]
    
    var body: some View {

        
        ZStack {
            VStack {
                
                ZStack {
                    
                    switch selectedIndex {
                    case 0:
                        homePage()
                        
                    case 1:
                        tripInfo()
                        
                    case 2:
                        clubInfo()
                        
                    case 3:
                        settings()
                        
                        
                    default:
                        Text("error")
                    }
                   
                }
                
                HStack(alignment: .bottom){
                    ForEach(0..<4) { num in
                        Button(action: {
                            selectedIndex = num
                        }, label: {
                            Spacer()
                            Image(systemName: tabBarImageNames[num])
                                .font(.system(size: 24, weight: .bold))
                                .foregroundColor(selectedIndex == num ? Color(.black) :
                                        .init(.gray))
                                .frame(maxHeight: .infinity, alignment: .bottom)
                            Spacer()
                            
                
                        })
                    }
                }
            }
        }
    }
}

struct navBar_Previews: PreviewProvider {
    static var previews: some View {
        navBar()
    }
}
