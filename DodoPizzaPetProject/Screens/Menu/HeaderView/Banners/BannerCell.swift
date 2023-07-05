//
//  BannerCell.swift
//  DodoPizzaPetProject
//
//  Created by Muslim on 03.07.2023.
//

import UIKit
import SnapKit

final class BannerCell: UICollectionViewCell {
    
    static let reuseID = "BannerCell"
    
    // MARK: - Private Properties
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        return imageView
    }()
    
    // MARK: - Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Method
    func configure(string: String) {
        imageView.image = UIImage(named: string)
    }
    
    // MARK: - Setup Constraints
    private func setupConstraints() {
        addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
