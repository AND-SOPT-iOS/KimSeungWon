//
//  AppInformationView.swift
//  Week2
//
//  Created by 김승원 on 12/11/24.
//

import SwiftUI

struct AppInformationView: View {
    
    // MARK: - Hierarchy
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            horizontalSeparator()
            
            HStack(spacing: 0) {
                rating
                Spacer()
                verticalSeparator()
                Spacer()
                grade
                Spacer()
                verticalSeparator()
                Spacer()
                age
                Spacer()
                verticalSeparator()
                Spacer()
            }
            .padding(.leading, 40)
            
            horizontalSeparator()
        }
    }
    
    // MARK: - UI Components
    
    private func horizontalSeparator() -> some View {
        HStack(spacing: 0) {
            Spacer()
            
            Rectangle()
                .foregroundStyle(Color(hex: "C7C7C7"))
                .frame(width: UIScreen.main.bounds.width - 20, height: 0.4)
        }
    }
    
    private func verticalSeparator() -> some View {
        Rectangle()
            .foregroundStyle(Color(hex: "C7C7C7"))
            .frame(width: 0.4, height: 30)
    }
    
    private var rating: some View {
        VStack(spacing: 7) {
            Text("8.4만개의 평가")
                .font(.system(size: 12, weight: .medium))
                .foregroundStyle(Color(hex: "B1B1B1"))
            
            Text("5.0")
                .font(.system(size: 20, weight: .bold))
                .foregroundStyle(Color(hex: "8E8D92"))
            
            HStack(spacing: 2) {
                ForEach(0..<5) { _ in
                    star
                }
            }
        }
    }
    
    private var grade: some View {
        VStack(spacing: 7) {
            Text("수상")
                .font(.system(size: 12, weight: .medium))
                .foregroundStyle(Color(hex: "B1B1B1"))
            
            Text("에디터의\n선택")
                .font(.system(size: 9, weight: .regular))
                .foregroundStyle(Color(hex: "B1B1B1"))
                .multilineTextAlignment(.center)
            
            Text("앱")
                .font(.system(size: 12, weight: .regular))
                .foregroundStyle(Color(hex: "B1B1B1"))
        }
    }
    
    private var age: some View {
        VStack(spacing: 6) {
            Text("연령")
                .font(.system(size: 12, weight: .medium))
                .foregroundStyle(Color(hex: "B1B1B1"))
            
            Text("4+")
                .font(.system(size: 20, weight: .bold))
                .foregroundStyle(Color(hex: "8E8D92"))
            
            Text("세")
                .font(.system(size: 12, weight: .regular))
                .foregroundStyle(Color(hex: "B1B1B1"))
        }
    }
    
    private var star: some View {
        Image(systemName: "star.fill")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 13)
            .foregroundStyle(Color(hex: "8E8D92"))
    }
    
}

#Preview {
    AppInformationView()
}
