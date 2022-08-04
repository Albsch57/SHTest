//
//  CardItemViewController.swift
//  SmartHomeApp
//
//  Created by Alona on 03.08.2022.
//

import UIKit

class CardItemViewController: UIViewController {
    
    var device: Device!
    
    private let sliderWrapper = UIView()
    
    private lazy var deviceSlider: DeviceSlider = {
        if device.productType == .light {
            return DeviceSlider(frame: .zero, style: .light)
        } else if device.productType == .rollerShutter {
            return DeviceSlider(frame: .zero, style: .roller)
        }
        return DeviceSlider(frame: .zero, style: .heater)
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 40)
        label.textAlignment = .center
        return label
    }()

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let button: UIButton = {
       let button = UIButton()
        button.setTitle("on", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        title = device.deviceName
        
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
        
        deviceSlider.addTarget(self, action: #selector(self.sliderChanger(_:)), for: .valueChanged)
        button.addTarget(self, action: #selector(self.buttonChanger(_:)), for: .touchUpInside)
        
        if device.productType == .light {
            label.text = String(device.intensity ?? 0)
            deviceSlider.setValue(Float(device.intensity ?? 0), animated: true)
        }
        else if device.productType == .rollerShutter {
            label.text = String(device.position ?? 0)
            deviceSlider.setValue(Float(device.position ?? 0), animated: true)
            button.isHidden = true
        }
        else if device.productType == .heater {
            label.text = String(device.temperature ?? 0)
            deviceSlider.setValue(Float(device.temperature ?? 0), animated: true)
            button.setTitle(device.mode?.lowercased(), for: .normal)
        }
            
        if device.productType == .rollerShutter  {
            imageView.image = UIImage(named: "DeviceRollerShutterIcon")
            deviceSlider.transform = CGAffineTransform(rotationAngle: CGFloat(-Double.pi / 2))
        }
        else if device.productType == .light {
            imageView.image = UIImage(named: device.intensity != 0 ? "DeviceLightOnIcon" : "DeviceLightOffIcon")
        }
        else if device.productType == .heater {
            imageView.image = UIImage(named: device.temperature != 0 ? "DeviceHeaterOnIcon" : "DeviceHeaterOffIcon")
        }
        setupUI()
    }
    
    
    @objc func buttonChanger(_ sender: UIButton) {
        if sender.titleLabel?.text == "on" {
            sender.setTitle("off", for: .normal)
            
            let imageName = device.productType == .light ? "DeviceLightOffIcon" : "DeviceHeaterOffIcon"
            imageView.image = UIImage(named:  imageName)
            
            let minimumValue = device.productType == .heater ? 7 : 0
            deviceSlider.setValue(Float(minimumValue), animated: true)
            label.text = "0"
        } else {
            sender.setTitle("on", for: .normal)
            
            let imageName = device.productType == .light ? "DeviceLightOnIcon" : "DeviceHeaterOnIcon"
            imageView.image = UIImage(named: imageName)
            
            deviceSlider.setValue(10, animated: true)
            label.text = "10"
        }
    }
    
    
    @objc func sliderChanger(_ sender: UISlider) {
        
        let step = device.productType == .heater ? 0.5 : 1
        let roundedValue = round(Double(sender.value) / step) * step
        sender.value = Float(roundedValue)
        
        if device.productType == .heater {
            label.text = String(sender.value)
        } else {
            label.text = String(Int(sender.value))
        }
        
        guard device.productType == .light else {
            return
        }

        if sender.value == 0 {
            imageView.image = UIImage(named: "DeviceLightOffIcon")
            button.setTitle("off", for: .normal)
        } else {
            imageView.image = UIImage(named: "DeviceLightOnIcon")
            button.setTitle("on", for: .normal)
        }
    }
    
    func setupUI() {
        
        sliderWrapper.addSubview(deviceSlider)
        
        view.addSubview(sliderWrapper)
        view.addSubview(label)
        view.addSubview(imageView)
        view.addSubview(button)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        sliderWrapper.translatesAutoresizingMaskIntoConstraints = false
        deviceSlider.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
    
            sliderWrapper.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
            sliderWrapper.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            sliderWrapper.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            sliderWrapper.heightAnchor.constraint(equalToConstant: 250),
            
            deviceSlider.centerXAnchor.constraint(equalTo: sliderWrapper.centerXAnchor),
            deviceSlider.widthAnchor.constraint(equalTo: sliderWrapper.heightAnchor),
            deviceSlider.heightAnchor.constraint(equalTo: sliderWrapper.widthAnchor),
            
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            label.topAnchor.constraint(equalTo: deviceSlider.bottomAnchor, constant: 20),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            
            imageView.heightAnchor.constraint(equalToConstant: 150),
            
            imageView.bottomAnchor.constraint(equalTo: deviceSlider.topAnchor, constant:25),
            
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            button.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 25)
        ])
        
    }

}
