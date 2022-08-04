//
//  LightVC.swift
//  SmartHome
//
//  Created by Марат Маркосян on 14.07.2022.
//

import UIKit

//
//  LightViewController.swift
//  HomeConnect
//
//  Created by Pauline Nomballais on 24/09/2020.
//

import UIKit
/*
final class LightViewController: UIViewController {

    // MARK: - Properties

    private let viewModel: LightViewModel
    private lazy var deleteIconName: String = ""
    private lazy var intensityMaxImageName: String = ""
    private lazy var intensityMinImageName: String = ""

    private lazy var lightModeSwitch: UISwitch = {
        let modeSwitch = UISwitch()
        modeSwitch.onTintColor = .blue
        modeSwitch.addTarget(self,
                             action: #selector(modeSwitchValueDidChange),
                             for: .valueChanged)
        return modeSwitch
    }()

    private lazy var lightIntensityLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.layer.borderColor = UIColor.blue.cgColor
        label.layer.borderWidth = 2.0
        label.layer.cornerRadius = 50
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.numberOfLines = 0
        label.clipsToBounds = true
        return label
    }()

    private lazy var lightIntensitySlider: UISlider = {
        let slider = UISlider()
        slider.minimumValueImage = UIImage(named: "\(intensityMinImageName)")
        slider.maximumValueImage = UIImage(named: "\(intensityMaxImageName)")
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.tintColor = .blue
        slider.thumbTintColor = .yellow
        slider.isContinuous = true
        slider.addTarget(self,
                         action: #selector(didMoveIntensitySlider),
                         for: .valueChanged)
        return slider
    }()

    private lazy var modeVieww: UIView = {
        let view = UIView()
        view.addSubview(modeOffLabel)
        modeOffLabel.anchor(top: view.topAnchor,
                            bottom: view.bottomAnchor)
        modeOffLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true

        view.addSubview(lightModeSwitch)
        lightModeSwitch.anchor(top: view.topAnchor,
                               left: modeOffLabel.rightAnchor,
                               bottom: view.bottomAnchor,
                               paddingLeft: 15)
        lightModeSwitch.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        lightModeSwitch.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        view.addSubview(modeOnLabel)
        modeOnLabel.anchor(top: view.topAnchor,
                           left: lightModeSwitch.rightAnchor,
                           bottom: view.bottomAnchor,
                           paddingLeft: 15)
        modeOnLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true

        return view
    }()

    private lazy var modeOnLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.numberOfLines = 0
        return label
    }()

    private lazy var modeOffLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.numberOfLines = 0
        return label
    }()

    private lazy var deleteButton: UIBarButtonItem = {
        let button = UIBarButtonItem(image: UIImage(named: deleteIconName),
                        style: .plain,
                        target: self,
                        action: #selector(didTapDeleteButton))
        return button
    }()

    private lazy var lightSaveButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(didTapSaveButton), for: .touchUpInside)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        return button
    }()

    // MARK: - Initializer

    init(viewModel: LightViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    // MARK: - Lifecycle

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setUI()
        setNavigationBar()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        bind(to: viewModel)
        viewModel.start()
        if let intensityValue = Int(lightIntensityLabel.text ?? "") {
            lightIntensitySlider.setValue(Float(intensityValue), animated: true)
        }

    }

    // MARK: - Private Functions

    private func bind(to viewModel: LightViewModel) {
        viewModel.lightName = { [weak self] name in
            self?.navigationItem.title = name
        }
        viewModel.lightMode = { [weak self] mode in
            switch mode {
            case .off:
                self?.lightModeSwitch.setOn(false, animated: true)
            case .on:
                self?.lightModeSwitch.setOn(true, animated: true)
            }
        }
        viewModel.lightDeleteIconName = { [weak self] name in
            self?.deleteIconName = name
        }
        viewModel.lightIntensity = { [weak self] value in
            self?.lightIntensityLabel.text = value
        }
        viewModel.lightOnSwitchName = { [weak self] name in
            self?.modeOnLabel.text = name
        }
        viewModel.lightOffSwitchName = { [weak self] name in
            self?.modeOffLabel.text = name
        }
        viewModel.lightSaveButtonTilte = { [weak self] name in
            self?.lightSaveButton.setTitle(name, for: .normal)
        }
        viewModel.lightIntensityMaxImageName = { [weak self] name in
            self?.intensityMaxImageName = name
        }
        viewModel.lightIntensityMinImageName = { [weak self] name in
            self?.intensityMinImageName = name
        }
    }

    // MARK: - Selectors

    @objc private func didTapDeleteButton() {
        viewModel.didPressDeleteIconButton()
    }

    @objc private func didMoveIntensitySlider() {
        viewModel.didChangeLightIntensity(with: Int(lightIntensitySlider.value))
    }

    @objc private func modeSwitchValueDidChange() {
        viewModel.didChangeModeSwitchValue(withOnvalue: lightModeSwitch.isOn)
        if let nnn = Int(lightIntensityLabel.text ?? "") {
            lightIntensitySlider.setValue(Float(nnn), animated: true)
        }
    }

    @objc private func didTapSaveButton() {
        viewModel.saveNewDeviceSettings()
    }

    // MARK: - Configure UI

    private func setNavigationBar() {
        self.navigationItem.rightBarButtonItem  = deleteButton
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.tintColor = .black
    }

    private func setUI() {
        let safeArea = view.safeAreaLayoutGuide
        view.backgroundColor = .white
        //Light save button
        view.addSubview(lightSaveButton)
        lightSaveButton.anchor(bottom: safeArea.bottomAnchor,
                               paddingBottom: 15,
                               width: 100,
                               height: 60)
        lightSaveButton.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor).isActive = true

        //Light intensity slider
        view.addSubview(lightIntensitySlider)
        lightIntensitySlider.anchor(left: safeArea.leftAnchor,
                                    right: safeArea.rightAnchor,
                                    paddingLeft: 20, paddingRight: 20)
        lightIntensitySlider.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        lightIntensitySlider.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true

        //Light intensity label
        view.addSubview(lightIntensityLabel)
        lightIntensityLabel.anchor(top: lightIntensitySlider.bottomAnchor,
                                   paddingTop: 20,
                                   width: 60,
                                   height: 60)
        lightIntensityLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        //Mode view
        view.addSubview(modeVieww)

        modeVieww.anchor(top: safeArea.topAnchor,
                         paddingTop: 70,
                         width: 100,
                         height: 30)
        modeVieww.centerXAnchor.constraint(equalTo: lightIntensitySlider.centerXAnchor).isActive = true
    }

}



/// 2 ps


enum LightMode: String {
    case on = "ON"
    case off = "OFF"
}

final class LightViewModel {

    // MARK: - Private Properties

    private var device: DeviceItem
    private var repository: LightRepositoryType
    private weak var delegate: DevicesScreensDelegate?
    private var intensity = 10
    private var mode: LightMode? = .on {
        didSet {
            guard let mode = mode else { return }
            lightMode?(mode)
        }
    }

    
    
    // MARK: - Initializer

    init(device: DeviceItem,
         repository: LightRepositoryType,
         delegate: DevicesScreensDelegate?) {
        self.device = device
        self.repository = repository
        self.delegate = delegate
    }

    // MARK: - Outputs

    var lightName: ((String) -> Void)?
    var lightMode: ((LightMode) -> Void)?
    var lightIntensity: ((String) -> Void)?
    var lightDeleteIconName: ((String) -> Void)?
    var lightOnSwitchName: ((String) -> Void)?
    var lightOffSwitchName: ((String) -> Void)?
    var lightSaveButtonTilte: ((String) -> Void)?
    var lightIntensityMaxImageName: ((String) -> Void)?
    var lightIntensityMinImageName: ((String) -> Void)?

    // MARK: - Inputs

    func start() {
        lightName?("\(device.deviceName)")
        lightDeleteIconName?("dustbin")
        lightOnSwitchName?("on".localized)
        lightOffSwitchName?("off".localized)
        lightSaveButtonTilte?("save".localized)
        lightIntensityMaxImageName?("lightOn")
        lightIntensityMinImageName?("lightOff")
        defineLightAndIntensity(for: device)
    }

    func didPressDeleteIconButton() {
        delegate?.devicesScreensShouldDisplayMultiChoicesAlert(for: .deleteDevice) { [weak self] response in
            if response, let deviceId = self?.device.idNumber {
                self?.repository.deleteDevice(with: deviceId)
                self?.delegate?.devicesScreenDidSelectDeleteButton()
            }
        }
    }

    func didChangeLightIntensity(with value: Int) {
        if value == 0 {
            mode = .off
        } else {
            mode = .on
        }
        lightIntensity?("\(value)")
        intensity = value
    }

    func didChangeModeSwitchValue(withOnvalue: Bool) {
        guard withOnvalue else {
            mode = .off
            lightIntensity?("0")
            intensity = 0
            return
        }
        lightIntensity?("50")
        mode = .on
        intensity = 50
    }

    func saveNewDeviceSettings() {
        guard let mode = mode?.rawValue else { return }
        repository.updateDevice(with: device.idNumber,
                                mode: mode,
                                intensity: String(intensity))
        self.delegate?.devicesScreenDidSelectSaveButton()
    }

    func defineLightAndIntensity(for device: DeviceItem) {
        switch device.productType {
        case .light(let mode, let intensity):
            self.intensity = Int(intensity) ?? 0
            if mode == "ON" && intensity != "0" {
                self.mode = .on
                lightIntensity?("\(intensity)")
            } else {
                self.mode = .off
                lightIntensity?("\(intensity)")
            }
        default:
            return
        }
    }
}

/// 3pa


protocol LightRepositoryType {
    func deleteDevice(with deviceId: String)
    func updateDevice(with deviceId: String,
                      mode: String,
                      intensity: String)
}

final class LightRepository: LightRepositoryType {

    // MARK: - Properties

    private let dataBaseEngine: DataBaseEngine

    // MARK: - Init

    init( dataBaseEngine: DataBaseEngine) {
        self.dataBaseEngine = dataBaseEngine
    }

    // MARK: - LightRepositoryType

    func deleteDevice(with deviceId: String) {
        dataBaseEngine.deleteADevice(with: deviceId)
    }

    func updateDevice(with deviceId: String,
                      mode: String,
                      intensity: String) {
        dataBaseEngine.updateDeviceEntity(for: deviceId,
                                           mode: mode,
                                           intensity: intensity)
    }

}
*/

/*
class LightVC: UIViewController {
    
    private lazy var backBtn = UIButton()
    private lazy var lightImage = UIImageView()
    private lazy var nameLbl = UILabel()
    private lazy var slider = UISlider()
    private lazy var onBtn = UIButton()
    
    var mode = ""
    var intensity = 0
    var name = ""

    override func loadView() {
        super.loadView()
        
        setUpSubviews()
        setUpAutoLayout()
    }
    
    private func setUpSubviews() {
        view.backgroundColor = .white
        
        view.addSubview(backBtn)
        view.addSubview(lightImage)
        view.addSubview(nameLbl)
        view.addSubview(slider)
        view.addSubview(onBtn)
        
        backBtn.translatesAutoresizingMaskIntoConstraints = false
        lightImage.translatesAutoresizingMaskIntoConstraints = false
        nameLbl.translatesAutoresizingMaskIntoConstraints = false
        slider.translatesAutoresizingMaskIntoConstraints = false
        onBtn.translatesAutoresizingMaskIntoConstraints = false
        
        onBtn.setTitleColor(.black, for: .normal)
        onBtn.addTarget(self, action: #selector(onTapped), for: .touchUpInside)
        
        backBtn.setTitleColor(.black, for: .normal)
        backBtn.setTitle("Back", for: .normal)
        backBtn.addTarget(self, action: #selector(backTapped), for: .touchUpInside)
        
        lightImage.contentMode = .scaleAspectFit
        
        slider.maximumValue = 100
        slider.minimumValue = 0
        slider.isContinuous = true
        slider.setValue(Float(intensity), animated: true)
        
        nameLbl.textColor = .black
        nameLbl.text = name
        
        if mode == "ON" {
            lightImage.image = UIImage(named: "DeviceLightOnIcon")
            onBtn.setTitle("OFF", for: .normal)
        } else {
            lightImage.image = UIImage(named: "DeviceLightOffIcon")
            onBtn.setTitle("ON", for: .normal)
        }
    }
    
    private func setUpAutoLayout() {
        NSLayoutConstraint.activate([
            backBtn.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            backBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            
            lightImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            lightImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            lightImage.heightAnchor.constraint(equalToConstant: 150),
            lightImage.widthAnchor.constraint(equalToConstant: 150),
            
            nameLbl.topAnchor.constraint(equalTo: lightImage.bottomAnchor, constant: 30),
            nameLbl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            slider.topAnchor.constraint(equalTo: nameLbl.bottomAnchor, constant: 20),
            slider.leadingAnchor.constraint(equalTo: lightImage.leadingAnchor),
            slider.trailingAnchor.constraint(equalTo: lightImage.trailingAnchor),
            slider.heightAnchor.constraint(equalToConstant: 30),
            
            onBtn.topAnchor.constraint(equalTo: slider.bottomAnchor, constant: 30),
            onBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    @objc private func onTapped(_ sender: UIButton) {
        if sender.title(for: .normal) == "ON" {
            lightImage.image = UIImage(named: "DeviceLightOnIcon")
            onBtn.setTitle("OFF", for: .normal)
            slider.isHidden = false
        } else {
            lightImage.image = UIImage(named: "DeviceLightOffIcon")
            onBtn.setTitle("ON", for: .normal)
            slider.isHidden = true
        }
    }
    
    @objc private func backTapped() {
        dismiss(animated: true)
    }
}

*/
