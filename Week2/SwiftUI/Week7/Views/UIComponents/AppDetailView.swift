//
//  AppDetailView.swift
//  Week2
//
//  Created by 김승원 on 12/11/24.
//

import SwiftUI

struct AppDetailView: View {
    
    @State var app: AppStoreApplication
    
    // MARK: - Hierarchy
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 16) {
                appImage
                
                VStack(alignment: .leading, spacing: 0) {
                    titles
                    Spacer()
                    appButton
                }
                
                Spacer()
                shareButton
            }
            .frame(height: 115)
            .padding(.top, 10)
            .padding(.horizontal, 16)
            
            Spacer()
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                app.appIcon
                    .resizable()
                    .frame(width: 30, height: 30)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color(hex: "F4F4F4"), lineWidth: 1)
                    )
            }
        }
    }
    
    // MARK: - UI Components
    
    private var appImage: some View {
        app.appIcon
            .resizable()
            .frame(width: 115, height: 115)
            .clipShape(RoundedRectangle(cornerRadius: 23))
            .overlay(
                RoundedRectangle(cornerRadius: 23)
                    .stroke(Color(hex: "EAEAEA"), lineWidth: 1)
            )
    }
    
    private var titles: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(app.title)
                .font(.system(size: 18, weight: .semibold))
                .foregroundStyle(Color(hex: "000000"))
            
            Text(app.subTitle)
                .font(.system(size: 14, weight: .thin))
                .foregroundStyle(Color(hex: "A5A5A5"))
        }
    }
    
    private var appButton: some View {
        BasicAppButton(appButtonType: app.buttonState)
    }
    
    private var shareButton: some View {
        VStack(spacing: 0) {
            Spacer()
            Image(systemName: "square.and.arrow.up")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 28, height: 28)
                .foregroundStyle(Color(hex: "007BFF"))
        }
    }
    
}


#Preview {
    AppDetailView(app:
                    AppStoreApplication(
                        id: UUID(),
                        appIcon: Image(.toss),
                        title: "현대카드",
                        subTitle: "카드 생활을 넘어 자산 관리까지 하나의 앱으로!",
                        buttonState: .download
                    )
    )
}
