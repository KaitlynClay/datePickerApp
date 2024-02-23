//
//  ViewController.swift
//  datePickerApp
//
//  Created by student on 2/22/24.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
            case 0: return componentOne.count
            case 1: return componentTwo.count
        default: return componentThree.count
        }
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
            case 0: return componentOne[row]
            case 1: return componentTwo[row]
        default: return componentThree[row]
        }
    }
    
    

    @IBOutlet weak var myPicker2: UIPickerView!
    var componentOne: [String] = [String]()
    var componentTwo: [String] = [String]()
    var componentThree: [String] = [String]()
    
    @IBOutlet weak var myDatePicker: UIDatePicker!
    let dateFormatter: DateFormatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short
        
        myPicker2.delegate = self
        myPicker2.dataSource = self
        componentOne = ["cat", "dog", "horse", "cow", "goat", "sheep"]
        componentTwo = ["house", "apartment", "barn", "pasture", "stall"]
        componentThree = ["outdoor", "indoor"]
    }

    

    
        
    func ShowAlert(dateTime: String) {
        let alert = UIAlertController(title: "Selected Date and Time", message: "\(dateTime)", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: {action -> Void in})
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    

    @IBAction func getCurDateTime(_ sender: UIButton) {
        let selectedDate: String = dateFormatter.string(from:myDatePicker.date)
        ShowAlert(dateTime: selectedDate)
    }
    
    @IBAction func dateChanged(_ sender: UIDatePicker) {
        let selectedDate: String = dateFormatter.string(from: sender.date)
        ShowAlert(dateTime: selectedDate)
    }
    
    @IBAction func btnTapped2(_ sender: UIButton) {
        let petIndex = myPicker2.selectedRow(inComponent: 0)
        let homeIndex = myPicker2.selectedRow(inComponent: 1)
        let placeIndex = myPicker2.selectedRow(inComponent: 2)
        
        let alert = UIAlertController(title: "Your Choice", message: "\(componentOne[petIndex]), \(componentTwo[homeIndex]), \(componentThree[placeIndex])", preferredStyle: .alert)
        
        let okAction2 = UIAlertAction(title: "OK", style: .default, handler: {action -> Void in})
        alert.addAction(okAction2)
        self.present(alert, animated: true, completion: nil)
    }
}

