//
//  ViewController.swift
//  SFAuthenticationSessionSample
//
//  Created by Hirohisa Kawasaki on 10/10/19.
//  Copyright © 2019 Hirohisa Kawasaki. All rights reserved.
//

import UIKit
import SafariServices

class ViewController: UIViewController {

    var authSession: SFAuthenticationSession?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func showAuthPage() {
        let url = URL(string:"http://127.0.0.1:3000/auth")!
        let callbackURLScheme = "sfauth-sample"

        authSession = SFAuthenticationSession(
            url: url,
            callbackURLScheme: callbackURLScheme,
            completionHandler: { (callbackURL, error) in
                if let callbackURL = callbackURL {
                    print("callbackURL: \(callbackURL)")
                    print(HTTPCookieStorage.shared.cookies)
                }
        })

        authSession?.start()
    }

}

