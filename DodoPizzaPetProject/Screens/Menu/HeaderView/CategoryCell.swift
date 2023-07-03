//
//  CategoryCell.swift
//  DodoPizzaPetProject
//
//  Created by Muslim on 30.06.2023.
//

import UIKit
import SnapKit

final class CategoryCell: UICollectionViewCell {
    
    static let reuseID = "CategoryCell"
    
// MARK: - Private Properties
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.textColor = .secondaryLabel
        return label
    }()
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                contentView.backgroundColor = UIColor(named: "accentColor")
                titleLabel.textColor = .white
            } else {
                contentView.backgroundColor = .systemBackground
                titleLabel.textColor = .label
            }
        }
    }
    
// MARK: - Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
// MARK: - Public Methods
    func configure(category: String) {
        titleLabel.text = category
    }
    
// MARK: - Private Methods
    private func setupView() {
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor(named: "accentColor")?.cgColor
        contentView.layer.cornerRadius = contentView.frame.height / 2
    }
}

// MARK: - SetupConstraints
extension CategoryCell {
    private func setupContraints() {
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8))
        }
    }
}
