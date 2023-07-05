//
//  ProductDetailView.swift
//  DodoPizzaPetProject
//
//  Created by Muslim on 26.06.2023.
//

import UIKit
import SnapKit

protocol ProductDetailViewDelegateProtocol: AnyObject {
    func addOrder()
}

final class ProductDetailView: UIView {
    
    weak var delegate: ProductDetailViewDelegateProtocol?
    
    var tableAdapter: ProductDetailTableAdapter
    
    // MARK: - Private Properties
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.allowsSelection = false
        tableView.register(ProductImageCell.self, forCellReuseIdentifier: ProductImageCell.reuseID)
        tableView.register(ProductInfoCell.self, forCellReuseIdentifier: ProductInfoCell.reuseID)
        tableView.isScrollEnabled = false
        tableView.separatorStyle = .none
        tableView.dataSource = tableAdapter
        tableView.delegate = tableAdapter
        return tableView
    }()
    
    lazy var orderButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: "accentColor")
        button.addTarget(self, action: #selector(addOrder), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Life Cycle
    init (tableAdapter: ProductDetailTableAdapter) {
        self.tableAdapter = tableAdapter
        super.init(frame: UIScreen.main.bounds)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Action
    @objc private func addOrder() {
        delegate?.addOrder()
    }
}

// MARK: - Setup Constraints
extension ProductDetailView {
    
    private struct Appearance {
        static let padding = 20
        static let buttonHeight = 54
    }
    
    private func setupConstraints() {
        addSubview(tableView)
        addSubview(orderButton)
        
        tableView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
        
        orderButton.snp.makeConstraints { make in
            make.bottom.equalTo(safeAreaLayoutGuide).offset(-Appearance.padding)
            make.leading.equalTo(tableView.snp.leading).offset(Appearance.padding)
            make.trailing.equalTo(tableView.snp.trailing).offset(-Appearance.padding)
            make.height.equalTo(Appearance.buttonHeight)
        }
    }
}
