//
//  ViewController.swift
//  CoreBluetooth-Lab
//
//  Created by 김민준 on 2023/02/27.
//

import UIKit
import CoreBluetooth

class ViewController: UIViewController {
    
    let myPhoneIdentifier = "0F43B4FA-59D2-BA3C-0B97-E2D8EFE02E50"
    var centralManager: CBCentralManager!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // CBCentralManager 초기화
        centralManager = CBCentralManager(delegate: self, queue: nil)
    }
    
}

// MARK: - CBCentralManagerDelegate

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
            
            // 정상적으로 실행 될 때
        case .poweredOn:
            print("central.state: .poweredOn")
            
            // 주변 Peripheral device(데이터를 보낼 준비가 되어 있는 장치) 스캔
            centralManager.scanForPeripherals(withServices: nil)
            
        @unknown default:
            print("central.state: default case")
            
        }
    }
    
    // 스캔 정보 가져오기
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        
        // 민준씨의 아이폰만 찾기
        if peripheral.identifier.uuidString == myPhoneIdentifier {
            print(peripheral)
        }
        
    }
    
}

