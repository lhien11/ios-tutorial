//
//  CommentViewController.swift
//
//
//  Created by Hien Le on 9/20/17.
//
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class CommentViewController: UIViewController {
    
    let postId = "-KuPhj5mr98VtT7p9box"
    var comments = [Comment]()
    var users = [User]()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var commentTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sendButton.setTitleColor(UIColor.red, for: UIControlState.normal)
        sendButton.isEnabled = false
        tableView.dataSource = self
        tableView.estimatedRowHeight = 77
        tableView.rowHeight = UITableViewAutomaticDimension
        empty()
        handleTextField()
        loadComments()
    }
    
    func loadComments(){
        let postCommentRef = Database.database().reference().ref.child("post-comments").child(self.postId)
        postCommentRef.observe(.childAdded, with: {
            snapshot in
            
            print("observer keys: \(snapshot.key)")
            Database.database().reference().child("comments").child(snapshot.key).observeSingleEvent(of: .value, with: {
                snapshotComment in
                
                if let dict = snapshotComment.value as? [String: Any] {
                    let newComment = Comment.transformPostPhoto(dict: dict)
                    self.fetchUser(uid: newComment.uid!, completed: {
                        self.comments.append(newComment)
                        self.tableView.reloadData()
                        
                    })
                }
            })
        })
    }
    
    func fetchUser(uid: String, completed:  @escaping () -> Void ) {
        Database.database().reference().child("users").child(uid).observeSingleEvent(of: DataEventType.value, with: {
            snapshot in
            if let dict = snapshot.value as? [String: Any] {
                let user = User.transformUser(dict: dict)
                self.users.append(user)
                completed()
            }
        })
    }
    
    func handleTextField() {
        commentTextField.addTarget(self, action: #selector(self.textFieldDidChange), for: UIControlEvents.editingChanged)
    }
    
    func textFieldDidChange() {
        if let commentText = commentTextField.text, !commentText.isEmpty {
            sendButton.setTitleColor(UIColor.green, for: UIControlState.normal)
            sendButton.isEnabled = true
            return
        }
        sendButton.setTitleColor(UIColor.red, for: UIControlState.normal)
        sendButton.isEnabled = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
    }
    
    
    @IBAction func sendButton_TouchUpInside(_ sender: Any) {
        var ref: DatabaseReference!
        ref = Database.database().reference()
        let commentReference = ref.child("comments")
        let newCommentId = commentReference.childByAutoId().key
        let newCommentReference = commentReference.child(newCommentId)
        guard let currentUser = Auth.auth().currentUser else  {
            return
        }
        let currentUserId = currentUser.uid
        
        newCommentReference.setValue(["uid": currentUserId, "commentText": commentTextField.text!]) { (error, ref) in
            if error != nil {
                ProgressHUD.showError(error!.localizedDescription)
                return
            }
            let postCommentRef = Database.database().reference().ref.child("post-comments").child(self.postId).child(newCommentId)
            postCommentRef.setValue(true, withCompletionBlock: { (error , ref) in
                if error != nil {
                    ProgressHUD.showError(error!.localizedDescription)
                }
            })
            self.empty()
            
        }
        
    }
    
    func empty() {
        commentTextField.text = ""
        sendButton.setTitleColor(UIColor.red, for: UIControlState.normal)
        sendButton.isEnabled = false
    }
    
}

extension CommentViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CommentCell", for: indexPath) as! CommentTableViewCell
        let comment = comments[indexPath.row]
        let user = users[indexPath.row]
        cell.comment = comment
        cell.users = user
        
        return cell
    }
}
