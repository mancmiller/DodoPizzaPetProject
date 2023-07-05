//
//  CityPopOverViewController.swift
//  DodoPizzaPetProject
//
//  Created by Muslim on 04.07.2023.
//

import UIKit
import SnapKit

protocol CityPopOverViewOutputProtocol: AnyObject {
    func selectedCity(_ string: String)
}

final class CityPopOverViewController: UIViewController {
    
    weak var delegate: CityPopOverViewOutputProtocol?
    
    // MARK: - Private Properties
    private var cities = ["Москва", "Санкт-Петербург", "Новосибирск", "Екатеринбург", "Казань", "Самара", "Омск"]
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(CityPopOverCell.self, forCellReuseIdentifier: CityPopOverCell.reuseID)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        return tableView
    }()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
    }
}

// MARK: - Setup Constraints
extension CityPopOverViewController {
    private func setupConstraints() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

// MARK: - UITableViewDelegate
extension CityPopOverViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.selectedCity(cities[indexPath.row])
        presentingViewController?.dismiss(animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30
    }
}

// MARK: - UITableViewDataSource
extension CityPopOverViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CityPopOverCell.reuseID, for: indexPath) as? CityPopOverCell else { return UITableViewCell() }
        cell.configure(city: cities[indexPath.row])
        return cell
    }
}
