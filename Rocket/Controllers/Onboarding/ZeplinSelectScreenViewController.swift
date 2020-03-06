//
//  ZeplinSelectScreenViewController.swift
//  Rocket
//
//  Created by KUTAN ÇINGISIZ on 6.03.2020.
//  Copyright © 2020 KUTAN ÇINGISIZ. All rights reserved.
//

import UIKit

class ZeplinSelectScreenViewController: UIViewController {
    private let subView = ZeplinSelectScreenView()
    private let accessToken: String
    private let projectId: String
    
    private var dataLoader: ZeplinSelectScreenDataLoader!
    private var dataSource: ZeplinSelectScreenDataSource!
    private var screens: [ZeplinScreen]!
    
    init(accessToken: String, projectId: String) {
        self.accessToken = accessToken
        self.projectId = projectId
        self.dataLoader = ZeplinSelectScreenDataLoader(projectId: projectId, accessToken: accessToken)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init (coder:) has not been implemented")
    }
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .white
        
        layoutViews()
        getProjectScreens()
    }
}

// MARK: Constraints

extension ZeplinSelectScreenViewController {
    func layoutViews() {
        view.addSubview(subView)
        subView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor,
                       bottom: view.bottomAnchor, traling: view.trailingAnchor)
    }
}

// MARK: Network

extension ZeplinSelectScreenViewController {
    func getProjectScreens() {
        dataLoader.projectScreens { result in
            switch result {
            case .success(let screens):
                self.screens = screens
            case .failure(let error):
                break
            }
        }
    }
}

// MARK: DataSource Configuration

extension ZeplinSelectScreenViewController {
    func configureDataSource() {
        dataSource = ZeplinSelectScreenDataSource(screens: screens)
        subView.collectionView.dataSource = dataSource
        subView.collectionView.delegate = dataSource
        subView.collectionView.reloadData()
    }
}
