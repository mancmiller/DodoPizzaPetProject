//
//  MenuView.swift
//  DodoPizzaPetProject
//
//  Created by Muslim on 26.06.2023.
//

import UIKit
import SnapKit

final class MenuView: UIView {
    
    var tableAdapter: MenuTableAdapter
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.allowsSelection = false
        tableView.register(ProductCell.self, forCellReuseIdentifier: ProductCell.reuseID)
        tableView.dataSource = tableAdapter
        tableView.delegate = tableAdapter
//        tableView.separatorStyle = .none
        return tableView
    }()
    
// MARK: - Life Cycle
    init(tableAdapter: MenuTableAdapter) {
        self.tableAdapter = tableAdapter
        super.init(frame: UIScreen.main.bounds)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        tableView.rowHeight = bounds.height / 5
    }
}

// MARK: - Setup Constraints
extension MenuView {
    
    private struct Appearance {
        static let tableTop = 24
    }
    
    private func setupConstraints() {
        addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(Appearance.tableTop)
            make.bottom.equalTo(safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview()
        }
    }
}
