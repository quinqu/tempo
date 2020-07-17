//
//  HeightViewController.swift
//  tempo
//
//  Created by Quinn Quintero on 7/13/20.
//  Copyright © 2020 Quinn Quintero. All rights reserved.
//

import UIKit

class HeightViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    var inches = [60, 60, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74]
    var index = -1
    var pickerData = ["5'0","5'1", "5'2","5'3","5'4","5'5","5'6","5'7","5'8","5'9", "5'10", "5'11", "6'0","6'1", "6'2"]
    //var userHeight =
    @IBOutlet weak var heightLabel: UILabel?
    @IBOutlet weak var picker: UIPickerView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker?.delegate = self
        picker?.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        pickerData[row]
//    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        return NSAttributedString(string: pickerData[row], attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        index = row
        heightLabel!.text = "You have selected \(pickerData[row])"
    }

    
    @IBAction func heightNextButtonPressed(_ sender: UIButton) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)

        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "speed_vc") as! SpeedViewController
        nextViewController.userHeight = inches[index]
        self.present(nextViewController, animated:true, completion:nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
