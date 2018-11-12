//
//  ViewController.swift
//  Task
//
//  Created by Sriram Prasad on 04/10/18.
//  Copyright © 2018 FullStackNet. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var monthdateBtn: UIButton!
    @IBOutlet weak var doneBtn: UIButton!
    @IBOutlet weak var monthandYearPicker: UIPickerView!
    
    
    let montharry = ["January","February","March","April","May","June","July","August","September","October","November","December"]
    let yearData = ["2010","2011","2012","2013","2014","2015","2016","2017","2018","2019","2020",]
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        monthandYearPicker.dataSource = self
        monthandYearPicker.delegate = self
    }

    
        @IBAction func selectMonthYearButton(_ sender: UIButton) {
            monthandYearPicker.isHidden = false
            doneBtn.isHidden = false
            monthdateBtn.alpha = 0
            
        }
    
    
    @IBAction func doneButton(_sender : UIButton){
        monthdateBtn.alpha = 1
        monthandYearPicker.isHidden = true
        doneBtn.isHidden = true
    }
    
}







extension ViewController : UIPickerViewDelegate,UIPickerViewDataSource {
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
      
        return 2
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0{
            return montharry.count
        }
        else {
            return yearData.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0{
            return montharry[row]
        }
        else {
            return yearData[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        var month = montharry[monthandYearPicker.selectedRow(inComponent: 0)]
        var year = yearData[monthandYearPicker.selectedRow(inComponent: 1)]
        
        if component == 0 {
            month = montharry[row]
            monthLabel.text = month
        }
        else {
            year = yearData[row]
            yearLabel.text = year
        }
    }

}
