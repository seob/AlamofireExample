//
//  SignUpViewController.swift
//  AlamofireExample
//
//  Created by giftbot on 2018. 7. 22..
//  Copyright © 2018년 giftbot. All rights reserved.
//

import UIKit
import Alamofire

final class SignUpViewController: UIViewController {
  
  @IBOutlet private weak var usernameTextField: UITextField!
  @IBOutlet private weak var passwordTextField: UITextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    usernameTextField.becomeFirstResponder()
    
    
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    view.endEditing(true)
  }
  
  @IBAction private func requestSignUp(_ sender: Any) {
    checkValue()
    //dismiss(animated: true, completion: nil)
  }
  
  deinit {
    print("\(self) has deinitialized")
  }
    func checkValue(){
        guard let username = usernameTextField.text , !username.isEmpty,
            let userpwd = passwordTextField.text , !userpwd.isEmpty
        else {
            
             self.alertWithTitle(title: "알림", message: "이메일 혹은 패스워드를 입력해주세요", ViewController: self, toFocus: self.usernameTextField, showpage: 1)
            return
        }
        makePostCall()
    }
    
    
    func makePostCall() {
        let username = (self.usernameTextField.text)!
        let userpwd = (self.passwordTextField.text)!
        
        let urlString = "https://api.lhy.kr/members/signup/"
        let parameters: [String: Any] = [
            "username": username,
            "password": userpwd,
            ]
        let headers: HTTPHeaders = [
            "Accept": "application/json"
        ]
        
        
        Alamofire
            .request(urlString, method: .post, parameters: parameters, headers: headers)
            .validate(statusCode: 200..<400)
            .responseJSON { [weak self] response in
                
                print(response)
                switch(response.result)
                {
                case .success(_):
                    if response.result.value != nil
                    {  
                        self?.dismiss(animated: true, completion:nil) 
                    }
                    break
                    
                case .failure(_):
                    print(response.result.error!)
                    break
                }
        }
    }
}


extension SignUpViewController {
    /**************************************************************
     comment
     UiAlertController 함수 정의
     alertWithTitle(title: String!, message: String, ViewController: UIViewController, toFocus:UITextField, showpage: Int)
     showpage 가 1 일경우 경고창 , 2 일경우 다음페이지로 이동
     **************************************************************/
    func alertWithTitle(title: String!, message: String, ViewController: UIViewController, toFocus:UITextField, showpage: Int) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel,handler: {_ in
            switch showpage {
                //        case 2:
                //            let registVC = RegistViewController()
                //            self.present(registVC, animated: true) {
                //                registVC.resultLabel.text = "\(User.userId) 님 환영합니다."
            //            }
            default:
                toFocus.becomeFirstResponder()
            }
        });
        
        alert.addAction(action)
        ViewController.present(alert, animated: true, completion:nil)
    }
    
    
}
