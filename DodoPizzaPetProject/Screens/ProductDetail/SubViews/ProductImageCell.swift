//
//  ProductImageCell.swift
//  DodoPizzaPetProject
//
//  Created by Muslim on 04.07.2023.
//

import UIKit
import SnapKit

final class ProductImageCell: UITableViewCell {
    
    static let reuseID = "ProductImageCell"
    
    // MARK: - Private Property
    private let productImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
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
    func configure(image: String) {
        productImage.image = UIImage(named: image)
    }
}

// MARK: - Setup Constraints
extension ProductImageCell {
    
    private struct Appearance {
        static let padding = 20
    }
    
    private func setupConstraints() {
        contentView.addSubview(productImage)
        productImage.snp.makeConstraints { make in
            make.leading.top.equalToSuperview().offset(Appearance.padding)
            make.bottom.trailing.equalToSuperview().offset(-Appearance.padding)
        }
    }
}
