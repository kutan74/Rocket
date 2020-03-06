//
//  ZeplinSelectProjectViewController.swift
//  Rocket
//
//  Created by KUTAN ÇINGISIZ on 6.03.2020.
//  Copyright © 2020 KUTAN ÇINGISIZ. All rights reserved.
//

import UIKit

class ZeplinSelectProjectViewController: UIViewController {
    private let subView = ZeplinSelectProjectView()
    private let accessToken: String
    
    private var dataLoader: ZeplinSelectProjectDataLoader!
    private var zeplinProjects: [ZeplinProject]!
    private var dataSource: ZeplinSelectProjectDataSource!
    
    init(accessToken: String) {
        self.accessToken = accessToken
        self.dataLoader = ZeplinSelectProjectDataLoader(accessToken: accessToken)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init (coder:) has not been implemented")
    }
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .white
        
        layoutViews()
        getProjects()
    }
}

// MARK: Constraints

extension ZeplinSelectProjectViewController {
    func layoutViews() {
        view.addSubview(subView)
        
        subView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor,
                       bottom: view.bottomAnchor, traling: view.trailingAnchor)
    }
}

// MARK: Network

extension ZeplinSelectProjectViewController {
    func getProjects() {
        dataLoader.getProjects { result in
            switch result {
            case .success(let projects):
                self.zeplinProjects = projects
                self.configureDataSource()
            case .failure(let error):
                break
            }
        }
    }
}

// MARK: CollectionView DataSource

extension ZeplinSelectProjectViewController {
    func configureDataSource() {
        dataSource = ZeplinSelectProjectDataSource(projects: zeplinProjects)
        dataSource.delegate = self
        subView.collectionView.delegate = dataSource
        subView.collectionView.dataSource = dataSource
        subView.collectionView.reloadData()
    }
}

// MARK: Zeplin Project Selection Handler

extension ZeplinSelectProjectViewController: ZeplinSelectProjectDataSourceDelegate {
    func didSelectProject(forId id: String) {
        let controller = ZeplinSelectScreenViewController(accessToken: accessToken, projectId: id)
        controller.modalPresentationStyle = .fullScreen
        present(controller, animated: true, completion: nil)
    }
}
