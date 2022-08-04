//
//  ProfileViewController.swift
//  SmartHomeApp
//
//  Created by Alona on 04.08.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var profile: User!
    
    private let imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "profilePicture"))
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let titleLable: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    private var buildlabel: UILabel {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .center
        label.textColor = .black
        return label
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupUI()
    }
    
    
    // MARK: - AutoLayoutAnchor
    
    func setupUI() {
        
        self.titleLable.text = "\(profile.firstName) \(profile.lastName)"
        
        let birthdayLabel = buildlabel
        birthdayLabel.text = String(profile.birthDate)
        
        let cityLabel = buildlabel
        cityLabel.text = profile.address.city
        
        let coutryLabel = buildlabel
        coutryLabel.text = profile.address.country
        
        let streetLabel = buildlabel
        streetLabel.text = "\(profile.address.street), \(profile.address.streetCode)"
        
        let postalLabel = buildlabel
        postalLabel.text = String(profile.address.postalCode)
        
        view.addSubview(imageView)
        view.addSubview(titleLable)
        view.addSubview(birthdayLabel)
        view.addSubview(cityLabel)
        view.addSubview(coutryLabel)
        view.addSubview(streetLabel)
        view.addSubview(postalLabel)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        titleLable.translatesAutoresizingMaskIntoConstraints = false
        birthdayLabel.translatesAutoresizingMaskIntoConstraints = false
        cityLabel.translatesAutoresizingMaskIntoConstraints = false
        coutryLabel.translatesAutoresizingMaskIntoConstraints = false
        streetLabel.translatesAutoresizingMaskIntoConstraints = false
        postalLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
        
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 150),
            
            titleLable.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            titleLable.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 16),
            titleLable.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            birthdayLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            birthdayLabel.topAnchor.constraint(equalTo: titleLable.bottomAnchor, constant: 5),
            birthdayLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),

            coutryLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            coutryLabel.topAnchor.constraint(equalTo: birthdayLabel.bottomAnchor, constant: 15),
            coutryLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),

            cityLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            cityLabel.topAnchor.constraint(equalTo: coutryLabel.bottomAnchor, constant: 5),
            cityLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),

            streetLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            streetLabel.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: 5),
            streetLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),

            postalLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            postalLabel.topAnchor.constraint(equalTo: streetLabel.bottomAnchor, constant: 5),
            postalLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
}
