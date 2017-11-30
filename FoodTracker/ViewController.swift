//
//  ViewController.swift
//  FoodTracker
//
//  Created by 朱佳滨 on 26/11/2017.
//  Copyright © 2017 Jiabin Zhu. All rights reserved.
//

import UIKit
import Surge
// Mark: ax^m + by^n + cz^l = d
// Mark: z = l_sqrt((d - ax^m - by^n) / c)
struct ComputeModel {
    var a = 0.0;
    var b = 0.0;
    var c = 0.0;
    var m = 0.0;
    var n = 0.0;
    var l = 0.0;
    var d = 0.0;
}
func compute(cmodel: ComputeModel, x: Double, y: Double) -> Array<Double> {
    assert(cmodel.m >= 0 && cmodel.n >= 0 && cmodel.l >= 0, "Invalid parameter");
    let x1 = [x];
    let y1 = [y];
    let p1 = cmodel.a * (pow(x1, cmodel.m)[0]);
    let p2 = cmodel.b * (pow(y1, cmodel.n)[0]);

    let p3 = (cmodel.d - p1 - p2) / cmodel.c;
    let p4 = [p3];

    var z = pow(p4, 1/cmodel.l);
    if (z[0].isNaN && Int(cmodel.l) % 2 == 1 && p3 < 0) {
        let p4_negative = [-p3]
        let temp = pow(p4_negative, 1/cmodel.l)[0];
        z = [-temp];
    }
    if(Int(cmodel.l) % 2 == 0){
        z.append(-z[0])
    }
    return z;
}

class ViewController: UIViewController {
    
    // Mark: properties
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var mealNameLabel: UILabel!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // Mark: action
    @IBAction func setDefaultMealName(_ sender: UIButton) {
        // TEST:
//        let cm = ComputeModel(a:1.0, b:2.0, c:3.0, m:2.0, n:3.0, l:3.0, d:1200.0);
//        let z = compute(cmodel:cm, x:4.0, y:5.0);
//        mealNameLabel.text = String(describing:z)
//
        // TEST:
//        let cm2 = ComputeModel(a:1.0, b:1.0, c:1.0, m:2.0, n:2.0, l:1.0, d:6.0);
//        let xy_range = [-4.0, -3.0, -2.0, -1.0, 0, 1.0, 2.0, 3.0, 4.0];
//        var z_vals = [Double]();
//        for x_val in xy_range {
//            for y_val in xy_range{
//                let z = compute(cmodel:cm2, x:x_val, y:y_val);
//                z_vals.append(z);
//            }
//        }
//        print(z_vals);
//        mealNameLabel.text = String(describing:z_vals)
        // TEST: pos, negative z values
//        let cm3 = ComputeModel(a:1.0, b:1.0, c:1.0, m:2.0, n:2.0, l:2.0, d:600.0);
//        let xy_range3 = [-4.0, -3.0, -2.0, -1.0, 0, 1.0, 2.0, 3.0, 4.0];
//        for x_val in xy_range3 {
//            for y_val in xy_range3{
//                let z = compute(cmodel:cm3, x:x_val, y:y_val);
//                print(z)
//            }
//        }
//        print(z_vals3);
//        mealNameLabel.text = String(describing:z_vals3)
        // TEST: negative sqrt
        let cm4 = ComputeModel(a:1.0, b:1.0, c:1.0, m:2.0, n:2.0, l:3.0, d:0.0);
        let xy_range4 = [-4.0, -3.0, -2.0, -1.0, 0, 1.0, 2.0, 3.0, 4.0];
        for x_val in xy_range4 {
            for y_val in xy_range4{
                let z = compute(cmodel:cm4, x:x_val, y:y_val);
                print(z)
            }
        }
    }
    
}

