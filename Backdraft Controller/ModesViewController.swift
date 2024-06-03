//
//  ModesViewController.swift
//  Backdraft Controller
//
//  Created by Ben Pauza on 5/27/24.
//

import UIKit
import SwiftUI
import CoreBluetooth



    

class ModesTableViewController: UITableViewController{
    var centralManager: CBCentralManager!
    func startScanning() -> Void {
      // Start Scanning
      centralManager?.scanForPeripherals(withServices: [CBUUIDs.BLEService_UUID])
    }
    
    
    let FcuParamsPreset1 = FcuParams(primaryMode: 0, secondaryMode: 3, tertiaryMode: 4, dwell1: 20, dwell2: 20, dwell3: 20, stiction: 0, stictionTimer: 0, delay1: 30, delay2: 40, delay3: 50, tracer: 0, tracerAlwaysOn: 0, tracerPreDelay: 0, tracerOnTime: 0, magwind: 0, magwindPreDelay: 0, magwindOnTime: 0, randomDelay: 0)
    
    @IBAction func fireMode1Selection(_ sender: UITableViewCell) {
        if fireMode1Selection.currentTitle == "Disable"{
            print("1 disable selected")
        }
    }
    
    @IBOutlet weak var presetSelector: UIButton!
    
    @IBAction func writeFcuButtonAction(_ sender: UIButton) {
        print("write to fcu")
    }
    @IBOutlet var modesTableView: UITableView!
    
    @IBOutlet weak var dwell1Cell: UITableViewCell!
    @IBOutlet weak var delay1Cell: UITableViewCell!
    @IBOutlet weak var rof1Cell: UITableViewCell!
    
    @IBOutlet weak var dwell2Cell: UITableViewCell!
    @IBOutlet weak var delay2Cell: UITableViewCell!
    @IBOutlet weak var rof2Cell: UITableViewCell!
    
    
    @IBOutlet weak var dwell3Cell: UITableViewCell!
    @IBOutlet weak var delay3Cell: UITableViewCell!
    @IBOutlet weak var rof3Cell: UITableViewCell!
    
    
    @IBOutlet weak var fireMode1Selection: UIButton!
    @IBOutlet weak var fireMode1Info: UIButton!
    @IBOutlet weak var dwell1Info: UIButton!
    @IBOutlet weak var delay1Info: UIButton!
    @IBOutlet weak var Dwell1Value: UILabel!
    @IBOutlet weak var dwell1Stepper: UIStepper!
    
    @IBAction func dwell1StepperAction (_ sender: UIStepper){
        
        Dwell1Value.text = String(dwell1Stepper.value)+"ms"
        primaryRofValue.text = String(Int(1000/(dwell1Stepper.value+delay1Stepper.value)))+"rps"
    }
    @IBOutlet weak var delay1Value: UILabel!
    @IBOutlet weak var delay1Stepper: UIStepper!
    @IBAction func delay1Stepper(_ sender: UIStepper) {
        delay1Value.text = String(delay1Stepper.value)+"ms"
        primaryRofValue.text = String(Int(1000/(dwell1Stepper.value+delay1Stepper.value)))+"rps"
    }
    @IBOutlet weak var primaryRofInfo: UIButton!
    @IBOutlet weak var primaryRofValue: UILabel!
    ///
    @IBOutlet weak var fireMode2Selection: UIButton!
    @IBOutlet weak var fireMode2Info: UIButton!
    @IBOutlet weak var dwell2Info: UIButton!
    @IBOutlet weak var delay2Info: UIButton!
    @IBOutlet weak var rof2Info: UIButton!
    @IBOutlet weak var dwell2value: UILabel!
    @IBOutlet weak var dwell2stepper: UIStepper!
    @IBAction func dwell2StepperAction(_ sender: UIStepper) {
        dwell2value.text = String(dwell2stepper.value)+"ms"
        rof2Value.text = String(Int(1000/(dwell2stepper.value+delay2Stepper.value)))+"rps"
    }
    @IBOutlet weak var delay2Value: UILabel!
    @IBOutlet weak var delay2Stepper: UIStepper!
    @IBAction func delay2StepperAction(_ sender: UIStepper) {
        delay2Value.text = String(delay2Stepper.value)+"ms"
        rof2Value.text = String(Int(1000/(dwell2stepper.value+delay2Stepper.value)))+"rps"
    }
    @IBOutlet weak var rof2Value: UILabel!
    //
    @IBOutlet weak var fireMode3Selection: UIButton!
    @IBOutlet weak var fireMode3Info: UIButton!
    @IBOutlet weak var dwell3Info: UIButton!
    @IBOutlet weak var delay3Info: UIButton!
    @IBOutlet weak var dwell3Value: UILabel!
    @IBOutlet weak var delay3Value: UILabel!
    @IBOutlet weak var rof3Value: UILabel!
    @IBOutlet weak var rof3Info: UIButton!
    @IBOutlet weak var dwell3Stepper: UIStepper!
    @IBAction func dwell3StepperAction(_ sender: UIStepper) {
        dwell3Value.text = String(dwell3Stepper.value)+"ms"
        rof3Value.text = String(Int(1000/(dwell3Stepper.value+delay3Stepper.value)))+"rps"
    }
    @IBOutlet weak var delay3Stepper: UIStepper!
    @IBAction func delay3StepperAction(_ sender: UIStepper) {
        delay3Value.text = String(delay3Stepper.value)+"ms"
        rof3Value.text = String(Int(1000/(dwell3Stepper.value+delay3Stepper.value)))+"rps"
    }
    
    
    @IBOutlet weak var mode1Binary: UICommand!
    override func viewDidLoad() {
        
        
        
        dwell1Stepper.value = Double(FcuParamsPreset1.dwell1)
        delay1Stepper.value = Double(FcuParamsPreset1.delay1)
        
        dwell2stepper.value = Double(FcuParamsPreset1.dwell2)
        delay2Stepper.value = Double(FcuParamsPreset1.delay2)
        
        dwell3Stepper.value = Double(FcuParamsPreset1.dwell3)
        delay3Stepper.value = Double(FcuParamsPreset1.delay3)
        
        super.viewDidLoad()
        
        
        centralManager = CBCentralManager(delegate: self, queue: nil)
        
        
        tableView.beginUpdates()
        tableView.endUpdates()
        setupInfoButtons()
        setupSelectorButtons()
        setupSteppers()
  
        (fireMode1Selection.menu!.children[FcuParamsPreset1.primaryMode] as? UIAction)?.state = .on
        (fireMode2Selection.menu!.children[FcuParamsPreset1.secondaryMode] as? UIAction)?.state = .on
        (fireMode3Selection.menu!.children[FcuParamsPreset1.tertiaryMode] as? UIAction)?.state = .on
        
        
        
        primaryRofValue.text = String(Int(1000/(dwell1Stepper.value+delay1Stepper.value)))+"rps"
        rof2Value.text = String(Int(1000/(dwell2stepper.value+delay2Stepper.value)))+"rps"
        rof3Value.text = String(Int(1000/(dwell3Stepper.value+delay3Stepper.value)))+"rps"
        
    }
    
    func setupInfoButtons() {
        let popUpButtonClosure = { (action: UIAction) in
            print("Pop-up action")
        }
        fireMode1Info.menu = UIMenu(children: [
            UIAction(title: "Mode for the first fire control position", handler: popUpButtonClosure),])
        dwell1Info.menu = UIMenu(children: [
            UIAction(title: "Solenoid open time (0-100ms)",handler: popUpButtonClosure),])
        delay1Info.menu = UIMenu(children: [
            UIAction(title: "Minimum time between shots (30-250ms)", handler: popUpButtonClosure),])
        primaryRofInfo.menu = UIMenu(children: [
            UIAction(title: "Rounds per second (max)", handler: popUpButtonClosure),])
        
        fireMode2Info.menu = UIMenu(children: [
            UIAction(title: "Mode for the second fire control position", handler: popUpButtonClosure),])
        dwell2Info.menu = UIMenu(children: [
            UIAction(title: "Solenoid open time (0-100ms)", handler: popUpButtonClosure),])
        delay2Info.menu = UIMenu(children: [
            UIAction(title: "Minimum time between shots (30-250ms)", handler: popUpButtonClosure),])
        rof2Info.menu = UIMenu(children: [
            UIAction(title: "Rounds per second (max)", handler: popUpButtonClosure),])
        
        fireMode3Info.menu = UIMenu(children: [
            UIAction(title: "Mode for the third fire control position", handler: popUpButtonClosure),])
        dwell3Info.menu = UIMenu(children: [
            UIAction(title: "Solenoid open time (0-100ms)", handler: popUpButtonClosure),])
        delay3Info.menu = UIMenu(children: [
            UIAction(title: "Minimum time between shots (30-250ms)", handler: popUpButtonClosure),])
        rof3Info.menu = UIMenu(children: [
            UIAction(title: "Rounds per second (max)", handler: popUpButtonClosure),])
    }

    func setupSelectorButtons() {
        let popUpButtonClosure = { (action: UIAction) in
            if self.fireMode1Selection.currentTitle == "Disable" {
                print("primary disabled")
                self.delay1Cell.isHidden = true
                self.rof1Cell.isHidden = true
                self.dwell1Cell.isHidden = true
            }
            else {
                self.dwell1Cell.isHidden = false
                self.delay1Cell.isHidden = false
                self.rof1Cell.isHidden = false
            }
            if self.fireMode2Selection.currentTitle == "Disable" {
                print("secondary disabled")
                self.dwell2Cell.isHidden = true
                self.delay2Cell.isHidden = true
                self.rof2Cell.isHidden = true
            }
            else {
                self.dwell2Cell.isHidden = false
                self.delay2Cell.isHidden = false
                self.rof2Cell.isHidden = false
            }
            if self.fireMode3Selection.currentTitle == "Disable" {
                print("tertiary disabled")
                self.dwell3Cell.isHidden = true
                self.delay3Cell.isHidden = true
                self.rof3Cell.isHidden = true
            }
            else {
                self.dwell3Cell.isHidden = false
                self.delay3Cell.isHidden = false
                self.rof3Cell.isHidden = false
            }
            self.tableView.beginUpdates()  //makes the cells update wrt the extension
            self.tableView.endUpdates()
            print("Pop-up action")
        }
        presetSelector.menu = UIMenu(children: [
            UIAction(title: "Preset 1", handler: popUpButtonClosure),

        ])
        fireMode1Selection.menu = UIMenu(children: [
            UIAction(title: "Single", handler: popUpButtonClosure),
            UIAction(title: "Binary" ,handler: popUpButtonClosure),
            UIAction(title: "Burst", handler: popUpButtonClosure),
            UIAction(title: "Auto", handler: popUpButtonClosure),
            UIAction(title: "Disable", discoverabilityTitle: "Disable", handler: popUpButtonClosure),
        ])
        fireMode2Selection.menu = UIMenu(children: [
            UIAction(title: "Single", handler: popUpButtonClosure),
            UIAction(title: "Binary", handler: popUpButtonClosure),
            UIAction(title: "Burst", handler: popUpButtonClosure),
            UIAction(title: "Auto", handler: popUpButtonClosure),
            UIAction(title: "Disable", handler: popUpButtonClosure),
        ])
        fireMode3Selection.menu = UIMenu(children: [
            UIAction(title: "Single", handler: popUpButtonClosure),
            UIAction(title: "Binary", handler: popUpButtonClosure),
            UIAction(title: "Burst", handler: popUpButtonClosure),
            UIAction(title: "Auto", handler: popUpButtonClosure),
            UIAction(title: "Disable", handler: popUpButtonClosure),
        ])
    }
    
    func setupSteppers (){
        Dwell1Value.text = String(dwell1Stepper.value)+"ms"
        delay1Value.text = String(delay1Stepper.value)+"ms"
        dwell2value.text = String(dwell2stepper.value)+"ms"
        delay2Value.text = String(delay2Stepper.value)+"ms"
        dwell3Value.text = String(dwell3Stepper.value)+"ms"
        delay3Value.text = String(delay3Stepper.value)+"ms"
    }
}

extension ModesTableViewController{  //this handles hiding rows when disabled is selected
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath {
        case IndexPath(row:1, section: 1):
            return self.fireMode1Selection.currentTitle == "Disable" ? 0 : 44
        case IndexPath(row:2, section: 1):
            return self.fireMode1Selection.currentTitle == "Disable" ? 0 : 44
        case IndexPath(row:3, section: 1):
            return self.fireMode1Selection.currentTitle == "Disable" ? 0 : 44
        case IndexPath(row:1, section: 2):
            return self.fireMode2Selection.currentTitle == "Disable" ? 0 : 44
        case IndexPath(row:2, section: 2):
            return self.fireMode2Selection.currentTitle == "Disable" ? 0 : 44
        case IndexPath(row:3, section: 2):
            return self.fireMode2Selection.currentTitle == "Disable" ? 0 : 44
        case IndexPath(row:1, section: 3):
            return self.fireMode3Selection.currentTitle == "Disable" ? 0 : 44
        case IndexPath(row:2, section: 3):
            return self.fireMode3Selection.currentTitle == "Disable" ? 0 : 44
        case IndexPath(row:3, section: 3):
            return self.fireMode3Selection.currentTitle == "Disable" ? 0 : 44
        default:
            return 44
        }
    }
}

extension ModesTableViewController: CBCentralManagerDelegate {

  func centralManagerDidUpdateState(_ central: CBCentralManager) {
    
     switch central.state {
          case .poweredOff:
              print("Is Powered Off.")
          case .poweredOn:
              print("Is Powered On.")
              startScanning()
          case .unsupported:
              print("Is Unsupported.")
          case .unauthorized:
          print("Is Unauthorized.")
          case .unknown:
              print("Unknown")
          case .resetting:
              print("Resetting")
          @unknown default:
            print("Error")
          }
  }
}

extension ModesTableViewController: CBPeripheralDelegate {
}









