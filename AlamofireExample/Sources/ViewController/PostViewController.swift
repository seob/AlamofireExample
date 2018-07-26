//
//  PostViewController.swift
//  AlamofireExample
//
//  Created by giftbot on 2018. 7. 23..
//  Copyright © 2018년 giftbot. All rights reserved.
//

import UIKit
import Alamofire

final class PostViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
     view.backgroundColor = .white
    //setupTextField()
    
  }
    

    
    
    
    func postWithimage(){
        let urlString = "https://api.graygram.com/posts"
        let headers: HTTPHeaders = [
            "Accept": "application/json",
            ]
        
//        Alamofire.upload(
//            multipartFormData: { formData in
//                if let imageData = UIImageJPEGRepresentation(image, 1) {
//                    formData.append(imageData, withName: "photo", fileName: "photo.jpg", mimeType: "image/jpeg")
//                }
//                if let messageData = message?.data(using: .utf8) {
//                    formData.append(messageData, withName: "message")
//                }
//        },
//            to: urlString,
//            headers: headers,
//            encodingCompletion: { result in
//                switch result {
//                case .success(let request, _, _): // Request 인코딩 성공
//                    request // 실제 HTTP 요청
//                        .validate(statusCode: 200..<400)
//                        .responseJSON { response in
//                            print(response)
//                    }
//                    
//                case .failure(let error): // Request 인코딩 실패
//                    print(error)
//                }
//        }
//        )
    }
    
  @IBAction private func createPost(_ sender: UIButton) {
    makePost()
  }
  
  @IBAction private func createPostWithImage(_ sender: UIButton) {
    
  }
    
    func makePost() {
        let todopoint = "https://api.lhy.kr/posts/"
        let title = "test title"
        let content = "testtesttesttest"
        
        let parameters: [String: Any] = [
            "title": title,
            "content": content,
            ]
        let MY_KEY = "Token 05957ab279e5208cb8d68a434b08a38ff742a411"
        let headers: HTTPHeaders = [
            "Authorization": MY_KEY,
            "Accept": "application/json"
        ]
        Alamofire
            .request(todopoint, method: .post, parameters: parameters, headers: headers)
            .validate(statusCode: 200..<400)
            .responseJSON { [weak self] response in
                switch(response.result)
                {
                case .success(_):
                    if response.result.value != nil
                    {
                        print("\n ----------- [success] ----------- \n")
                        // self?.dismiss(animated: true, completion: nil)
                    }
                    break
                    
                case .failure(_):
                    print(response.result.error!)
                    break
                }
        }
    }
}
