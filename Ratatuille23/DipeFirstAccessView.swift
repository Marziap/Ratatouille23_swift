//
//  DipeFirstAccessView.swift
//  Ratatuille23
//
//  Created by Marzia Pirozzi on 28/09/23.
//

import SwiftUI

struct DipeFirstAccessView: View {
    @State private var username=""
    @State private var oldPassword=""
    @State private var newPassword=""
    @State private var isDone=false
    
    var body: some View {
        Text("Cambia password")
            .font(Font.custom("Roboto", size: 45))
            .foregroundColor(.black)
            .padding(.bottom, 30)
        
        TextField("Tuo username", text: $username)
            .multilineTextAlignment(.center)
            .padding()
            .font(Font.custom("Roboto", size: 25))
            .fontWeight(.medium)
        /*SecureField("Vecchia password", text: $oldPassword)
            .multilineTextAlignment(.center)
            .padding()
            .font(Font.custom("Roboto", size: 25))
            .fontWeight(.medium)*/
        SecureField("Nuova password", text: $newPassword)
            .multilineTextAlignment(.center)
            .padding()
            .font(Font.custom("Roboto", size: 25))
            .fontWeight(.medium)
        Text("La nuova password varrà\ndal prossimo accesso")
            .multilineTextAlignment(.center)
            .font(Font.custom("Roboto", size: 20))
            .foregroundColor(.black)
            .padding(.top, 20)
        
        Button {
            Task {
                do {
                    var employee: Employee = datas.dipendenti[0]
                    employee.password=newPassword
                    employee.firstaccess=false
                    serverAPI.updateEmployee(employee: employee)
                    datas.dipendenti[0]=employee
                    isDone=true
                    
                } catch {
                    print("Error: \(error)")
                }
            }
        } label: {
            Text("Aggiorna")
                .padding()
                .font(Font.custom("Roboto", size: 25))
                .fontWeight(.medium)
        }
        .background(Color(red: 0.65, green: 0.06, blue: 0.06))
        .cornerRadius(100)
        .foregroundColor(.white)
        .padding()
        
        
        .navigationDestination(
             isPresented: $isDone) {
                  DipeLoginView()
             }
        
    }
}

#Preview {
    DipeFirstAccessView()
}
