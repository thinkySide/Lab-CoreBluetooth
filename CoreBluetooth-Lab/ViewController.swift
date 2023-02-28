//
//  ViewController.swift
//  CoreBluetooth-Lab
//
//  Created by 김민준 on 2023/02/27.
//

import UIKit
import CoreBluetooth

class ViewController: UIViewController {
    
    var centralManager: CBCentralManager!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // CBCentralManager 초기화
        centralManager = CBCentralManager(delegate: self, queue: nil)
    }


}

extension ViewController: CBCentralManagerDelegate {
    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        
        // Central(발신자) 상태에 따른 케이스
        switch central.state {
            
        case .unknown:
            print("central.state: .unknonw")
        case .resetting:
            print("central.state: .resetting")
        case .unsupported:
            print("central.state: .unsupported")
        case .unauthorized:
            print("central.state: .unauthorized")
        case .poweredOff:
            print("central.state: .poweredOff")
        case .poweredOn:
            print("central.state: .poweredOn")
        @unknown default:
            print("central.state: default case")
        }
        
    }
    
}

