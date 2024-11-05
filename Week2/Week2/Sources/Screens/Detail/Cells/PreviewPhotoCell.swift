//
//  PreviewPhotoCell.swift
//  Week2
//
//  Created by 김승원 on 10/31/24.
//

import UIKit
import SnapKit

class PreviewPhotoCell: UICollectionViewCell {
    // MARK: - UI Components
    private let photoImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = .temp
        iv.contentMode = .scaleAspectFill
        iv.layer.cornerRadius = 15
        iv.layer.borderWidth = 1
        iv.layer.borderColor = UIColor.systemGray5.cgColor
        iv.layer.masksToBounds = true
        return iv
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Set up UI
    private func setupUI() {
        self.contentView.addSubview(photoImageView)
    }
    
    // MARK: - Set up Constraints
    private func setupConstraints() {
        photoImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    // MARK: - Configure
    public func configure(_ previewModel: Preview) {
        self.photoImageView.image = previewModel.previewPhoto
    }
}
