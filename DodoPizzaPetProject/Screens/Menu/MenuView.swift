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
        let tableView = UITableView(frame: .zero)
        tableView.allowsSelection = false
        tableView.register(ProductCell.self, forCellReuseIdentifier: ProductCell.reuseID)
        tableView.dataSource = tableAdapter
        tableView.delegate = tableAdapter
        tableView.tableHeaderView = bannersHeaderView
        tableView.separatorStyle = .none
        return tableView
    }()
    
    // MARK: - BannersView
    lazy var bannersHeaderView: BannersView = {
        let width = UIScreen.main.bounds.size.width
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
