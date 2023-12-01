//
//  ViewController.swift
//  SwiftUI_UIKit2
//
//  Created by David Jardon on 1/12/23.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigateToHotelSwiftUI()
    }

    private func navigateToHotelSwiftUI() {
        let hotelView = HotelItemView(state: .init())
        let hostingController = UIHostingController(rootView: hotelView)
        navigationController?.pushViewController(hostingController, animated: true)
    }
}

