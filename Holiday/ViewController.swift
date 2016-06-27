//
//  ViewController.swift
//  Holiday
//
//  Created by nk on 2016/06/27.
//  Copyright © 2016年 hattori. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var nextHolidayLabel: UILabel!
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var labelContainerView: UIView!

    
    let holidays = Holiday()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let formatter = NSDateFormatter()
        formatter.dateFormat = "2016年05月05日"
        let currentDate = formatter.stringFromDate(NSDate())
        let holidaysArr = holidays.sortedStrArr(holidays.dictionary)
        
        for holiday in holidaysArr {
            if currentDate < holiday {
                setDisplay(holidays.dictionary, keyDate: holiday)
                break
            }
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        labelContainerView.hidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setDisplay(holidayDic: Dictionary<String, String>, keyDate: String) {
        
        dateLabel.text = "\(keyDate)"
        
        if let keydate = holidayDic[keyDate] {
            nextHolidayLabel.text = "\(keydate)"
            backgroundImageView.image = UIImage(named: "\(keydate)")
            
        }
    }

    @IBAction func appearButtonTapped(sender: AnyObject) {
        print("button tapped")
        if labelContainerView.hidden == true {
           labelContainerView.hidden = false
        }
    }


}

