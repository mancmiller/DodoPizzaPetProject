//
//  ProductDetailTableAdapter.swift
//  DodoPizzaPetProject
//
//  Created by Muslim on 04.07.2023.
//

import UIKit

final class ProductDetailTableAdapter: NSObject {
    
    var product: Product?
    
    enum SectionType: Int, CaseIterable {
        case image = 0
        case info
    }
}

// MARK: - DataSource
extension ProductDetailTableAdapter: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SectionType.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sectionType = SectionType.init(rawValue: indexPath.row)
        
        switch sectionType {
        case .image:
            guard let imageCell = tableView.dequeueReusableCell(withIdentifier: ProductImageCell.reuseID) as? ProductImageCell else { return UITableViewCell() }
            imageCell.configure(image: product?.image ?? "pizza")
            return imageCell
            
        default:
            guard let infoCell = tableView.dequeueReusableCell(withIdentifier: ProductInfoCell.reuseID) as? ProductInfoCell else { return UITableViewCell() }
            infoCell.configure(product: product)
            return infoCell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let sectionType = SectionType(rawValue: indexPath.row)
        switch sectionType {
        case .image:
            return UIScreen.main.bounds.height / 2
        case .info:
            return UIScreen.main.bounds.height / 10
        default:
            return 0
        }
    }
}

// MARK: - Delegate
extension ProductDetailTableAdapter: UITableViewDelegate {}
