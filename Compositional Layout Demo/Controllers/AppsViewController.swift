//
//  Created by Mustafa Yusuf on 15/01/22.
//

import UIKit

class AppViewController: UICollectionViewController {
    
    init() {
        super.init(collectionViewLayout: .init())
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    private func setup() {
        title = "Compositional Layout"
        collectionView.register(HeroCell.self)
        collectionView.register(AppCell.self)
        collectionView.register(HeaderSupplementaryView.self)
        collectionView.setCollectionViewLayout(getCollectionViewLayout(), animated: false)
    }
    
    private func getCollectionViewLayout() -> UICollectionViewCompositionalLayout {
        
        let config = UICollectionViewCompositionalLayoutConfiguration()
        config.scrollDirection = .vertical

        return UICollectionViewCompositionalLayout(sectionProvider: { sectionIndex, _ in
            switch sectionIndex {
                case .zero:
                    
                    let itemSize = NSCollectionLayoutSize(
                        widthDimension: .fractionalWidth(1),
                        heightDimension: .fractionalHeight(1)
                    )
                    let groupSize = NSCollectionLayoutSize(
                        widthDimension: .fractionalWidth(1),
                        heightDimension: .absolute(256)
                    )
                    let item = NSCollectionLayoutItem(layoutSize: itemSize)
                    item.contentInsets = .init(
                        top: Constant.interItem,
                        leading: Constant.interItem,
                        bottom: Constant.interItem,
                        trailing: Constant.interItem
                    )
                    
                    let group = NSCollectionLayoutGroup.horizontal(
                        layoutSize: groupSize,
                        subitem: item,
                        count: 1
                    )
                    
                    group.interItemSpacing = .none
                    let section = NSCollectionLayoutSection(group: group)
                    section.interGroupSpacing = .zero
                    section.orthogonalScrollingBehavior = .groupPagingCentered
                    return section
                    
                default:
                    
                    let itemSize = NSCollectionLayoutSize(
                        widthDimension: .fractionalWidth(1),
                        heightDimension: .fractionalHeight(1/3)
                    )
                    let groupSize = NSCollectionLayoutSize(
                        widthDimension: .fractionalWidth(0.9),
                        heightDimension: .absolute(256)
                    )
                    let item = NSCollectionLayoutItem(layoutSize: itemSize)
                    let group = NSCollectionLayoutGroup.vertical(
                        layoutSize: groupSize,
                        subitem: item,
                        count: 3
                    )
                    group.contentInsets = .init(
                        top: Constant.interItem,
                        leading: Constant.interItem,
                        bottom: Constant.interItem,
                        trailing: Constant.interItem
                    )
                    group.interItemSpacing = .fixed(Constant.interItem)
                    let section = NSCollectionLayoutSection(group: group)
                    let header: NSCollectionLayoutBoundarySupplementaryItem = .init(
                        layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(50)),
                        elementKind: HeaderSupplementaryView.defaultReuseIdentifier,
                        alignment: .topLeading
                    )
                    header.pinToVisibleBounds = true
                    section.boundarySupplementaryItems = [header]
                    section.interGroupSpacing = Constant.interItem
                    section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
                    return section
            }
        }, configuration: config)
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        10
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
            case .zero:
                let cell = collectionView.dequeueCell(HeroCell.self, indexPath)
                return cell
            default:
                let cell = collectionView.dequeueCell(AppCell.self, indexPath)
                return cell
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueCell(HeaderSupplementaryView.self, indexPath)
        return header
    }
}
