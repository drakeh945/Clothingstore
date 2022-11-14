//
//  ViewController.swift
//  Clothing Store
//
//  Created by Drake Herring on 11/9/22.
//

import UIKit




class ViewController: UIViewController {
    
    private var dataSource: UICollectionViewDiffableDataSource<Section, Item>!
    private var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
    @IBOutlet weak var collectionView: UICollectionView!
    
    lazy var collectionViewLayout: UICollectionViewLayout = {
        let config = UICollectionViewCompositionalLayout {  [weak self] (sectionIndex, env) -> NSCollectionLayoutSection? in
            guard let self = self else { return nil }
            
            
            let snapshot = self.dataSource.snapshot()
            let sectionType = snapshot.sectionIdentifiers[sectionIndex].type
            
            
            switch sectionType {
            case .discovery:
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(400))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(400))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .groupPaging
                section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 15, trailing: 0)
                
            return section
            
                
            case .header:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(50))
                
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(50))
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 0)
                
                let section = NSCollectionLayoutSection(group: group)

                return section
                
                
            case .ad:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50))
                
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 0)
                
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .groupPaging
                section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 15, trailing: 0)

                return section
                
                
            default: return nil
            }
        }
        return config
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        
        // Do any additional setup after loading the view.
    }
    func initialize(){
        setUpcollectionView()
        configdataSource()
    }
    private func setUpcollectionView() {
        collectionView.register(UINib(nibName: DiscoveryCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: DiscoveryCollectionViewCell.identifier)
         collectionView.collectionViewLayout = collectionViewLayout
        collectionView.register(UINib(nibName: "LargeCell", bundle: .main), forCellWithReuseIdentifier: "LargeCell")
        collectionView.register(UINib(nibName: "MediumCell", bundle: .main), forCellWithReuseIdentifier: "MediumCell")
        collectionView.register(UINib(nibName: "HeaderCell", bundle: .main), forCellWithReuseIdentifier: "HeaderCell")
        collectionView.register(UINib(nibName: "AdCell", bundle: .main), forCellWithReuseIdentifier: "AdCell")
       // Have to register each discovery cell you make
    }
    
    private func configdataSource(){
        dataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView) { (collectionView, indexPath, item) in
            
            let  snapshot = self.dataSource.snapshot()
            let sectionType = snapshot.sectionIdentifiers[indexPath.section].type
            
            switch sectionType {
            case .discovery:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DiscoveryCollectionViewCell.identifier, for: indexPath)
                return cell
        // case for other sections
            default: return nil
            }
            
        }
        
        let sections = [
            Section(type: .discovery, item: [Item(),Item(),Item(),Item(),Item()])
        ]
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections(sections)
        sections.forEach{ snapshot.appendItems($0.item, toSection: $0) }
        dataSource.apply(snapshot, animatingDifferences: false)
        
    }
}
