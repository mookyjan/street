//
//  STStoriesBeginViewController.swift
//  STREET
//
//  Created by Ahmad on 26/10/2016.
//  Copyright © 2016 DevBatch. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces

class STStoriesBeginViewController: BaseViewController, GMSMapViewDelegate, CLLocationManagerDelegate,UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate {

  
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var btnHere: UIButton!
    var searchBar : UISearchBar!
    @IBOutlet weak var mapView: GMSMapView!
    var locationManager = CLLocationManager()
    // MARK:
    // MARK : UIViewController Lifecycle
    // MARK : -
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        //Initializations
        initializations()
//        locationSearchBar.hidden = true
        tableView.hidden = true
        
        //SetupView
        setUpView()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(STStoriesBeginViewController.keyboardWillHide(_:)), name: UIKeyboardWillHideNotification, object: nil)
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillDisappear(animated : Bool)
    {
        super.viewWillDisappear(animated)
    }
    
    func setUpView()
    {
        self.view.layoutIfNeeded()
        self.setupNavigationBarTitle("My Story Begins", showRightButton: true, leftButtonType:.Back, rightButtonType:.Search)
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()

        
    }
    
    func initializations()
    {
       
    }

    override func leftNavigationButtonClicked(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    override func rightNavigationButtonClicked(sender: AnyObject) {
        showTableView()
    }
    @IBAction func btnHerePressed(sender: AnyObject) {
        let createNewStoryStausVC = self.storyboard?.instantiateViewControllerWithIdentifier("STCreateNewStorieViewController")
        self.navigationController!.pushViewController(createNewStoryStausVC!, animated: true)
        
    }
    
    
    
    // MARK:
    // MARK : LocationManager Delegate
    // MARK : -
    
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        // 3
        if status == .AuthorizedAlways {
            
            // 4
            locationManager.startUpdatingLocation()
            
            //5
            mapView.myLocationEnabled = true
            //  mapView.settings.myLocationButton = true
        }
    }
    
    // 6
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            
            mapView.camera = GMSCameraPosition.cameraWithLatitude((location.coordinate.latitude),
                                                                  longitude:(location.coordinate.longitude), zoom:12)
            let marker = GMSMarker()
            marker.position = CLLocationCoordinate2DMake((location.coordinate.latitude), (location.coordinate.longitude))
            //                    marker.appearAnimation = kGMSMarkerAnimationPop
            marker.icon = UIImage(named: "location-image2")
            marker.map = mapView
            locationManager.stopUpdatingLocation()
        }
        
    }
    // MARK: - Table View Delegate -
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 10
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell =  tableView.dequeueReusableCellWithIdentifier("STStoriesBeginTableViewCell")! as UITableViewCell
        return cell
    }
    
    // MARK: - UI SearchBar Delegate -
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        hideTableView()
        
    }
    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
//        showTableView()
    }
    // MARK: - Custome Methods -
    
    func showTableView() {
        self.setupNavigationBarTitle("My Story Begins", showRightButton: false , leftButtonType:.None, rightButtonType:.None)
        searchBar = UISearchBar(frame: CGRectMake(8, 0, ((self.navigationController?.navigationBar.bounds.width)! - 8.0), 44))
        searchBar.showsCancelButton = true
        searchBar.delegate = self
//        self.navigationItem.titleView = searchBar
        self.navigationController?.navigationBar.addSubview(searchBar)
        
        tableView.hidden = false
        btnHere.hidden = true
        searchBar.showsCancelButton = true
        searchBar.becomeFirstResponder()
    }
    
    func hideTableView () {
        self.view.endEditing(true)
        self.setupNavigationBarTitle("My Story Begins", showRightButton: true, leftButtonType:.Back, rightButtonType:.Search)
        let label = UILabel(frame: CGRectMake(0, 0, 150, 30))
        label.text = "My Story Begins"
        label.font = UIConfiguration.getUIFONTBOLD(18)
        label.textColor = UIColor.whiteColor()
        self.navigationItem.titleView = label
        tableView.hidden = true
        btnHere.hidden = false
        searchBar.removeFromSuperview()
    }
    
    func keyboardWillHide(notification:NSNotification)  {
//        hideTableView()
    }
}
