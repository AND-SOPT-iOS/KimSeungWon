//
//  PreviewModel.swift
//  Week2
//
//  Created by 김승원 on 10/31/24.
//

import UIKit

struct PreviewModel {
    let previewPhotoImage: UIImage
}


extension PreviewModel {
    static let mockData: [PreviewModel] = [
        PreviewModel(previewPhotoImage: .firstPreview),
        PreviewModel(previewPhotoImage: .secondPreview),
        PreviewModel(previewPhotoImage: .firstPreview),
        PreviewModel(previewPhotoImage: .secondPreview),
        PreviewModel(previewPhotoImage: .firstPreview)
    ]
}
