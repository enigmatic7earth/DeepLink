//
//  ViewController.swift
//  DeepLink-demo
//
//  Created by NETBIZ on 10/08/18.
//  Copyright © 2018 Netbiz.in. All rights reserved.
//

import UIKit

// MARK:Enum ProfileType
enum ProfileType: String {
    case guest = "Guest" // default
    case host = "Host"
}

class ViewController: UIViewController {
    var currentProfile = ProfileType.guest

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureFor(profileType: currentProfile)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPressSwitchProfile(_ sender: Any) {
        currentProfile = currentProfile == .guest ? .host : .guest
        configureFor(profileType: currentProfile)
    }
    
    func configureFor(profileType: ProfileType) {
        title = profileType.rawValue
        ShortcutParser.shared.registerShortcuts(for: profileType)
    }


}

