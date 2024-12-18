//
//  ViewController.swift
//  UIKit-HW10-1
//
//  Created by Дима on 12/16/24.
//

import UIKit

class ViewController: UIViewController {
    
//    let data = Content(rawValue: 0)!.items()
    
    lazy var collectionView = {
        $0.dataSource = self
        $0.register(StoriesCellView.self, forCellWithReuseIdentifier: StoriesCellView.identifier)
        $0.register(MessagesCellView.self, forCellWithReuseIdentifier: MessagesCellView.identifier)

        return $0
    }(UICollectionView(frame: view.frame, collectionViewLayout: setLayout()))
    
    private func setLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { section, _ in
//            switch section {
//            case 0:
//                return self.setStorySection()
//            default:
//                return self.setStorySection()
//            }
            return self.setStorySection()
            
        }
    }
    private func setStorySection() -> NSCollectionLayoutSection {
        // Sizes setting up
//        let sectionViewWidth = UIScreen.main.bounds.width - 2 * Margins.large.value()
//        
//        let groupWidth: CGFloat = sectionViewWidth / 4
//        let groupHeight = groupWidth * 1.5

        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(80),
                                               heightDimension: .absolute(104))
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .fractionalHeight(1))
        
        // Objects creating with sizes
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: item, count: 1)
        let section = NSCollectionLayoutSection(group: group)

        // Objects setting up
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: Margins.small.value())
        section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary // СКРОЛЛ ПО ГОРИЗОНТАЛИ
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: Margins.large.value(), bottom: 0, trailing: Margins.large.value())
        return section
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(collectionView)
    }


}
extension ViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        Content.allCases.count
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let count = Content(rawValue: section)?.items().count {
            return count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//                let cell : UICollectionViewCell
        switch indexPath.section {
        case 0: guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoriesCellView.identifier, for: indexPath) as? StoriesCellView else { return UICollectionViewCell() }
            cell.configure(with: Stories.items()[indexPath.item])
            return cell
        default: guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MessagesCellView.identifier, for: indexPath) as? MessagesCellView else { return UICollectionViewCell() }
            cell.configure(with: Stories.items()[indexPath.item])
            return cell
        }
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoriesCellView.identifier, for: indexPath) as? StoriesCellView else { return UICollectionViewCell() }
//        cell.configure(with: Stories.items()[indexPath.item])
//        return cell
    }
}
