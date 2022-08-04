//
//  CustomCell.swift
//  SmartHome
//
//  Created by Марат Маркосян on 14.07.2022.
//

import UIKit


/*
class CustomCell: UITableViewCell {
    
    private lazy var positionAndName = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setLabel()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setLabel() {
        addSubview(positionAndName)
        backgroundColor = .white
        
        positionAndName.translatesAutoresizingMaskIntoConstraints = false
        
        positionAndName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        positionAndName.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        positionAndName.textColor = .black
        
    }
    
    
    func setDeviceName(to name: String) {
        positionAndName.text = name
    }
    
    func setNameAndPosition(name: String, position: Int) {
        if position == 0 {
            positionAndName.text = "\(name) - closed"
        } else if position == 100 {
            positionAndName.text = "\(name) - opened"
        } else {
            positionAndName.text = "\(name) - opened at \(position)%"
        }
    }
}
*/
