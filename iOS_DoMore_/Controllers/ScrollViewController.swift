//
//  ScrollViewController.swift
//  iOS_DoMore_
//
//  Created by kim jong moon on 02/02/2021.
//

import UIKit

class ScrollViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        initViews()
    }
    
    func initViews() {
        
        addNavigationBar()
          
    }


    func addNavigationBar() {
        // Bar Icons :)
        let back = UIImage(named: "ic_Back_Black")

        navigationItem.leftBarButtonItem = UIBarButtonItem(image: back, style: .plain, target: self, action: #selector(Back_BTapped))
        title = "Scroll View"
    }
    // MARK: - Actions
    @objc func Back_BTapped() {
        navigationController?.popViewController(animated: true)
    }

}
