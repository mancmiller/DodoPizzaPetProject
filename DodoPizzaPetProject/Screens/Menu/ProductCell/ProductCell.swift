//
//  ProductCell.swift
//  DodoPizzaPetProject
//
//  Created by Muslim on 27.06.2023.
//

import UIKit

final class ProductCell: UITableViewCell {
    
    static let reuseID = "ProductCell"
    
    //MARK: - Private Properties
    private let productImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private let productNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .semibold)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        return label
    }()
    
    private let productDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .natural
        label.textColor = .secondaryLabel
        label.sizeToFit()
        return label
    }()
    
    private let priceButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: "accentColor")
        button.layer.cornerRadius = button.frame.height / 2
        return button
    }()
    
    private let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
        stackView.spacing = 5
        return stackView
    }()
    
    //MARK: - Life Cycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Public Methods
    
    func configure(model: Product) {
        productNameLabel.text = model.name
        productDescriptionLabel.text = model.itemDescription
        priceButton.setTitle("₽ \(model.price)", for: .normal)
        productImageView.image = UIImage(named: model.image)
    }
}

//MARK: - Setup Constraints
extension ProductCell {
    
    private struct Appearance {
        static let padding = 16
        static let stackViewLeading = -20
        static let priceButtonHeight = 0.22
        static let priceButtonWidth = 0.5
        static let productNameLabelHeight = 0.15
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
            make.top.bottom.trailing.equalTo(contentView).inset(Appearance.padding)
        }
        
        priceButton.snp.makeConstraints { make in
            make.height.equalTo(mainStackView.snp.height).multipliedBy(Appearance.priceButtonHeight)
            make.width.equalTo(mainStackView.snp.width).multipliedBy(Appearance.priceButtonWidth)
        }
        
        productNameLabel.snp.makeConstraints { make in
            make.height.equalTo(mainStackView.snp.height).multipliedBy(Appearance.productNameLabelHeight)
        }
    }
}
