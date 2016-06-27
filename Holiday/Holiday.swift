//
//  Holiday.swift
//  Holiday
//
//  Created by nk on 2016/06/28.
//  Copyright © 2016年 hattori. All rights reserved.
//

import Foundation

class Holiday {
    
    let dictionary = [
        "2016年01月01日":"元日",
        "2016年01月11日":"成人の日",
        "2016年02月11日":"建国記念の日",
        "2016年03月20日":"春分の日",
        "2016年03月21日":"振替休日",
        "2016年04月29日":"昭和の日",
        "2016年05月03日":"憲法記念日",
        "2016年05月04日":"みどりの日",
        "2016年05月05日":"こどもの日",
        "2016年07月18日":"海の日",
        "2016年08月11日":"山の日",
        "2016年09月19日":"敬老の日",
        "2016年09月22日":"秋分の日",
        "2016年10月10日":"体育の日",
        "2016年11月03日":"文化の日",
        "2016年11月23日":"勤労感謝の日",
        "2016年12月23日":"天皇誕生日"
    ]
    
    func sortedStrArr(strDic: Dictionary<String, String>) -> Array<String> {
        
        var arr: [String] = []
        for (key, _) in strDic {
            arr.append(key)
        }
        
        return arr.sort()
        
    }
}