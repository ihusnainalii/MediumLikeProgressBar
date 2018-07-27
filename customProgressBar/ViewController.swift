//
//  ViewController.swift
//  customProgressBar
//
//  Created by Husnain on 27/07/2018.
//  Copyright © 2018 Husnain. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var btnChnageImage: UIButton!
    
    // MARK: - Variables
    var progressViewManager: MediumProgressViewManager?
    var isProfileImageSet = false
    
    // MARK: - view Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        progressViewManager = MediumProgressViewManager.sharedInstance
        progressViewManager?.duration = 4
        progressViewManager?.height = 2
        progressViewManager?.showProgress(window: headerView)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIApplication.shared.statusBarView?.backgroundColor = UIColor(red: 31/255, green: 162/255, blue: 200/255, alpha: 1.0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    // MARK: - view Did Load
    @IBAction func btnStartTapped(_ sender: UIButton) {
        progressViewManager?.showProgress(window: headerView)
    }
    @IBAction func btnStopTapped(_ sender: UIButton) {
        progressViewManager?.hide()
    }
    @IBAction func btnChnageImageTapped(_ sender: UIButton) {
        isProfileImageSet = !isProfileImageSet
        if isProfileImageSet {
            progressViewManager?.hide()
            progressViewManager?.showProgress(window: btnChnageImage)
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                self.progressViewManager?.hide()
                self.profileImage.image =  #imageLiteral(resourceName: "Contact-icon")
            }
        }else{
            self.profileImage.image =  #imageLiteral(resourceName: "user")
        }
    }
    
    
}

