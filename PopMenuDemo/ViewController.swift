//
//  ViewController.swift
//  PopMenuDemo
//
//  Created by mac on 2025/3/10.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func topRight(_ sender: UIButton) {
        showPopMenu(sender)
    }
    
    @IBAction func center(_ sender: UIButton) {
        showPopMenu(sender)
    }
    @IBAction func bottomRight(_ sender: UIButton) {
        showPopMenu(sender)
    }
    @IBAction func bottomLeft(_ sender: UIButton) {
        showPopMenu(sender)
    }
    
    func showPopMenu(_ sourceView: UIButton) {
        let controller = PopMenuViewController(sourceView: sourceView, actions: [
            PopMenuDefaultAction(title: "Click me to", image: nil, color: .yellow),
            PopMenuDefaultAction(title: "Pop another menu", image: nil, color: #colorLiteral(red: 0.9816910625, green: 0.5655395389, blue: 0.4352460504, alpha: 1)),
            PopMenuDefaultAction(title: "Try it out!", image: nil, color: .white)
        ])
        
        // Customize appearance
        controller.appearance.popMenuFont = UIFont(name: "AvenirNext-DemiBold", size: 16)!
        controller.appearance.popMenuBackgroundStyle = .none()
        // Configure options
        controller.shouldDismissOnSelection = false
//        controller.delegate = self
        
        controller.didDismiss = { selected in
            print("Menu dismissed: \(selected ? "selected item" : "no selection")")
        }
        
        // Present menu controller
        present(controller, animated: true, completion: nil)
    }
}

