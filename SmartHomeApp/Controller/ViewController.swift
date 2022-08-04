//
//  ViewController.swift
//  SmartHomeApp
//
//  Created by Alona on 30.07.2022.
//

import UIKit
import Foundation


class ViewController: UIViewController {
    
    let parser = Parser()
    var devices = [Device]()
    var profile: User!
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: compositionalViewlayout())
        collectionView.register(ItemCollectionViewCell.self, forCellWithReuseIdentifier: ItemCollectionViewCell.reuseId)
        
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .clear
        collectionView.delegate = self
        return collectionView
    }()
    
    private lazy var dataSourse: UICollectionViewDiffableDataSource = {
        
        return UICollectionViewDiffableDataSource<Section, Device>(collectionView: self.collectionView) { collectionView, indexPath, device in
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemCollectionViewCell.reuseId, for: indexPath) as! ItemCollectionViewCell
            cell.contentView.backgroundColor = .systemGray2
            cell.label.text = device.deviceName
            cell.imageView.image = device.productType.image
            return cell
        }
    }()
    
    enum Section {
        case main
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let userButton = UIBarButtonItem(image: .init(named: "profile"), style: .done, target: self, action: #selector(self.userButtonTapped(_:)))
        navigationItem.leftBarButtonItem = userButton
        view.addSubview(collectionView)
        
        parser.parse {
            data in
            self.devices = data.devices
            self.profile = data.user
            
            DispatchQueue.main.async {
                self.buildSnapshot()
            }
        }
    }
    
    
    @objc func userButtonTapped(_ sender: UIBarButtonItem) {
        let profileController = ProfileViewController()
        profileController.profile = self.profile
        self.present(profileController, animated: true)
    }
    
    func buildSnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Device>()
        snapshot.appendSections([.main])
        snapshot.appendItems(self.devices, toSection: .main)
        dataSourse.apply(snapshot)
    }
    
    func compositionalViewlayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { sectionIndex, _ in
            
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1))
           
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(140))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
            group.interItemSpacing = .fixed(5)
            
            group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16)
            
            let section = NSCollectionLayoutSection(group: group)
            section.interGroupSpacing = 8
            return section
        }
    }
}

    extension ViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let product = dataSourse.itemIdentifier(for: indexPath) else {
            return
        }
        let cardItemViewController = CardItemViewController()
        cardItemViewController.device = product
        
        navigationController?.pushViewController(cardItemViewController, animated: true)
    }
}
