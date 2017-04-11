//
//  STStoriesAndMeetUpDetailViewController.swift
//  STREET
//
//  Created by Shuja on 11/11/2016.
//  Copyright © 2016 DevBatch. All rights reserved.
//

import UIKit

class STStoriesAndMeetUpDetailViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    // MARK: - View Controller Life Cycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.registerNib(UINib(nibName: "STStoriesAndMeetUpDetailCell", bundle: nil), forCellReuseIdentifier: "STStoriesAndMeetUpTableViewCellIdentifier")
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 250
        setUpView()
        initializations()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
         super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    func setUpView() {
        self.navigationController?.navigationBar.hidden = true
        
    }
    
    func initializations () {
    
    }
    
    // MARK: - Table View Delegate -

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // 1
        // Return the number of sections.
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 2
        return 3
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "STStoriesAndMeetUpTableViewCellIdentifier";
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as? STStoriesAndMeetUpTableViewCell
        
        if indexPath.row == 2 {
            cell?.lbl_UserComment.text = "ajskhfsjkadfh jsahdfjklsdahfksjldh ajsdhfdsajkfhsd fadhskjfhsadkljhf sdaljkfhsdajkhfdjkshfjksdhfkjhsadjkfhadjkshfkjdsahfjksdhfkjsadhfkjsdahfkjdhs asdjkfhsadjkfhadjkshfadjsfhas dhfajkdsfhksadj fkjasdhfkjsdah fjksd hfkjlsadhkfj hsdkjfhkjsadhfjksdahjkfhdsjkfh kjdsafhsakdjlfhksjldahfsdjkahf kjsdahfkjsdah fjksda hfkjsdahfjsadhkjfsadhljkfhslajkdhfkjsadhfsdjhfkjsdhflkjds"
            
        }
        return cell!;
    }
}
