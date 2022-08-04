//
//  DeviceSlider.swift
//  SmartHomeApp
//
//  Created by Alona on 04.08.2022.
//

import UIKit

class DeviceSlider: UISlider {

    enum deviceStyle {
        case light
        case roller
        case heater
        
        var image: (leading: UIImage, trailing: UIImage) {
            switch self {
            case .light:
                return (leading: UIImage(named: "close")!, trailing: UIImage(named: "open")!)
            case .roller:
                return (leading: UIImage(named: "minusIcon")!, trailing: UIImage(named: "plusIcon")!)
            case .heater:
                            return (leading: UIImage(named: "minusIcon")!, trailing: UIImage(named: "plusIcon")!)
            }
        }
    }

    init(frame: CGRect, style: deviceStyle) {
        super .init(frame: frame)
        self.minimumValueImage = style.image.leading
        self.maximumValueImage = style.image.trailing
        self.minimumValue = style == .heater ? 7 : 0
        self.maximumValue = style == .heater ? 28 : 100
        self.minimumTrackTintColor = .yellow
        self.thumbTintColor = .green
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
