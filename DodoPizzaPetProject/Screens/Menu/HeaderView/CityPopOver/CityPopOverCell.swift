//
//  CityPopOverCell.swift
//  DodoPizzaPetProject
//
//  Created by Muslim on 04.07.2023.
//

import UIKit
import SnapKit

final class CityPopOverCell: UITableViewCell {
    
    static let reuseID = "CityPopOverCell"
    
    // MARK: - Private Property
    private let cityLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20, weight: .medium)
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
    func configure(city: String) {
        cityLabel.text = city
    }
}

// MARK: - Setup Constraints
extension CityPopOverCell {
    private func setupConstraints() {
        contentView.addSubview(cityLabel)
        cityLabel.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
    }
}
