//
//  GGMainLoginVC.swift
//  GG
//
//  Created by Yannick Lawler on 18.04.21.
//

import UIKit

class GGMainLoginVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func signUpButtonTapped(_ sender: UIButton) {
        self.performSegue(withIdentifier: "SignUpButtonSegue", sender: self)
    }
}
