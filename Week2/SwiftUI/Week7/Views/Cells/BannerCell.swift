//
//  BannerCell.swift
//  Week2
//
//  Created by 김승원 on 12/9/24.
//

import SwiftUI

struct BannerCell: View {
    
    // MARK: - Properties
    
    var banner: Banner
    
    // MARK: - Hierarchy
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            stateText
            titleText
            subTitleText
            image
        }
    }
    
    // MARK: - UI Components
    
    private var stateText: some View {
        Text(banner.bannerState.rawValue)
            .font(.system(size: 12, weight: .bold))
            .foregroundStyle(Color(hex: "007BFF"))
    }
    
    private var titleText: some View {
        Text(banner.title)
            .font(.system(size: 20, weight: .medium))
            .foregroundStyle(Color(hex: "000000"))
    }
    
    private var subTitleText: some View {
        Text(banner.subTitle)
            .font(.system(size: 18))
            .foregroundStyle(Color(hex: "A5A5A5"))
            .padding(.top, 3)
    }
    
    private var image: some View {
        banner.image
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: UIScreen.main.bounds.width - 40, height: 225)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .padding(.top, 10)
    }
    

}

//#Preview {
//    BannerCell()
//}
