//
//  BasicAppButton.swift
//  Week2
//
//  Created by 김승원 on 11/28/24.
//

import SwiftUI

struct BasicAppButton: View {
    var app: AppStoreApplication
    var body: some View {
        Button {
            
        } label: {
            switch app.buttonState {
            case .open:
                buttonText("열기", horizontalPadding: 22)
                
            case .download:
                buttonText("받기", horizontalPadding: 22)
                
            case .update:
                buttonText("업데이트", horizontalPadding: 12)
                
            case .cloud:
                cloudImage()
            }
        }
    }
    
    private func buttonText(_ text: String, horizontalPadding: CGFloat) -> some View {
        Text(text)
            .foregroundStyle(.blue)
            .font(.system(size: 16, weight: .bold))
            .padding(.horizontal, horizontalPadding)
            .padding(.vertical, 6)
            .background(Color(hex: "EEEEF0"))
            .clipShape(RoundedRectangle(cornerRadius: 25))
    }
    
    private func cloudImage() -> some View {
        Image(systemName: "icloud.and.arrow.down")
            .resizable()
            .foregroundStyle(.blue)
            .frame(width: 25, height: 25)
    }
}
