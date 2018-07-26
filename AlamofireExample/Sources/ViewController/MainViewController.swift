//
//  MainViewController.swift
//  AlamofireExample
//
//  Created by giftbot on 2018. 7. 23..
//  Copyright © 2018년 giftbot. All rights reserved.
//

import UIKit
import Alamofire 
import Kingfisher

final class MainViewController: UIViewController {
 
    var objects :  [Post]  =  []
   
    let token = UserDefaults.standard.string(forKey: tokenKays)
    
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    getData() 
     
  }
    
    
    @IBAction func posthandle(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let postVC = storyboard.instantiateViewController(withIdentifier: "PostViewController")
        self.navigationController?.pushViewController(postVC, animated: true)
 
    }
    
    
 
    
  @IBAction private func logout(_ sender: Any) {
    self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil) 
   }
    func getData(){
        
    let apiURL = "https://api.lhy.kr/posts/"
    let MY_KEY = self.token
    let headers: HTTPHeaders = [
        "Authorization" : MY_KEY!,
        "Accept": "application/json"
    ]
    Alamofire.request(apiURL, method: .get, headers: headers)
        .validate(statusCode: 200..<400)
        .responseJSON { [weak self] response in
            switch(response.result)
            {
            case .success(_):
                if response.result.value != nil
                {
                    
                    let jsonData = response.data
                    do {
                         self?.objects = try JSONDecoder().decode([Post].self, from: jsonData!)
                    } catch {
                        print(error.localizedDescription)
                    }
                    
                }
                break
                
            case .failure(_):
                print(response.result.error!)
                break
            }
        }
    }
}


// MARK: - UITableViewDataSource

extension MainViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return objects.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
   
    cell.textLabel?.text = objects[indexPath.row].title
    cell.detailTextLabel?.text = objects[indexPath.row].cotent
    let imgurl = URL(string: objects[indexPath.row].imgcover)
    cell.imageView?.kf.setImage(with: imgurl)
    //imageView.kf.setImage(with: imgurl)
    //cell.imageView?.image = UIImage()
    return cell
  }
}
