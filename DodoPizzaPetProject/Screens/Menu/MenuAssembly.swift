//
//  MenuAssembly.swift
//  DodoPizzaPetProject
//
//  Created by Muslim on 26.06.2023.
//

final class MenuAssembly {
    func configure() -> MenuVC {
        let router = MenuRouter()
        let view = MenuView()
        let interactor = MenuInteractor()
        let presenter = MenuPresenter()
        let controller = MenuVC()
        return controller
    }
}
