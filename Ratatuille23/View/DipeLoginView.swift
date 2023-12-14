//
//  DipeLoginView.swift
//  Ratatuille23
//
//  Created by Marzia Pirozzi on 28/09/23.
//

import SwiftUI

struct DipeLoginView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var isLoggedIn = false
    @State private var isFirstAccess = true
    @State private var firstAccess = false
    @State private var notFirstAccess = false
    
    var body: some View {
        NavigationStack {
            VStack {
                    Text("Benvenuto\nDipendente!")
                        .font(Font.custom("Roboto", size: 45))
                        .foregroundColor(.black)
                    
                    TextField("Username", text: $username)
                        .multilineTextAlignment(.center)
                        .padding()
                        .font(Font.custom("Roboto", size: 25))
                        .fontWeight(.medium)
                    SecureField("Password", text: $password)
                        .multilineTextAlignment(.center)
                        .padding()
                        .font(Font.custom("Roboto", size: 25))
                        .fontWeight(.medium)
                    
                Button {
                    Task {
                        do {
                            datas.dipendenti = try await serverAPI.getUserPass(username: username, password: password)
                            if(!datas.dipendenti.isEmpty && datas.dipendenti[0].username==username && datas.dipendenti[0].password == password){
                                isFirstAccess=datas.dipendenti[0].firstaccess ?? false
                                isLoggedIn = true
                                datas.menuItems = try await serverAPI.getMEnuItems(restaurant_id: datas.dipendenti[0].id_ristorante!)
                            }else{
                                isLoggedIn = false
                            }
                            
                            
                            if(isLoggedIn && isFirstAccess){
                                firstAccess=true
                            }else if(isLoggedIn && !isFirstAccess){
                                notFirstAccess=true
                            }
                            
                            print("isLoggedIn: "+String(isLoggedIn))
                            print("isFirstAccess: "+String(isFirstAccess))
                            print("firstAccess: "+String(firstAccess))
                            
                        } catch {
                            // Handle any errors that occur during the asynchronous operation
                            print("Error: \(error)")
                            // Optionally, you can show an alert or update UI to indicate the error
                        }
                    }
                } label: {
                    Text("Accedi")
                        .padding()
                        .font(Font.custom("Roboto", size: 25))
                        .fontWeight(.medium)
                }
                .background(Color(red: 0.65, green: 0.06, blue: 0.06))
                .cornerRadius(100)
                .foregroundColor(.white)
                .padding()
 
                .navigationDestination(
                    isPresented: $firstAccess) {
                    DipeFirstAccessView()
                }
                    .navigationDestination(
                        isPresented: $notFirstAccess) {
                        DipeTabBarLayout()
                    }

                    
            }
        }
                
            }
}

#Preview {
    DipeLoginView()
}
