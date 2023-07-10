//
//  ProductInfoCell.swift
//  DodoPizzaPetProject
//
//  Created by Muslim on 04.07.2023.
//

import UIKit
import SnapKit

final class ProductInfoCell: UITableViewCell {
    
    static let reuseID = "ProductInfoCell"
    
    // MARK: - Private Properties
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 28, weight: .medium)
        return label
    }()
    
    private let infoLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 18)
        return label
    }()
    
    // MARK: - Life Cycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Method
    func configure(product: Product?) {
        nameLabel.text = product?.name
        infoLabel.text = product?.itemDescription
    }
}

// MARK: - Setup Constraints
extension ProductInfoCell {
    
    private struct Appearance {
        static let padding = 20
        static let infoLabelTop = 10
    }
    
    private func setupConstraints() {
        contentView.addSubview(nameLabel)
        contentView.addSubview(infoLabel)
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().offset(Appearance.padding)
            make.trailing.equalToSuperview().offset(-Appearance.padding)
        }
        
        infoLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(Appearance.infoLabelTop)
            make.leading.equalToSuperview().offset(Appearance.padding)
            make.trailing.equalToSuperview().offset(-Appearance.padding)
        }
    }
}
