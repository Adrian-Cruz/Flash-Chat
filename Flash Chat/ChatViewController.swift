//
//  ViewController.swift
//  Flash Chat
//
//  Created by Adrian on 29/08/2015.
//  Copyright (c) 2015 AdrianCruz. All rights reserved.
//

import UIKit
import Firebase
import ChameleonFramework


class ChatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    // Declare instance variables here
    var messageArray : [Message] = [Message]()
    
    // We've pre-linked the IBOutlets
    @IBOutlet var heightConstraint: NSLayoutConstraint!
    @IBOutlet var sendButton: UIButton!
    @IBOutlet var messageTextfield: UITextField!
    @IBOutlet var messageTableView: UITableView!
    
    var topButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        messageTableView.delegate = self
        messageTableView.dataSource = self
        messageTableView.register(UINib(nibName: "MessageCell", bundle: nil) , forCellReuseIdentifier: "customMessageCell")
        messageTextfield.delegate = self
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector (tableViewTapped))
        
        messageTableView.addGestureRecognizer(tapGesture)
        
        
        configureTableView()
        
<<<<<<< HEAD

        retrieveMessages()
     
        messageTableView.separatorStyle = .none
   
=======
>>>>>>> 6b16244d910d3e6a0e435eb65ce95a2ba6bc8164
    }

    ///////////////////////////////////////////
    
<<<<<<< HEAD
    //MARK: - TableView Delegate Methods
=======
    //MARK: - TableView DataSource Methods
    
    
    
    //TODO: Declare cellForRowAtIndexPath here:
    
    
    
    //TODO: Declare numberOfRowsInSection here:
    
>>>>>>> 6b16244d910d3e6a0e435eb65ce95a2ba6bc8164
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "customMessageCell", for: indexPath) as! CustomMessageCell
        
        cell.messageBody.text = messageArray[indexPath.row].messageBody
        cell.senderUsername.text = messageArray[indexPath.row].sender
        cell.avatarImageView.image = UIImage(named: "egg")
        
        if cell.senderUsername.text == Auth.auth().currentUser?.email as String! {
            
            //Set background to blue if message is from logged in user.
            cell.avatarImageView.backgroundColor = UIColor.flatMint()
            cell.messageBackground.backgroundColor = UIColor.flatSkyBlue()
            
        } else {
            
            //Set background to grey if message is from another user.
            cell.avatarImageView.backgroundColor = UIColor.flatWatermelon()
            cell.messageBackground.backgroundColor = UIColor.flatGray()
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageArray.count
    }
    
    @objc func tableViewTapped() {
        messageTextfield.endEditing(true)
    }

    
    //TODO: Declare configureTableView here:
    
<<<<<<< HEAD
    func configureTableView() {
        messageTableView.rowHeight = UITableViewAutomaticDimension
        messageTableView.estimatedRowHeight = 120.0
        
=======
    
    
    ///////////////////////////////////////////
    
    //MARK:- TextField Delegate Methods
    
    
>>>>>>> 6b16244d910d3e6a0e435eb65ce95a2ba6bc8164

    }
    
    

    //MARK: - TextField Delegate Methods
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {

        
        UIView.animate(withDuration: 0.5) { 
            self.heightConstraint.constant = 308
            self.view.layoutIfNeeded()
        }
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.5) {
            self.heightConstraint.constant = 50
            self.view.layoutIfNeeded()
        }
    }

    
    ///////////////////////////////////////////
    
    
    //MARK: - Send & Recieve Messages from Firebase
    
    
<<<<<<< HEAD
=======
    
    
>>>>>>> 6b16244d910d3e6a0e435eb65ce95a2ba6bc8164
    @IBAction func sendPressed(_ sender: AnyObject) {
        
        messageTextfield.endEditing(true)
        messageTextfield.isEnabled = false
        sendButton.isEnabled = false
        
        let messagesDB = Database.database().reference().child("Messages")
        
        let messageDictionary = ["Sender": Auth.auth().currentUser?.email,
                                 "MessageBody": messageTextfield.text!]
        
        messagesDB.childByAutoId().setValue(messageDictionary) {
            (error, reference) in
            
            if error != nil {
                print(error!)
            }
            else {
                print("Message saved successfully!")
            }

            self.messageTextfield.isEnabled = true
            self.sendButton.isEnabled = true
            self.messageTextfield.text = ""
        
        
        }
        
        
    }
    
    
<<<<<<< HEAD
    func retrieveMessages() {
        
        let messageDB = Database.database().reference().child("Messages")
        
        messageDB.observe(.childAdded) { (snapshot) in
            
            let snapshotValue = snapshot.value as! Dictionary<String,String>
            let text = snapshotValue["MessageBody"]!
            let sender = snapshotValue["Sender"]!
            
            let message = Message()
            message.messageBody = text
            message.sender = sender
        
            self.messageArray.append(message)
        

                self.configureTableView()
                self.messageTableView.reloadData()
        
     
        
        }
        
    }

    
    ////////////////////////////////////////////////
=======

>>>>>>> 6b16244d910d3e6a0e435eb65ce95a2ba6bc8164
    
    //MARK - Log Out Method

    
<<<<<<< HEAD
    @IBAction func logOutPressed(_ sender: AnyObject) {
        
        do {
            try Auth.auth().signOut()
            
            navigationController?.popToRootViewController(animated: true)
            
        }
        catch {
            print("error: there was a problem logging out")
        }

=======
    
    @IBAction func logOutPressed(_ sender: AnyObject) {
        
        //TODO: Log out the user and send them back to WelcomeViewController
        
        
>>>>>>> 6b16244d910d3e6a0e435eb65ce95a2ba6bc8164
    }
    


}
