//
//  ZeplinSelectComponentsViewController.swift
//  Rocket
//
//  Created by KUTAN ÇINGISIZ on 6.03.2020.
//  Copyright © 2020 KUTAN ÇINGISIZ. All rights reserved.
//

import UIKit

class ZeplinSelectComponentsViewController: UIViewController {
    private let subView = ZeplinSelectComponentsView()
    private let screenId: String
    private let projectId: String
    private let accessToken: String
    
    private var dataLoader: ZeplinSelectComponentsDataLoader!
    private var dataSource: ZeplinSelectComponentsDataSource!
    
    private var screenVersions: [ZeplinScreenVersion]!
    private var screenComponents: ZeplinScreenComponents!
    private var selectedScreenVersionId: String!
    
    private var zeplinTextParser = ZeplinTextComponentParser()
    
    init(screenId: String, projectId: String, accessToken: String) {
        self.screenId = screenId
        self.projectId = projectId
        self.accessToken = accessToken
        self.dataLoader = ZeplinSelectComponentsDataLoader(accessToken: accessToken, screenId: screenId, projectId: projectId)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .white
        
        layoutViews()
        getScreenVersions()
    }
}

// MARK: Constraints

extension ZeplinSelectComponentsViewController {
    func layoutViews() {
        view.addSubview(subView)
        subView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor,
                       bottom: view.bottomAnchor, traling: view.trailingAnchor)
    }
}

// MARK: Network - Screen Versions

extension ZeplinSelectComponentsViewController {
    func getScreenVersions() {
        dataLoader.screenVersions { result in
            switch result {
            case .success(let versions):
                self.screenVersions = versions
                self.selectedScreenVersionId = versions.last!.id
                self.getScreenComponents()
            case .failure(let error):
                break
            }
        }
    }
}

// MARK: Network - Screen Components

extension ZeplinSelectComponentsViewController {
    func getScreenComponents() {
        dataLoader.screen(forVersionId: self.selectedScreenVersionId) { result in
            switch result {
            case .success(let component):
                self.screenComponents = component
                let group = ZeplinLayeredGroupParser().parseComponent(fromComponent: component)
                self.addGroupedLayer(fromParentZeplinView: group)
            case .failure(let error):
                break
            }
        }
    }
    
    func addGroupedLayer(fromParentZeplinView parentZeplinView: ParentZeplinView) {
        
    }
}

// MARK: CollectionView Delegate & Datasource

extension ZeplinSelectComponentsViewController {
    func makeTexts() {
        let possibleTexts = zeplinTextParser.makeZeplinLabel(fromLayer: screenComponents.layers.filter { $0.type == "text"})
        configureDataSource(withComponents: possibleTexts ?? [])
    }
    
    func configureDataSource(withComponents components: [UIView]) {
        dataSource = ZeplinSelectComponentsDataSource(components: components)
        subView.collectionView.delegate = dataSource
        subView.collectionView.dataSource = dataSource
        subView.collectionView.reloadData()
    }
}
