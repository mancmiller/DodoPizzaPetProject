//
//  BannerSkeletonCell.swift
//  DodoPizzaPetProject
//
//  Created by Muslim on 13.07.2023.
//

import UIKit
import SnapKit

final class BannerSkeletonCell: UICollectionViewCell {
    
    static let reuseID = "BannerSkeletonCell"
    
    // MARK: - Private Property
    private let imageLayer = CAGradientLayer()
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        return imageView
    }()

    // MARK: - Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSkeleton()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageLayer.frame = imageView.bounds
        imageLayer.cornerRadius = imageView.bounds.height / 8
    }
}

// MARK: - Setup Constraints
extension BannerSkeletonCell {
    private func setupConstraints() {
        addSubview(imageView)
        
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

//MARK: - Skeleton Loadable
extension BannerSkeletonCell: SkeletonLoadable {
    private func setupSkeleton() {
        imageLayer.startPoint = CGPoint(x: 0, y: 0.5)
        imageLayer.endPoint = CGPoint(x: 1, y: 0.5)
        imageView.layer.addSublayer(imageLayer)
        
        let imageGroup = makeAnimationGroup()
        imageGroup.beginTime = 0.0
        imageLayer.add(imageGroup, forKey: "backgroundColor")
    }
}
