import SwiftUI

struct AmmiLoginView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var isLoggedIn = false
    
    var body: some View {
        NavigationStack {
            VStack {
                    Text("Benvenuto\namministratore!")
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
                            datas.ristorante = try await serverAPI.getRisto(username: username, password: password)
                            if(!datas.ristorante.isEmpty && datas.ristorante[0].username==username && datas.ristorante[0].password == password){
                                isLoggedIn = true
                            }else{
                                isLoggedIn = false
                            }
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
                         isPresented: $isLoggedIn) {
                              TabBarLayout()
                         }
                    
            }
        }
                
            }
    }

#Preview {
    AmmiLoginView()
}
