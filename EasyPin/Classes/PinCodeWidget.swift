//
//  PinCodeWidget.swift
//  Swiftui_Example
//
//  Created by Fahad Shafiq on 01/03/2023.
//

import Foundation
import SwiftUI

public class PinCodeWidget {
    public init() {}
    
    public init(keyHeight: CGFloat, keyBgColor: Color, keyTextColor: Color, keyFont: Font) {
        self.keyHeight = keyHeight
        self.keyBgColor = keyBgColor
        self.keyTextColor = keyTextColor
        self.keyFont = keyFont
    }
        
    private var keyHeight: CGFloat = 56
    private var keyBgColor: Color = .clear
    private var keyTextColor: Color = .white
    private var keyFont: Font = .system(size: 48)
    
    
    public func addPinCode(limit: Int, text: String, spacing: CGFloat = 10, fillColor: Color, borderColor: Color, height: CGFloat, width: CGFloat, cornerRadius: CGFloat) -> some View {
        
        return HStack(spacing: spacing) {
            ForEach(0..<limit, id: \.self) { item in
                RoundedRectangle(cornerRadius: cornerRadius)
                    .frame(width: width, height: height)
                    .foregroundColor(text.count > item ? fillColor : Color.clear)
                    .cornerRadius(cornerRadius)
                    .overlay(RoundedRectangle(cornerRadius: cornerRadius).stroke(borderColor))
            }
        }
    }
    
    public func drawKeypad(pinCode: Binding<String>, backSpaceImg: Image, limit: Int) -> some View {
        VStack(spacing: 50) {
            HStack(spacing: 10) {
                ForEach(1...3, id: \.self) { item in
                    self.keyboardButton(action: {
                        self.pinEntered(pin: pinCode, limit: limit, action: "\(item)")
                    }, text: "\(item)")
                }
            }
            
            HStack(spacing: 10) {
                ForEach(4...6, id: \.self) { item in
                    self.keyboardButton(action: {
                        self.pinEntered(pin: pinCode, limit: limit, action: "\(item)")
                    }, text: "\(item)")
                }
            }
            
            HStack(spacing: 10) {
                ForEach(7...9, id: \.self) { item in
                    self.keyboardButton(action: {
                        self.pinEntered(pin: pinCode, limit: limit, action: "\(item)")
                    }, text: "\(item)")
                }
            }
            
            HStack(spacing: 10) {
                keyboardButton(action: {
                }, text: "")
                
                keyboardButton(action: {
                    self.pinEntered(pin: pinCode, limit: limit, action: "0")
                }, text: "0")
                
                Button {
                    if pinCode.wrappedValue == "" { return }
                    pinCode.wrappedValue = String(pinCode.wrappedValue.dropLast(1))
                } label: {
                    backSpaceImg
                        .frame(height: keyHeight)
                        .frame(maxWidth: .infinity)
                        .background(keyBgColor)
                        .foregroundColor(keyTextColor)
                }
            }
        }
    }
    
    private func pinEntered(pin: Binding<String>, limit: Int, action: String) {
        if pin.wrappedValue.count >= limit {
            return
        }
        pin.wrappedValue = pin.wrappedValue + action
    }
    
    private func keyboardButton(action: @escaping () -> Void, text: String) -> some View {
        Button(action: action) {
            Text(text)
                .frame(height: keyHeight)
                .frame(maxWidth: .infinity)
                .font(keyFont)
                .background(keyBgColor)
                .foregroundColor(keyTextColor)
        }
    }
    
    public class var shared: PinCodeWidget {
        struct Static {
            //Singleton instance. Initializing keyboard manger.
            static let kbManager = PinCodeWidget()
        }
        
        /** @return Returns the default singleton instance. */
        return Static.kbManager
    }
}
