//
//  HeightViewController.swift
//  tempo
//
//  Created by Quinn Quintero on 7/13/20.
//  Copyright © 2020 Quinn Quintero. All rights reserved.
//

import UIKit

class HeightViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    var pickerData = ["60", "61", "62","63", "64", "65", "66", "67", "68","69", "70", "71", "72", "73", "74"]
    // TODO: create another array with value in incches instead for data passing


    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var picker: UIPickerView!
    
    
    override func viewDidLoad() {
        print("hello")
        super.viewDidLoad()
        picker.delegate = self
        picker.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        heightLabel.text = "You have selected \(pickerData[row])"
    }

//    
//    @IBAction func heightNextButtonPressed(_ sender: UIButton) {
//        performSegue(withIdentifier: "tohomepage", sender: self)
//    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
