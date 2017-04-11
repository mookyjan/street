//
//  STMapViewController.swift
//  SampleProject
//
//  Created by Waris Shams on 23/09/2016.
//  Copyright © 2016 DevBatch. All rights reserved.
//

import UIKit
import GoogleMaps
import Contacts
import ContactsUI
import GooglePlaces

class STMapViewController: BaseViewController , CLLocationManagerDelegate, GMSMapViewDelegate , UITableViewDelegate , UITableViewDataSource  {

    @IBOutlet weak var viewOfSocial: UIView!
    @IBOutlet weak var mapView: GMSMapView!
    var locationManager = CLLocationManager()
    var contacts = [CNContact]()
    @IBOutlet weak var btnStreet_Pressed: UIButton!
    @IBOutlet weak var btnFacebook_Pressed: UIButton!
    @IBOutlet weak var btnGoogle_Pressed: UIButton!
    @IBOutlet weak var btnPhone_Pressed: UIButton!
    @IBOutlet weak var viewOfPop: UIView!
    @IBOutlet weak var searchLocation: UISearchBar!
    @IBOutlet weak var tblView: UITableView!
    var searchActive : Bool = false

    // MARK:
    // MARK : UIViewController Lifecycle
    // MARK : -
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        //Initializations
        viewOfSocial.hidden = true
        searchLocation.hidden =  true
        viewOfPop.hidden = true


//        locationManager.delegate = self
//        locationManager.requestWhenInUseAuthorization()
        
         mapView.delegate = self;
        
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
            self.contacts = self.findContacts()
            
            dispatch_async(dispatch_get_main_queue()) {
//                self.tableView!.reloadData()
            }
        }

        initializations()
        //SetupView
        setUpView()
    }
    
    override func viewWillAppear(animated: Bool)
    {
        
    }
    
    override func viewDidAppear(animated: Bool) {
        
    }
    
    override func viewWillDisappear(animated : Bool)
    {
        
    }
    
       
    func setUpView()
    {
        self.view.layoutIfNeeded()
        self.setupNavigationBarTitle("MAP", showRightButton: true, leftButtonType:.None, rightButtonType:.Done)
//      
        locationManager = CLLocationManager()
        locationManager.delegate = self;
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
//
        
    }
    
    func initializations()
    {
    
    }
    
    // MARK:
    // MARK : Contact Find
    // MARK : -

    func findContacts() -> [CNContact] {
        let store = CNContactStore()
        
        let keysToFetch = [CNContactFormatter.descriptorForRequiredKeysForStyle(.FullName),
                           CNContactImageDataKey,
                           CNContactPhoneNumbersKey]
        
        let fetchRequest = CNContactFetchRequest(keysToFetch: keysToFetch)
        
        var contacts = [CNContact]()
        
        do {
            try store.enumerateContactsWithFetchRequest(fetchRequest, usingBlock: { (let contact, let stop) -> Void in
                contacts.append(contact)
            })
        }
        catch let error as NSError {
            print(error.localizedDescription)
        }
        
        return contacts
    }

    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    // MARK:
    // MARK : rightNavigationBar Delegate
    // MARK : -

    override func rightNavigationButtonClicked(sender: AnyObject)
    {
//    self.navigationController?.navigationBarHidden = true
    self.navigationItem.titleView = searchLocation;

    viewOfSocial.hidden = false
    searchLocation.hidden = false
    }
    
    
    // MARK:
    // MARK : button Action 
    // MARK : -

    @IBAction func btnPhoneContact(sender: UIButton)
    {
        
        sender.selected = !sender.selected
        viewOfPop.hidden = true
        searchActive = true
        searchLocation.text = nil
        
        btnFacebook_Pressed.selected = false
        btnGoogle_Pressed.selected = false
        btnStreet_Pressed.selected = false
        let vcOfContact = self.storyboard?.instantiateViewControllerWithIdentifier("STPhoneContactViewController")
        self.navigationController?.pushViewController(vcOfContact!, animated: true)
        


    
    }
    
    @IBAction func btnGooglePlusContact(sender: UIButton)
    {
        sender.selected = !sender.selected
        btnFacebook_Pressed.selected = false
        btnStreet_Pressed.selected = false
        btnPhone_Pressed.selected = false

    }
    
    @IBAction func btnFacebook(sender: UIButton)
    {
        sender.selected = !sender.selected
        btnGoogle_Pressed.selected = false
        btnStreet_Pressed.selected = false
        btnPhone_Pressed.selected = false

    
    }
    @IBAction func btnStreetUser(sender: UIButton)
    {
        sender.selected = !sender.selected
        btnGoogle_Pressed.selected = false
        btnFacebook_Pressed.selected = false
        btnPhone_Pressed.selected = false
    

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
    
    // MARK:
    // MARK : TableView DataSource
    // MARK : -
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 5
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell =  tableView.dequeueReusableCellWithIdentifier("popTableView")! as UITableViewCell
        return cell
    }
    // MARK:
    // MARK : SearchBarDelegateMethod
    // MARK : -
    
    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
     viewOfPop.hidden = false
     searchActive = true
        
    }
    
    
    
}
