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
        formatter.dateFormat = "2016年05月04日"
        let currentDate = formatter.stringFromDate(NSDate())
        let holidayArr = holidays.getStrArr(holidays.dictionary)
        
        for holiday in holidayArr.sort() {
            
            if currentDate < holiday {
                setDisplay(holidays.dictionary, keyDate: holiday)
                break
            }
            
        }
        
    }
    
    override func viewDidAppear(animated: Bool) {
        
        labelContainerView.alpha = 0.0
        labelContainerView.fadeIn(0.6, delay: 1.0) { (finished) in
            self.labelContainerView.fadeOut(0.3, delay: 2.3, completion: nil)
        }
        
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
        
        if labelContainerView.alpha == 0.0 {
           labelContainerView.fadeIn(0.6, delay: 0, completion: { (finished) in
            self.labelContainerView.fadeOut(0.3, delay: 1.8, completion: nil)
           })
        }
        
    }
    
}



extension UIView {
    
    func fadeOut(duration: NSTimeInterval, delay: NSTimeInterval, completion: ((finished: Bool) -> Void)?) {
        UIView.animateWithDuration(
            duration,
            delay: delay,
            options: UIViewAnimationOptions.CurveEaseIn,
            animations: {
                self.alpha = 0.0
            },
            completion: completion)
    }
    
    func fadeIn(duration: NSTimeInterval, delay: NSTimeInterval, completion: ((finished: Bool)->Void)?) {
        UIView.animateWithDuration(
            duration,
            delay: delay,
            options:UIViewAnimationOptions.CurveEaseIn,
            animations: {
                self.alpha = 1.0
            },
            completion: completion)
    }
    
    func fadeInOut(duration: NSTimeInterval, delay: NSTimeInterval, completion: ((finished: Bool) -> Void)?) {
        UIView.animateWithDuration(
            duration,
            delay: delay,
            options: UIViewAnimationOptions.CurveEaseInOut,
            animations: {
                self.alpha = 1.0
            },
            completion: completion)
    }
    
}