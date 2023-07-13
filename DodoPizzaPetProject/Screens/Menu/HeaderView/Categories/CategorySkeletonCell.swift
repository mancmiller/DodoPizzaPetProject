//
//  CategorySkeletonCell.swift
//  DodoPizzaPetProject
//
//  Created by Muslim on 13.07.2023.
//

import UIKit
import SnapKit

final class CategorySkeletonCell: UICollectionViewCell {
    
    static let reuseID = "CategorySkeletonCell"
    
    // MARK: - Private Property
    private let titleLayer = CAGradientLayer()
    private let titleLabel: UILabel = {
        let label = UILabel()
        return label
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
        
        titleLayer.frame = titleLabel.bounds
        titleLayer.cornerRadius = titleLabel.bounds.height / 2
    }
}

// MARK: - Setup Constraints
extension CategorySkeletonCell {
    private func setupConstraints() {
        addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8))
        }
    }
}

// MARK: - Skeleton Loadable
extension CategorySkeletonCell: SkeletonLoadable {
    private func setupSkeleton() {
        titleLayer.startPoint = CGPoint(x: 0, y: 0.5)
        titleLayer.endPoint = CGPoint(x: 1, y: 0.5)
        titleLabel.layer.addSublayer(titleLayer)
        
        let titleGroup = makeAnimationGroup()
        titleGroup.beginTime = 0.0
        titleLayer.add(titleGroup, forKey: "backgroundColor")
    }
}
