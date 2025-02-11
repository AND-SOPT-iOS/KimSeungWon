//
//  NewsView.swift
//  Week2
//
//  Created by 김승원 on 12/12/24.
//

import SwiftUI

struct NewsView: View {
    
    // MARK: - Hierarchy
    
    var body: some View {
        VStack(spacing: 14) {
            titleWithChevron
            version
            aboutVersionText
        }
        .padding(.horizontal, 20)
    }
    
    // MARK: - UI Components
    
    private var titleWithChevron: some View {
        HStack(alignment:.center, spacing: 5) {
            Text("새로운 소식")
                .font(.system(size: 20, weight: .semibold))
                .foregroundStyle(Color(hex: "000000"))
            
            Image(systemName: "chevron.right")
                .font(.system(size: 16, weight: .medium))
                .foregroundStyle(Color(hex: "737373"))
            
            Spacer()
        }
    }
    
    private var version: some View {
        HStack(spacing: 0) {
            Text("버전 5.184.0")
                .font(.system(size: 13, weight: .regular))
                .foregroundStyle(Color(hex: "A5A5A5"))
            
            Spacer()
            
            Text("2일전")
                .font(.system(size: 13, weight: .regular))
                .foregroundStyle(Color(hex: "A5A5A5"))
        }
    }
    
    private var aboutVersionText: some View {
        Text("• 구석구석 숨어있던 버그들을 잡았어요. 또 다른 버그가 나타나면 AND SOPT 위아요를 찾아주세요. 늘 열려있답니다. 365일 24시간 언제든지요. 안녕하세요 저는 김승원입니다. 아 그러시구나")
            .font(.system(size: 13, weight: .regular))
            .foregroundStyle(Color(hex: "000000"))
            .lineSpacing(5)
    }
}

#Preview {
    NewsView()
}
