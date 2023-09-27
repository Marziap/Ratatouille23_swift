//
//  QRCodeView.swift
//  Ratatuille23
//
//  Created by Marzia Pirozzi on 26/09/23.
//

import SwiftUI
import CoreImage
import CoreImage.CIFilterBuiltins
//import SwiftUIstruct

struct QRCodeView: View {
    
    @State private var text = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField("Inserisci il link del sito", text: $text)
                    //.textFieldStyle(.roundedBorder)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 30)
                    .font(Font.custom("Roboto", size: 25))
                
                
                Image(uiImage: UIImage(data: generateQR(text: text)!)!)
                    .resizable()
                    .frame(width: 200, height: 200)
                
                Button(action: {}, label: {
                    Text("Conferma")
                        .padding()
                        .font(Font.custom("Roboto", size: 25))
                        .fontWeight(.medium)
                })
                .background(.myPink)
                .cornerRadius(100)
                .foregroundColor(.accent)
                .padding()
            }
            .navigationTitle("")
        }
    }
    
    func generateQR(text: String) -> Data? {
        let filter = CIFilter.qrCodeGenerator()
        guard let data = text.data(using: .ascii, allowLossyConversion: false) else { return nil }
        filter.message = data
        guard let ciimage = filter.outputImage else { return nil }
        let transform = CGAffineTransform(scaleX: 10, y: 10)
        let scaledCIImage = ciimage.transformed(by: transform)
        let uiimage = UIImage(ciImage: scaledCIImage)
        return uiimage.pngData()!
    }
}

#Preview {
    QRCodeView()
}
