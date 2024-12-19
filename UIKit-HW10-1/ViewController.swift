//
//  ViewController.swift
//  UIKit-HW10-1
//
//  Created by Дима on 12/16/24.
//

import UIKit

class ViewController: UIViewController {
    private lazy var collectionView = {
        $0.dataSource = self
        $0.register(StoriesCellView.self, forCellWithReuseIdentifier: StoriesCellView.identifier)
        $0.register(MessagesCellView.self, forCellWithReuseIdentifier: MessagesCellView.identifier)
        $0.register(AnnouncementsCellView.self, forCellWithReuseIdentifier: AnnouncementsCellView.identifier)
        $0.register(FeedsCellView.self, forCellWithReuseIdentifier: FeedsCellView.identifier)
        $0.register(HeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.identifier)

        return $0
    }(UICollectionView(frame: view.frame, collectionViewLayout: setLayout()))
    
    private func setLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { section, _ in
            switch section {
            case 0: return self.setStoriesSection()
            case 1: return self.setMessagesSection()
            case 2: return self.setAnnouncementsSection()
            case 3: return self.setFeedsSection()
            default : fatalError()
            }
        }
    }
    private func setStoriesSection() -> NSCollectionLayoutSection {
        let sectionViewWidth = UIScreen.main.bounds.width - 2 * Margins.L
        // Item set up
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        // Group set up
        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute((sectionViewWidth + Margins.S) / 4), heightDimension: .absolute(sectionViewWidth * 5/16))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: item, count: 1)
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: Margins.XS, bottom: 0, trailing: Margins.XS)

        // Section set up
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary // СКРОЛЛ ПО ГОРИЗОНТАЛИ
        section.contentInsets = NSDirectionalEdgeInsets(top: Margins.S, leading: Margins.L - Margins.XS, bottom: 0, trailing: Margins.L - Margins.XS)
        
        return section
    }
    
    func setMessagesSection() -> NSCollectionLayoutSection {
        let sectionViewWidth = UIScreen.main.bounds.width - 2 * Margins.L
        
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: Margins.XS, leading: 0, bottom: Margins.XS, trailing: 0)
        
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(sectionViewWidth + 2 * Margins.XS), heightDimension: .estimated(90 * scaleMultiplier())) // ОЖИДАЕМАЯ ВЫСОТА ОДНОГО ЭЛЕМЕНТА
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, repeatingSubitem: item, count: 2)
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: Margins.XS, bottom: 0, trailing: Margins.XS)
        
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPagingCentered
        section.contentInsets = NSDirectionalEdgeInsets(top: Margins.L, leading: Margins.L, bottom: 0, trailing: Margins.L)
        
        return section
    }
    
    func setAnnouncementsSection() -> NSCollectionLayoutSection {
        let sectionViewWidth = UIScreen.main.bounds.width - 2 * Margins.L

        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.8), heightDimension: .absolute(sectionViewWidth / 2))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: item, count: 1)
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: Margins.XS, bottom: 0, trailing: Margins.XS)
        
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        section.contentInsets = NSDirectionalEdgeInsets(top: Margins.L, leading: Margins.L - Margins.XS, bottom: 0, trailing: Margins.L - Margins.XS)
        
        return section
    }
    
    private func setFeedsSection() -> NSCollectionLayoutSection {
        // Group set up
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(100))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [.init(layoutSize: groupSize)]) /// Сюда добавляешь именно размеры группы
                
        group.edgeSpacing = NSCollectionLayoutEdgeSpacing(leading: nil, top: .fixed(Margins.XS), trailing: nil, bottom: .fixed(Margins.XS)) // нуждые отступы именно через `edgeSpacing` обрати внимание, а не `contentInsets`
                

        // Section set up
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: Margins.L - Margins.XS, leading: Margins.L, bottom: Margins.L - Margins.XS, trailing: Margins.L)

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
        case 1: guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MessagesCellView.identifier, for: indexPath) as? MessagesCellView else { return UICollectionViewCell() }
            cell.configure(with: Messages.items()[indexPath.item])
            return cell
        case 2: guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AnnouncementsCellView.identifier, for: indexPath) as? AnnouncementsCellView else { return UICollectionViewCell() }
            cell.configure(with: Announcements.items()[indexPath.item])
            return cell
        case 3: guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FeedsCellView.identifier, for: indexPath) as? FeedsCellView else { return UICollectionViewCell() }
            cell.configure(with: Feeds.items()[indexPath.item])
            return cell
        default:
            return UICollectionViewCell()
        }
    }
//    // for header doesn't work for some reason
//    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.identifier, for: indexPath) as! HeaderCollectionReusableView
//        //        switch indexPath {
//        //        case 0: header.configure(with: "Stories")
//        //        case 1: header.configure(with: "Messages")
//        //        default: header.configure(with: "Announcements")
//        //        }
//        header.configure(with: "Stories")
//        return header
//    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderIn section: Int) -> CGSize {
//        return CGSize(width: collectionView.frame.width - 2 * Margins.L, height: 50)
//    }
}
