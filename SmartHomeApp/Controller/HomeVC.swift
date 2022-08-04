//
//  ViewController.swift
//  SmartHome
//
//  Created by Марат Маркосян on 14.07.2022.
//

import UIKit


/*
class HomeVC: UIViewController {

    private lazy var devicesTable = UITableView()
    
    var manager = DataManager()
    var devices = [DeviceModel]()
    
    override func loadView() {
        super.loadView()
        
        setUpSubviews()
        setUpAutoLayout()
    }
    
    private func setUpSubviews() {
        view.backgroundColor = .white
        
        manager.delegate = self
        manager.fetchData()

        view.addSubview(devicesTable)
        
        devicesTable.delegate = self
        devicesTable.dataSource = self
        devicesTable.translatesAutoresizingMaskIntoConstraints = false
        devicesTable.register(CustomCell.self, forCellReuseIdentifier: "Reuse")
    }
    
    private func setUpAutoLayout() {
        NSLayoutConstraint.activate([
            devicesTable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            devicesTable.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            devicesTable.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            devicesTable.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }

    func showError(descr: String) {
        let alert = UIAlertController(title: "Error", message: descr, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .cancel) { (action) in
        }
        
        alert.addAction(alertAction)
        present(alert, animated: true)
        
    }

}

extension HomeVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    
        if devices[indexPath.row].type == "Light" {
            let lightVC = LightVC()
            lightVC.modalPresentationStyle = .fullScreen
            lightVC.mode = devices[indexPath.row].mode ?? "ON"
            lightVC.intensity = devices[indexPath.row].intensity ?? 0
            lightVC.name = devices[indexPath.row].name
            
            present(lightVC, animated: true)
        } else {
            let rollerVC = RollerVC()
            rollerVC.modalPresentationStyle = .fullScreen
            rollerVC.position = devices[indexPath.row].position ?? 0
            rollerVC.name = devices[indexPath.row].name
            
            present(rollerVC, animated: true)
        }
        
    }
    
}

extension HomeVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        devices.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Reuse") as? CustomCell {
            if devices[indexPath.row].type == "Light" {
                cell.setDeviceName(to: devices[indexPath.row].name)
            } else {
                cell.setNameAndPosition(name: devices[indexPath.row].name, position: devices[indexPath.row].position ?? 0)
            }
            return cell
        }
        return CustomCell()
    }
    
}

extension HomeVC: DataManagerDelegate {
    func didUpdateData(_ dataManager: DataManager, data: [DeviceModel]) {
        
        devices = data
        DispatchQueue.main.async {
            self.devicesTable.reloadData()
        }
        
    }
    
    func didFailWithError(error: Error) {
        
        showError(descr: error.localizedDescription)
        
    }
    
    
}

*/
