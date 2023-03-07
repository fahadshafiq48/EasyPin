//
//  SetupPinVC.swift
//  Swiftui_Example
//
//  Created by Fahad Shafiq on 01/03/2023.
//

import SwiftUI
import EasyPin

struct SetupPinVC: View {
    @State var moveToNextScreen: Bool = false
    @State var pinCode = ""
    let pinLimit = 4
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.blue.opacity(0.5)
                VStack(spacing: 50) {
                    Spacer(minLength: 20)
                        .frame(maxHeight: 20)
                    
                    Text("Let’s setup your PIN")
                        .font(.system(size: 18))
                        .foregroundColor(.white)
                    
                    PinCodeWidget.shared.addPinCode(limit: pinLimit, text: pinCode, fillColor: Color.white, borderColor: Color.white, height: 40, width: 40, cornerRadius: 20)
                }
                .frame(maxHeight: .infinity, alignment: .top)
                
                NavigationLink(destination: Text("Hi from new screen"), isActive: $moveToNextScreen) { EmptyView() }
                    .isDetailLink(false)
                let keypad = PinCodeWidget(keyHeight: 56, keyBgColor: .clear, keyTextColor: .white, keyFont: .system(size: 48))
                keypad.drawKeypad(pinCode: $pinCode.onUpdate {
                    pinCodeUpdated()
                }, backSpaceImg: Image("clear"), limit: pinLimit)
                .frame(maxHeight: .infinity, alignment: .bottom)
                .padding([.bottom], 16)
            }
            
            .onAppear {
                pinCode = ""
            }
        }
    }
    
    private func pinCodeUpdated() {
        if pinCode.count == pinLimit {
            moveToNextScreen = true
        }
    }
    
}

struct SetupPinVC_Previews: PreviewProvider {
    static var previews: some View {
        SetupPinVC()
    }
}
