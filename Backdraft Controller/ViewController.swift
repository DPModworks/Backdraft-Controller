//  ViewController.swift
//  Backdraft Controller
//
//  Created by Ben Pauza on 5/27/24.
//

import UIKit
import SwiftUI
import CoreBluetooth
   


class ViewController: UIViewController {
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    @ObservedObject private var bluetoothViewModel = BluetoothViewModel()
    var body: some View {
        NavigationView {
            List(bluetoothViewModel.peripheralNames, id: \.self) { peripheral in
                Text(peripheral)
            }
            .navigationTitle("Peripherals")
        }
    }
}


class BluetoothViewModel: NSObject, ObservableObject {
    private var centralManager: CBCentralManager?
    private var peripherals: [CBPeripheral] = []
    @Published var peripheralNames: [String] = []
    
    override init() {
        super.init()
        self.centralManager = CBCentralManager(delegate: self, queue: .main)
    }
}
extension BluetoothViewModel: CBCentralManagerDelegate {
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        if central.state == .poweredOn {
            self.centralManager?.scanForPeripherals(withServices: nil)
        }
    }
 
    func centralManager(_ central: CBCentralManager, didDiscover peripheral:
                        CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        if peripherals.contains(peripheral) {
            self.peripherals.append(peripheral)
            self.peripheralNames.append(peripheral.name ?? "unamed device")
        }
    }
}
