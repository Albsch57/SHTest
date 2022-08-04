//
//  RollerVC.swift
//  SmartHome
//
//  Created by Марат Маркосян on 14.07.2022.
//

import UIKit


/*
class RollerVC: UIViewController {

    private lazy var backBtn = UIButton()
    private lazy var rollerImage = UIImageView(image: UIImage(named: "DeviceRollerShutterIcon"))
    private lazy var slider = UISlider()
    private lazy var nameLbl = UILabel()
    
    var position = 0
    var name = ""
    
    override func loadView() {
        super.loadView()
        
        setUpSubviews()
        setUpAutoLayout()
    }
    
    private func setUpSubviews() {
        view.backgroundColor = .white
        
        view.addSubview(backBtn)
        view.addSubview(rollerImage)
        view.addSubview(slider)
        view.addSubview(nameLbl)
        
        backBtn.translatesAutoresizingMaskIntoConstraints = false
        rollerImage.translatesAutoresizingMaskIntoConstraints = false
        nameLbl.translatesAutoresizingMaskIntoConstraints = false
        slider.translatesAutoresizingMaskIntoConstraints = false
        
        backBtn.setTitleColor(.black, for: .normal)
        backBtn.setTitle("Back", for: .normal)
        backBtn.addTarget(self, action: #selector(backTapped), for: .touchUpInside)

        rollerImage.contentMode = .scaleAspectFit
        
        nameLbl.textColor = .black
        nameLbl.text = name
        
        slider.maximumValue = 100
        slider.minimumValue = 0
        slider.isContinuous = true
        slider.transform = CGAffineTransform(rotationAngle: CGFloat(-Double.pi/2))
        slider.setValue(Float(position), animated: true)

    }
    
    private func setUpAutoLayout() {
        NSLayoutConstraint.activate([
            backBtn.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            backBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),

            rollerImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            rollerImage.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            rollerImage.widthAnchor.constraint(equalToConstant: 200),
            rollerImage.heightAnchor.constraint(equalToConstant: 200),
            
            slider.leadingAnchor.constraint(equalTo: rollerImage.trailingAnchor),
            slider.widthAnchor.constraint(equalToConstant: 200),
            slider.heightAnchor.constraint(equalToConstant: 30),
            slider.centerYAnchor.constraint(equalTo: rollerImage.centerYAnchor),
            
            nameLbl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameLbl.topAnchor.constraint(equalTo: rollerImage.bottomAnchor, constant: 20)
        ])
    }
    
    @objc private func backTapped() {
        dismiss(animated: true)
    }

}
*/
