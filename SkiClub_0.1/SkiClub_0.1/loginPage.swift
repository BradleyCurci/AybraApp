//
//  loginPage.swift
//  SkiClub_0.1
//
//  Created by Bradley J Curci on 12/21/22.
//

import SwiftUI
import GoogleSignIn
import GoogleSignInSwift

struct loginPage: View {
    
    @AppStorage("emailAddress") var emailAddress: String = ""
    
    @State var isLoading: Bool = false
    
    @AppStorage("log_status") var log_status = false
    
    var body: some View {
        VStack {
            (Text("Welcome,")
                .foregroundColor(.black)
                .fontWeight(.bold) +
             Text("\nLogin to continue!")
                .foregroundColor(.white)
            )
            .font(.title)
            .fontWeight(.medium)
            .kerning(1.1)
            .lineSpacing(10)
            .padding(.top, 50)
            .padding(.trailing, 15)
            .padding(.bottom, 30)
            .frame(maxHeight: .infinity, alignment: .top)
            .background (
                Circle()
                    .fill(Color(.blue).opacity(0.3))
                    .scaleEffect(3, anchor: .bottom)
                    .offset(y: -90)
            )
            
            Button (action: handleSignInButton){
                HStack {
                    Image("Google")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 25, height: 25)
                        .frame(height: 45)
                    Text("Login With Google")
                        .font(.title3)
                        .fontWeight(.medium)
                        .kerning(1.1)
                        .foregroundColor(.black)
                    
                }
                .padding(.horizontal,45)
                .padding(.vertical)
                .background {
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .fill(.blue.opacity(0.1))
                }
                .frame(maxWidth: .infinity, alignment: .bottom)
                
            }
            
            Text("Please sign in with the same email that was used to sign up.")
                .font(.subheadline)
                .fontWeight(.medium)
                .padding(.bottom, 25)
                .padding(.horizontal, 25)
                .multilineTextAlignment(.center)
            
        }
        .overlay(
            ZStack {
                if isLoading {
                    Color.black
                        .opacity(0.25)
                        .ignoresSafeArea()
                    
                    ProgressView()
                        .font(.title2)
                        .frame(width: 60, height: 60)
                        .background(Color.white)
                        .cornerRadius(10)
                }
            }
        )
    }
    
    func handleSignInButton() {
        isLoading = true
        GIDSignIn.sharedInstance.signIn(withPresenting: UIApplication.shared.rootController()) { signInResult, error in
            guard error == nil else {
                isLoading = false
                return
            }
            guard let signInResult = signInResult else { return }
            
            let user = signInResult.user
            
            
            emailAddress = user.profile!.email
            
            print("Success || \(emailAddress)")
            
            isLoading = false
            
            withAnimation {
                log_status = true
            }
        }
    }
}

struct loginPage_Previews: PreviewProvider {
    static var previews: some View {
        loginPage()
    }
}

extension UIApplication {
    func rootController() -> UIViewController {
        guard let window = connectedScenes.first as? UIWindowScene else { return .init() }
        guard let viewcontroller = window.windows.last?.rootViewController else { return .init() }

        return viewcontroller
    }
}
