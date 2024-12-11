//
//  PreviewView.swift
//  Week2
//
//  Created by 김승원 on 12/12/24.
//

import SwiftUI

struct PreviewView: View {
    
    // MARK: - Hierarchy
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            title
            previewImage
        }
    }
    
    // MARK: - UI Components
    
    private var title: some View {
        Text("미리보기")
            .font(.system(size: 20, weight: .semibold))
            .foregroundStyle(Color(hex: "000000"))
            .padding(.horizontal, 20)
    }
    
    private var previewImage: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 10) {
                Image(.firstPreview)
                    .resizable()
                    .frame(width: 213, height: 480)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .aspectRatio(contentMode: .fit)
                    .overlay {
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color(hex: "A5A5A5"), lineWidth: 1)
                    }
                
                Image(.secondPreview)
                    .resizable()
                    .frame(width: 213, height: 480)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .overlay {
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color(hex: "A5A5A5"), lineWidth: 1)
                    }
            }
            .padding(.horizontal, 20)
        }
        .scrollIndicators(.hidden)
    }
}

#Preview {
    PreviewView()
}
