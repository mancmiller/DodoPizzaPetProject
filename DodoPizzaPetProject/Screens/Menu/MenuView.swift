//
//  MenuView.swift
//  DodoPizzaPetProject
//
//  Created by Muslim on 26.06.2023.
//

import UIKit
import SnapKit

protocol MenuViewDelegateProtocol: AnyObject {
    func menuViewCityButtonTapped(imageView: UIImageView)
}

final class MenuView: UIView {
    
    weak var delegate: MenuViewDelegateProtocol?
    
    var tableAdapter: MenuTableAdapter
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.allowsSelection = false
        tableView.register(ProductCell.self, forCellReuseIdentifier: ProductCell.reuseID)
        tableView.dataSource = tableAdapter
        tableView.delegate = tableAdapter
        tableView.tableHeaderView = bannersHeaderView
        tableView.separatorStyle = .none
        return tableView
    }()
    
    // MARK: - CityLabel
    let cityLabel: UILabel = {
        let label = UILabel()
        label.text = "Москва"
        label.font = .systemFont(ofSize: 20, weight: .medium)
        return label
    }()
    private let arrowImageView = UIImageView(image: UIImage(named: "arrow"))
    private lazy var chooseCityView: UIView = {
        let view = UIView()
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(cityButtonTapped)))
        return view
    }()
    
    // MARK: - BannersView
    lazy var bannersHeaderView: BannersView = {
        let width = UIScreen.main.bounds.size.width // refactor
        let height = width * 0.3
        let bannerView = BannersView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        return bannerView
    }()
    
    // MARK: - Life Cycle
    init(tableAdapter: MenuTableAdapter) {
        self.tableAdapter = tableAdapter
        super.init(frame: UIScreen.main.bounds) // need to refactor
        backgroundColor = .systemBackground
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        tableView.rowHeight = bounds.height / 5
    }
    
    // MARK: - Action
    @objc private func cityButtonTapped() {
        delegate?.menuViewCityButtonTapped(imageView: arrowImageView)
    }
}

// MARK: - Setup Constraints
extension MenuView {
    
    private struct Appearance {
        static let padding = 16
        static let tableTop = 16
    }
    
    private func setupConstraints() {
        addSubview(tableView)
        addSubview(cityLabel)
        addSubview(arrowImageView)
        addSubview(chooseCityView)
        
        cityLabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(16)
            make.leading.equalToSuperview().offset(Appearance.padding)
        }
        
        arrowImageView.snp.makeConstraints { make in
            make.centerY.equalTo(cityLabel)
            make.leading.equalTo(cityLabel.snp.trailing).offset(8)
            make.size.equalTo(CGSize(width: 14, height: 8))
        }
        
        chooseCityView.snp.makeConstraints { make in
            make.top.bottom.leading.equalTo(cityLabel)
            make.trailing.equalTo(arrowImageView)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(chooseCityView.snp.bottom).offset(Appearance.tableTop)
            make.bottom.equalTo(safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview()
        }
    }
}
