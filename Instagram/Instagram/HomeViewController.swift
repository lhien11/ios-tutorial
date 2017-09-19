//
//  HomeViewController.swift
//  Instagram
//
//  Created by Hien Le on 9/14/17.
//  Copyright © 2017 Hien Le. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
import SDWebImage

class HomeViewController: UIViewController {

    var posts = [Post]()
    @IBOutlet weak var tableView: UITableView!
    
    func loadPosts() {
        
        Database.database().reference().child("posts").observe(.childAdded) { (snapshot: DataSnapshot) in
            
           // print(snapshot.value!)
            if let dict = snapshot.value as? [String: Any] {
                let newPost = Post.transformPostPhoto(dict: dict)
                self.posts.append(newPost)
                self.tableView.reloadData()
            }
            
        }
        
    }
    @IBAction func logout_TouchUpInside(_ sender: Any) {
       // print(Auth.auth().currentUser!)
        
        do {
            try Auth.auth().signOut()
        } catch let logoutError {
            print("Error: \(logoutError)")
        }
        
        //print(Auth.auth().currentUser)
        
        let storyboard = UIStoryboard(name: "Start", bundle: nil)
        let signInVC = storyboard.instantiateViewController(withIdentifier: "SignInViewController")
        self.present(signInVC, animated: true, completion: nil)

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = 521
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.dataSource = self
        loadPosts()
                
        
    }

}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! HomeTableViewCell
        let post = posts[indexPath.row]
        cell.post = post 

        return cell
    }
}
