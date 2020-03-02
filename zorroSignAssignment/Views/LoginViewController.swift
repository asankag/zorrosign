//
//  ViewController.swift
//  zorroSignAssignment
//
//  Created by AZioT on 3/2/20.
//  Copyright © 2020 AZioT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var userNameTxt: UITextField!
    @IBOutlet weak var passworTxt: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func loginButtonAction(_ sender: Any) {
        guard let userName = userNameTxt.text else {
            return
        }
        guard let password = passworTxt.text else {
            return
        }
        loginAPIReqeust(userName: userName,password: password)
        
    }
    
    
    func loginAPIReqeust (userName:String, password:String) {
        
        
        let params = ["UserName":"tharushid20+s231@gmail.com",
                      "Password":"1qaz!QAZ",
                      "ClientId": "123456",
                      "ClientSecret":"abcdef",
                      "DoNotSendActivationMail" : false] as [String : Any]
        
        var request = URLRequest(url: URL(string: "https://zswebuserqa.entrusttitle.net/api/Account/Login")!)
        request.httpMethod = "POST"
        request.httpBody = try? JSONSerialization.data(withJSONObject: params, options: [])
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            print(response!)
            do {
                let json = try JSONSerialization.jsonObject(with: data!) as! Dictionary<String, AnyObject>
                print(json)
            } catch {
                print("error")
            }
        })
        
        task.resume()
    }
}

