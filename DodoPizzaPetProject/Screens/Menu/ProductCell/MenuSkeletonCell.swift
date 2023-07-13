//
//  MenuSkeletonCell.swift
//  DodoPizzaPetProject
//
//  Created by Muslim on 12.07.2023.
//

import UIKit
import SnapKit

final class MenuSkeletonCell: UITableViewCell {
    
    static let reuseID = "MenuSkeletonCell"
    
    // MARK: - Private Properties
    private let productImageLayer = CAGradientLayer()
    private let productImageView: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    private let productNameLayer = CAGradientLayer()
    private let productNameLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let productDescriptionLayer = CAGradientLayer()
    private let productDescriptionLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let priceLayer = CAGradientLayer()
    private let priceButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    private let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
        stackView.spacing = 5
        return stackView
    }()
    
    // MARK: - Life Cycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSkeleton()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        priceButton.layer.cornerRadius = priceButton.frame.height / 2
        productNameLabel.font = .systemFont(ofSize: 20, weight: .medium)
        productDescriptionLabel.font = .systemFont(ofSize: 16)
        setupLayers()
    }
    
    // MARK: - Private Methods
    private func setupLayers() {
        productImageLayer.frame = productImageView.bounds
        productNameLayer.cornerRadius = productImageView.bounds.height / 2
        
        productNameLayer.frame = productNameLabel.bounds
        productNameLayer.cornerRadius = productNameLabel.bounds.height / 2
        
        productDescriptionLayer.frame = productDescriptionLabel.bounds
        productDescriptionLayer.cornerRadius = productDescriptionLabel.bounds.height / 2
        
        priceLayer.frame = priceButton.bounds
        priceLayer.cornerRadius = priceButton.bounds.height / 2
    }
}

// MARK: - Setup Constraints
extension MenuSkeletonCell {
    
    private struct Appearance {
        static let padding = 16
        static let stackViewLeading = -20
        static let nameLabelHeight = 0.15
        static let nameLabelWidth = 0.3
        static let descriptionLabelHeight = 0.4
        static let descriptionLabelWidth = 0.4
        static let priceButtonHeight = 0.2
        static let priceButtonWidth = 0.3
    }

    private func setupConstraints() {
        contentView.addSubview(productImageView)
        contentView.addSubview(mainStackView)
        mainStackView.addArrangedSubview(productNameLabel)
        mainStackView.addArrangedSubview(productDescriptionLabel)
        mainStackView.addArrangedSubview(priceButton)
        
        productImageView.snp.makeConstraints { make in
            make.height.equalTo(productImageView.snp.width)
            make.leading.top.bottom.equalTo(contentView).inset(Appearance.padding)
        }
        
        mainStackView.snp.makeConstraints { make in
            make.leading.equalTo(productImageView.snp.trailing).inset(Appearance.stackViewLeading)
            make.top.trailing.bottom.equalTo(contentView).inset(Appearance.padding)
        }
        
        productNameLabel.snp.makeConstraints { make in
            make.height.equalTo(mainStackView.snp.height).multipliedBy(Appearance.nameLabelHeight)
            make.width.equalTo(mainStackView.snp.width).multipliedBy(Appearance.nameLabelWidth)
        }
        
        productDescriptionLabel.snp.makeConstraints { make in
            make.height.equalTo(contentView.snp.height).multipliedBy(Appearance.descriptionLabelHeight)
            make.width.equalTo(contentView.snp.width).multipliedBy(Appearance.descriptionLabelWidth)
        }
        
        priceButton.snp.makeConstraints { make in
            make.height.equalTo(mainStackView.snp.height).multipliedBy(Appearance.priceButtonHeight)
            make.width.equalTo(mainStackView.snp.width).multipliedBy(Appearance.priceButtonWidth)
        }
    }
}

// MARK: - SkeletonLoadable
extension MenuSkeletonCell: SkeletonLoadable {
    private func setupSkeleton() {
        productImageLayer.startPoint = CGPoint(x: 0, y: 0.5)
        productImageLayer.endPoint = CGPoint(x: 1, y: 0.5)
        productImageView.layer.addSublayer(productImageLayer)
        
        productNameLayer.startPoint = CGPoint(x: 0, y: 0.5)
        productNameLayer.endPoint = CGPoint(x: 1, y: 0.5)
        productNameLabel.layer.addSublayer(productNameLayer)
        
        productDescriptionLayer.startPoint = CGPoint(x: 0, y: 0.5)
        productDescriptionLayer.endPoint = CGPoint(x: 1, y: 0.5)
        productDescriptionLabel.layer.addSublayer(productDescriptionLayer)
        
        priceLayer.startPoint = CGPoint(x: 0, y: 0.5)
        priceLayer.endPoint = CGPoint(x: 1, y: 0.5)
        priceButton.layer.addSublayer(priceLayer)
        
        let productNameGroup = makeAnimationGroup()
        productNameGroup.beginTime = 0.0
        productNameLayer.add(productNameGroup, forKey: "backgroundColor")

        let productDescriptionGroup = makeAnimationGroup()
        productDescriptionGroup.beginTime = 0.0
        productDescriptionLayer.add(productDescriptionGroup, forKey: "backgroundColor")
        
        let priceGroup = makeAnimationGroup()
        priceGroup.beginTime = 0.0
        priceLayer.add(priceGroup, forKey: "backgroundColor")
        
        let productImageGroup = makeAnimationGroup()
        productImageGroup.beginTime = 0.0
        productImageLayer.add(productImageGroup, forKey: "backgroundColor")
    }
}
